import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/pre_knowledge.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:flutter/widgets.dart';

import '../../../constants/spacing.dart';

class PreKnowledgeView extends CustomView<PreKnowledgeViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const PreKnowledgeView(this.kycLevel2ViewModel,
      {required PreKnowledgeViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _PreKnowledgeViewState createState() => _PreKnowledgeViewState(viewModel);
}

class _PreKnowledgeViewState
    extends ViewState<PreKnowledgeView, PreKnowledgeViewModel> {
  _PreKnowledgeViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycViewModel(widget.kycLevel2ViewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          HilightText(
            text: S.current.preKnowledgeTestHeadline,
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
              children: [
                Text(
                  S.current.preKnowledgeTestDescription,
                  style: paragraph1LightStyle,
                  textAlign: TextAlign.center,
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
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 250),
                            child: Text(
                              S.current.preKnowledgeTestStep1,
                              style: paragraph2Style?.copyWith(
                                  color: darkGreyColor),
                            ),
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
                      Assets.vectorIcons.quizIntro2.svg(),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 250),
                            child: Text(
                              S.current.preKnowledgeTestStep2,
                              style: paragraph2Style?.copyWith(
                                  color: darkGreyColor),
                            ),
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
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 250),
                            child: Text(
                              S.current.preKnowledgeTestStep3,
                              style: paragraph2Style?.copyWith(
                                  color: darkGreyColor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
