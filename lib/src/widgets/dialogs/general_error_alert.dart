import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';

Future<void> showGeneralErrorAlert() async {
  return DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (_) => const GeneralErrorAlert());
}

class GeneralErrorAlert extends StatelessWidget {
  const GeneralErrorAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialogAlert(
      title: Text(
        S.of(context).noticeDialogTitle,
        style: titleStyle,
      ),
      descriptions: Text(
        S.of(context).somethingWentWrong,
        style: paragraph2Style,
      ),
      submitButton: ElevatedButton(
        onPressed: () {
          NavigationService.navigatorKey.currentState!.pop();
        },
        child: Text(S.of(context).submitButton),
      ),
    );
  }
}
