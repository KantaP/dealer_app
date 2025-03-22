import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/widgets/warning_text_box.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_intro.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

import '../../../core/navigator_service.dart';

class NdidIntroView extends CustomView<NdidIntroViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const NdidIntroView(this.kycLevel2ViewModel,
      {required NdidIntroViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<NdidIntroView, NdidIntroViewModel> createState() =>
      _NdidIntroViewState(viewModel);
}

class _NdidIntroViewState extends ViewState<NdidIntroView, NdidIntroViewModel> {
  _NdidIntroViewState(super.viewModel);

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
            text: S.current.ndidIntroHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          _buildStepBox(1, S.of(context).ndidIntroStep1),
          const SizedBox(
            height: Spacing.spacing16,
          ),
          _buildStepBox(2, S.of(context).ndidIntroStep2),
          const SizedBox(
            height: Spacing.spacing16,
          ),
          _buildStepBox(3, S.of(context).ndidIntroStep3),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          WarningTextBox(text: S.of(context).ndidWarningMessage),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          Center(
            child: Text(
              S.of(context).ndidIntroContact,
              style: paragraph2Style?.copyWith(color: midGreyColor),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: Spacing.spacing40,
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
                width: Spacing.spacing20,
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

  Widget _buildStepBox(int number, String detail) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: midGreyColor),
        borderRadius: BorderRadius.circular(20),
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
              width: 10,
            ),
            Flexible(
              child: HilightText(
                text: detail,
                hilightStyle:
                    paragraph1RegularStyle?.copyWith(color: blueColor),
                normalStyle:
                    paragraph1RegularStyle?.copyWith(color: darkGreyColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
