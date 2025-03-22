import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

import '../../../../../core/navigator_service.dart';
import '../../../../../core/translate/generated/l10n.dart';
import '../../../../../theme/custom_theme.dart';
import '../../../../../utilities/dialog.dart';
import '../../../../../widgets/custom_dialog_box.dart';

Future<void> showForgotPinAlert() async {
  DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (_) => const ForgotPinAlertDialog());
}

class ForgotPinAlertDialog extends StatelessWidget {
  const ForgotPinAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthenticateBinding.authenticationFirebaseService;
    return CustomDialogAlert(
      title: Text(
        S.current.forgotPinAlertTitle,
        style: titleStyle,
      ),
      descriptions: Text(
        S.current.forgotPinAlertDesc,
        style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
        textAlign: TextAlign.center,
      ),
      submitButton: ElevatedButton(
        onPressed: () {
          // NavigationService.back(NavigationResult(null));
          authService.signOut();
          NavigationService.toReplacementAllNamed(RoutesConstant.welcomBack);
        },
        child: Text(S.current.logoutButton),
      ),
      optionalButton: Center(
        child: GestureDetector(
          onTap: () {
            NavigationService.back(NavigationResult(null));
          },
          child: Text(
            S.current.backButton,
            style: textInButtonStyle?.copyWith(
                decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}
