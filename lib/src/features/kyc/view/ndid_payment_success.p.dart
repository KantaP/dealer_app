import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_payment_success.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/currency.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

class NdidPaymentSuccessView extends CustomView<NdidPaymentSuccessViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const NdidPaymentSuccessView(this.kycLevel2ViewModel,
      {required NdidPaymentSuccessViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<NdidPaymentSuccessView, NdidPaymentSuccessViewModel>
      createState() => _NdidPaymentSuccessViewState(viewModel);
}

class _NdidPaymentSuccessViewState
    extends ViewState<NdidPaymentSuccessView, NdidPaymentSuccessViewModel> {
  _NdidPaymentSuccessViewState(super.viewModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSlipForSave(),
            ],
          ),
          Container(
            color: whiteColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSlip(),
                const SizedBox(
                  height: 40,
                ),
                _buildSaveButton(),
                const SizedBox(
                  height: 10,
                ),
                _buildNextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlip({String? mode = 'front'}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Spacing.spacing10),
          child: Center(
            child: Image.asset(
              (mode == 'front')
                  ? AssetImages.paymentSlipHeader
                  : AssetImages.paymentSlipHeaderBlack,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: Spacing.spacing12,
              left: Spacing.spacing10,
              right: Spacing.spacing10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(0, 1),
                  color: blueColor.withOpacity(0.1),
                )
              ],
              image: const DecorationImage(
                image: AssetImage(AssetImages.paymentSlipPager),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SvgPicture.asset(AssetSvg.paymentSuccess),
                      ),
                      Center(
                        child: Text(
                          S.of(context).ndidPaymentSuccessHeadline,
                          style: titleStyle?.copyWith(color: lightGreenColor),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          '01-12-2022 , 12:30',
                          style: paragraph2LightStyle?.copyWith(
                              color: darkGreyColor),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${S.of(context).ndidPaymentSuccessRef} 123456',
                          style: paragraph2Style?.copyWith(color: midGreyColor),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: SvgPicture.asset(AssetSvg.dashDivider),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          S.of(context).ndidPaymentSuccessTotalLabel,
                          style: paragraph1RegularStyle?.copyWith(
                              color: darkGreyColor),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          CurrencyUtils.toTHB(130),
                          style: headline4Style?.copyWith(color: blueColor),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: SvgPicture.asset(AssetSvg.dashDivider),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildServiceFee(),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: SvgPicture.asset(AssetSvg.dashDivider),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildPaymentQrCode(),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: (mode == 'front')
                            ? blueColor.withOpacity(0.1)
                            : blueColor,
                        offset: const Offset(0, 0),
                      )
                    ],
                  ),
                  child: Image.asset(AssetImages.paymentSlipFooter),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceFee() {
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
            '130.00 THB',
            style: paragraph1LightStyle,
          ),
        )
      ],
    );
  }

  Widget _buildPaymentQrCode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).ndidPaymentSuccessHowToLabel,
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
        ),
        // Container(
        //   decoration: BoxDecoration(
        //     border: Border.all(width: 1, color: midGreyColor),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(10),
        //     child: Column(
        //       children: [
        //         SizedBox(
        //           width: 50,
        //           height: 50,
        //           child: Image.asset(AssetImages.mockQrCode),
        //         ),
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         Text(
        //           S.of(context).ndidPaymentSuccessScan,
        //           style: paragraph3Style,
        //         )
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        viewModel.exportSlip();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.download),
          const SizedBox(
            width: 12.5,
          ),
          Text(S.of(context).saveSlipButton)
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return TextButton(
      onPressed: () {
        viewModel.next();
        widget.kycLevel2ViewModel.pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      child: Text(S.of(context).nextButton),
    );
  }

  Widget _buildSlipForSave() {
    return RepaintBoundary(
      key: viewModel.slipForSaveKey,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetImages.paymentSlipBg),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            right: 10,
            left: 10,
            bottom: 10,
          ),
          child: _buildSlip(mode: 'back'),
        ),
      ),
    );
  }
}
