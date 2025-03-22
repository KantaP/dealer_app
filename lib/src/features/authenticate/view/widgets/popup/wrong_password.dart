import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';

Future<void> showWrongPasswordPopup() async {
  DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (_) => const WrongPassword());
}

class WrongPassword extends StatelessWidget {
  const WrongPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialogAlert(
      title: Text(
        'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
        style: titleStyle,
      ),
      descriptions: const SizedBox(
        height: 0,
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
