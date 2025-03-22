import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_selfie_intro.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class KycSelfieIntroView extends CustomView<KycSelfieIntroViewModel> {
  const KycSelfieIntroView(
      {required KycSelfieIntroViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<KycSelfieIntroView, KycSelfieIntroViewModel> createState() =>
      _KycSelfieIntroViewState(viewModel);
}

class _KycSelfieIntroViewState
    extends ViewState<KycSelfieIntroView, KycSelfieIntroViewModel> {
  _KycSelfieIntroViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacing24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HilightText(
              text: S.of(context).kycSelfieIntroHeadline,
              hilightStyle: headline4BoldStyle?.merge(
                const TextStyle(color: blueColor),
              ),
              normalStyle: headline4LightStyle,
            ),
            const SizedBox(
              height: Spacing.spacing40,
            ),
            Text(
              S.of(context).kycSelfieIntroContent,
              style: paragraph1LightStyle,
            ),
            const SizedBox(
              height: Spacing.spacing40,
            ),
            Assets.images.selfieWarning1.image(width: 342),
            const SizedBox(
              height: Spacing.spacing40,
            ),
            // Assets.images.selfieWarning2.image(width: 342),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Spacing.spacing32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.selfieIntroTitle,
                    style: titleStyle?.copyWith(color: blueColor),
                  ),
                  const SizedBox(
                    height: Spacing.spacing20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Assets.vectorIcons.kycHatIcon
                            .svg(width: 40, height: 40),
                      ),
                      const SizedBox(
                        width: Spacing.spacing20,
                      ),
                      HilightText(
                        text: S.current.selfieIntroText1,
                        hilightStyle:
                            paragraph1RegularStyle?.copyWith(color: redColor),
                        normalStyle: paragraph1RegularStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: Spacing.spacing8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Assets.vectorIcons.kycMaskIcon
                            .svg(width: 40, height: 40),
                      ),
                      const SizedBox(
                        width: Spacing.spacing20,
                      ),
                      HilightText(
                        text: S.current.selfieIntroText2,
                        hilightStyle:
                            paragraph1RegularStyle?.copyWith(color: redColor),
                        normalStyle: paragraph1RegularStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: Spacing.spacing8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Assets.vectorIcons.kycGlassIcon
                            .svg(width: 40, height: 40),
                      ),
                      const SizedBox(
                        width: Spacing.spacing20,
                      ),
                      HilightText(
                        text: S.current.selfieIntroText3,
                        hilightStyle:
                            paragraph1RegularStyle?.copyWith(color: redColor),
                        normalStyle: paragraph1RegularStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: Spacing.spacing8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Assets.vectorIcons.kycFaceIcon
                            .svg(width: 40, height: 40),
                      ),
                      const SizedBox(
                        width: Spacing.spacing20,
                      ),
                      HilightText(
                        text: S.current.selfieIntroText4,
                        hilightStyle:
                            paragraph1RegularStyle?.copyWith(color: redColor),
                        normalStyle: paragraph1RegularStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: Spacing.spacing8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Assets.vectorIcons.kycNightIcon
                            .svg(width: 40, height: 40),
                      ),
                      const SizedBox(
                        width: Spacing.spacing20,
                      ),
                      HilightText(
                        text: S.current.selfieIntroText5,
                        hilightStyle:
                            paragraph1RegularStyle?.copyWith(color: redColor),
                        normalStyle: paragraph1RegularStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: Spacing.spacing8,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: Spacing.spacing20,
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.next();
              },
              child: Text(
                S.current.kycSelfieIntroButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
