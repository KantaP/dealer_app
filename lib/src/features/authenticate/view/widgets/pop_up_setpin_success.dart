import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';

Future<void> showPopupSetpinSuccess({required Function onSubmit}) async {
  return DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (_) => PopupSetPinSuccess(
            onSubmit: onSubmit,
          ));
}

class PopupSetPinSuccess extends StatelessWidget {
  const PopupSetPinSuccess({super.key, required this.onSubmit});

  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return CustomDialogAlert(
      title: const Text(''),
      descriptions: Text(
        S.of(context).setpinSuccessMessage,
        style: paragraph1RegularStyle,
      ),
      submitButton: ElevatedButton(
        onPressed: () {
          onSubmit();
        },
        child: Text(S.of(context).okButton),
      ),
    );
  }
}
