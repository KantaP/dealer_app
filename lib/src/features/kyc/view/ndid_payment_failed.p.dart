import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_payment_failed.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/currency.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class NdidPaymentFailedView extends CustomView<NdidPaymentFailedViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const NdidPaymentFailedView(this.kycLevel2ViewModel,
      {required NdidPaymentFailedViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<NdidPaymentFailedView, NdidPaymentFailedViewModel> createState() =>
      _NdidPaymentFailedViewState(viewModel);
}

class _NdidPaymentFailedViewState
    extends ViewState<NdidPaymentFailedView, NdidPaymentFailedViewModel> {
  _NdidPaymentFailedViewState(super.viewModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.ndidPaymentFailedHeader,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '01-12-2022 , 12:30',
            style: paragraph2Style?.copyWith(color: darkGreyColor),
          ),
          Text(
            '${S.current.ndidPaymentFailedRef} 010221231422',
            style: paragraph1RegularStyle?.copyWith(color: midGreyColor),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: dividerColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            S.current.ndidPaymentFailedCancelSection,
            style: paragraph1LightStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildCancellationReason(),
          const SizedBox(
            height: 20,
          ),
          _buildCancellationServiceFee(),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: dividerColor,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildCancellationTotal(),
          const SizedBox(
            height: 20,
          ),
          _buildCancellationPaymentQrPromptPay(),
          const SizedBox(
            height: 110,
          ),
          Text(
            S.current.ndidPaymentFailedTryAgainLabel,
            style: paragraph1LightStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // widget.kycLevel2ViewModel.pageController.previousPage(
                    //     duration: const Duration(milliseconds: 500),
                    //     curve: Curves.easeOut);
                  },
                  child: Text(
                    S.current.cancelButton,
                  ),
                ),
              ),
              const SizedBox(
                width: 21,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // viewModel.next();
                    // widget.kycLevel2ViewModel.pageController.nextPage(
                    //     duration: const Duration(milliseconds: 500),
                    //     curve: Curves.easeIn);
                    // viewModel.paymentAgain();
                  },
                  child: Text(
                    S.current.paymentTryAgainButton,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }

  Widget _buildCancellationReason() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).ndidPaymentFailedCancelReasonLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            'คุณไม่ได้ชำระในเวลาที่กำหนด',
            style: paragraph1LightStyle,
            softWrap: true,
            maxLines: 3,
          ),
        )
      ],
    );
  }

  Widget _buildCancellationServiceFee() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).ndidPaymentFailedServiceFeeLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            '140.00 THB',
            style: paragraph1LightStyle,
          ),
        )
      ],
    );
  }

  Widget _buildCancellationTotal() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).ndidPaymentFailedTotalLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            CurrencyUtils.toTHB(140),
            style: paragraph1RegularStyle?.copyWith(color: blueColor),
          ),
        )
      ],
    );
  }

  Widget _buildCancellationPaymentQrPromptPay() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).ndidPaymentFailedHowToLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AssetSvg.propmtpay),
            const SizedBox(
              width: 5,
            ),
            Text(
              'QR พร้อมเพย์',
              style: paragraph2Style?.copyWith(color: darkGreyColor),
            )
          ],
        )
      ],
    );
  }
}
