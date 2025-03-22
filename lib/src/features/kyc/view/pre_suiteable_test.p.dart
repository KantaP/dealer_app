import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/pre_suiteable_test.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:flutter/widgets.dart';

import '../../../core/gen/assets.gen.dart';

class PreSuiteableTestView extends CustomView<PreSuiteableTestViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const PreSuiteableTestView(this.kycLevel2ViewModel,
      {required PreSuiteableTestViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _PreSuiteableTestViewState createState() =>
      _PreSuiteableTestViewState(viewModel);
}

class _PreSuiteableTestViewState
    extends ViewState<PreSuiteableTestView, PreSuiteableTestViewModel> {
  _PreSuiteableTestViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycViewModel(widget.kycLevel2ViewModel);
    viewModel.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.kycPreSuiteableTestHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: Image.asset(AssetImages.knowledge),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: Spacing.spacing12, right: Spacing.spacing12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.current.kycPreSuiteableTestSubTitle,
                  style: paragraph1LightStyle,
                ),
                const SizedBox(
                  height: Spacing.spacing20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Spacing.spacing10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.vectorIcons.quizIntro1.svg(),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Text(
                            S.current.preSuiteTestStep1,
                            style:
                                paragraph2Style?.copyWith(color: darkGreyColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Spacing.spacing10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.vectorIcons.quizIntro2.svg(),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Text(
                            S.current.preSuiteTestStep2,
                            style:
                                paragraph2Style?.copyWith(color: darkGreyColor),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Spacing.spacing10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.vectorIcons.quizIntro3.svg(),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Text(
                            S.current.preSuiteTestStep3,
                            style:
                                paragraph2Style?.copyWith(color: darkGreyColor),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // const Spacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewModel.next();
                  },
                  child: Text(
                    S.current.startEvaluationFormButton,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
