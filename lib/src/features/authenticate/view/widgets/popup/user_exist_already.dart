import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';

Future<void> showUserExistAlreadyPopup() async {
  DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (_) => const UserExistAlreadyPopup());
}

class UserExistAlreadyPopup extends StatelessWidget {
  const UserExistAlreadyPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialogAlert(
      title: Text(
        S.current.existUserAlreadyPopupTitle,
        style: titleStyle,
      ),
      descriptions: Text(
        S.current.existUserAlreadyPopupDesc,
        style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
        textAlign: TextAlign.center,
      ),
      submitButton: ElevatedButton(
        onPressed: () {
          NavigationService.back(NavigationResult(null));
        },
        child: Text(S.current.okButton),
      ),
    );
  }
}
