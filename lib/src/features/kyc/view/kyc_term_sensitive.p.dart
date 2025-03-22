import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_term_sensitive.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_new.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:flutter/material.dart';

class KycTermSensitiveView extends CustomViewScreen<KycTermSensitiveViewModel> {
  const KycTermSensitiveView(
      {super.key, required KycTermSensitiveViewModel viewModel})
      : super.model(viewModel);

  @override
  CustomViewState<KycTermSensitiveView, KycTermSensitiveViewModel>
      createState() => _KycTermSensitiveViewState(viewModel);
}

class _KycTermSensitiveViewState
    extends CustomViewState<KycTermSensitiveView, KycTermSensitiveViewModel> {
  _KycTermSensitiveViewState(super.viewModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.kycTermSensitiveTitle,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          FutureBuilder<String>(
            future: viewModel.loadDoc(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data ?? '');
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
