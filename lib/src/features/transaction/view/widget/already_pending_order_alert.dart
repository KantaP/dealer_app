import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';

Future<void> showAlreadyPendingOrderAlert(BuildContext context) async {
  return DialogUtils.customShowDialog(
      context: context, dialog: (_) => const AlreadyPendingOrderAlert());
}

class AlreadyPendingOrderAlert extends StatefulWidget {
  const AlreadyPendingOrderAlert({super.key});

  @override
  State<AlreadyPendingOrderAlert> createState() =>
      _AlreadyPendingOrderAlertState();
}

class _AlreadyPendingOrderAlertState extends State<AlreadyPendingOrderAlert> {
  @override
  Widget build(BuildContext context) {
    return CustomDialogAlert(
      title: Text(
        S.current.noticeDialogTitle,
        style: titleStyle,
      ),
      descriptions: Text(
        'Already pending order',
        style: paragraph2Style,
      ),
      submitButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(S.of(context).submitButton),
      ),
    );
  }
}
