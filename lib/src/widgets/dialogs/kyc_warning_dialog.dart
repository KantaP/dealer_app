import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/dialogs/di/kyc_warning_dialog.vm.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../custom_dialog_box.dart';

Future<void> openKycWarningDialog() async {
  DialogUtils.customShowDialog(
    context: NavigationService.navigatorKey.currentContext!,
    dialog: (context) => const KycWarningDialog(),
  );
}

class KycWarningDialog extends StatelessWidget {
  const KycWarningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialogAlert(
      title: Text(
        S.of(context).kycWarningTitle,
        style: titleStyle,
      ),
      descriptions: HilightText(
        text: S.of(context).kycWarningContent,
        hilightStyle: paragraph1RegularStyle?.copyWith(color: blueColor),
        normalStyle: paragraph1RegularStyle?.copyWith(color: termsColor),
        textAlign: TextAlign.center,
      ),
      submitButton: ElevatedButton(
        onPressed: () {
          Future.delayed(Duration.zero, () {
            NavigationService.toReplacementWithNamed(RoutesConstant.kycAll);
          });
        },
        child: Text(
          S.current.gotoKycButton,
          style: textInButtonStyle?.copyWith(color: whiteColor),
        ),
      ),
      optionalButton: Center(
        child: GestureDetector(
          onTap: () {
            Future.delayed(
              Duration.zero,
              () {
                NavigationService.back(NavigationResult(null));
              },
            );
          },
          child: SizedBox(
            height: 50,
            child: Text(
              S.of(context).laterButton,
              style: textInButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}
