import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_intro_counterservice.vm.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class NdidIntroCounterServiceView
    extends CustomView<NdidIntroCounterServiceViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const NdidIntroCounterServiceView(this.kycLevel2ViewModel,
      {required NdidIntroCounterServiceViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<NdidIntroCounterServiceView, NdidIntroCounterServiceViewModel>
      createState() => _NdidIntroCounterServiceState(viewModel);
}

class _NdidIntroCounterServiceState extends ViewState<
    NdidIntroCounterServiceView, NdidIntroCounterServiceViewModel> {
  _NdidIntroCounterServiceState(super.viewModel);

  @override
  void initState() {
    super.initState();
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.ndidIntroductionCounterServiceHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildStepBox(1, S.of(context).ndidIntroductionCounterServiceList1),
          const SizedBox(
            height: 16,
          ),
          _buildStepBox(
            2,
            S.of(context).ndidIntroductionCounterServiceList2,
          ),
          const SizedBox(
            height: 16,
          ),
          _buildStepBox(
            3,
            S.of(context).ndidIntroductionCounterServiceList3,
            actionButton: GestureDetector(
              onTap: () {
                viewModel.openCompanyMap();
              },
              child: Text(
                S.of(context).ndidIntroductionCounterServiceMap,
                style: paragraph1RegularStyle?.copyWith(
                    color: softBlue, decoration: TextDecoration.underline),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          _buildStepBox(4, S.of(context).ndidIntroductionCounterServiceList4),
          const SizedBox(
            height: 16,
          ),
          _buildStepBox(5, S.of(context).ndidIntroductionCounterServiceList5),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              S.of(context).ndidIntroContact,
              style: paragraph2Style?.copyWith(color: midGreyColor),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    viewModel.cancel();
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
                    viewModel.next();
                  },
                  child: Text(
                    S.current.ndidStartButton,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: paddingBottom(),
          )
        ],
      ),
    );
  }

  Widget _buildStepBox(int number, String detail, {Widget? actionButton}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: midGreyColor),
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: blueColor),
              child: Center(
                child: Text(
                  number.toString(),
                  style: titleStyle?.copyWith(color: whiteColor),
                ),
              ),
            ),
            const SizedBox(
              width: Spacing.spacing10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: HilightText(
                      text: detail,
                      hilightStyle:
                          paragraph1RegularStyle?.copyWith(color: blueColor),
                      normalStyle: paragraph1RegularStyle?.copyWith(
                          color: darkGreyColor),
                    ),
                  ),
                  const SizedBox(
                    height: Spacing.spacing10,
                  ),
                  actionButton ?? Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
