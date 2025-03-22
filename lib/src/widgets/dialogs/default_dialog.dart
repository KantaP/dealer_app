import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/navigator_service.dart';

Future<void> showDefaultDialog({
  required String title,
  required String descriptions,
}) async {
  return DialogUtils.customShowDialog(
    context: NavigationService.navigatorKey.currentContext!,
    dialog: (_) => DefaultDialog(
      title: title,
      descriptions: descriptions,
    ),
  );
}

class DefaultDialog extends StatelessWidget {
  const DefaultDialog(
      {super.key, required this.title, required this.descriptions});

  final String title;
  final String descriptions;

  @override
  Widget build(BuildContext context) {
    return CustomDialogAlert(
      title: Text(
        title,
        style: titleStyle,
      ),
      descriptions: Text(
        descriptions,
        style: paragraph2Style,
      ),
      submitButton: ElevatedButton(
        onPressed: () {
          NavigationService.back(NavigationResult(null));
        },
        child: Text(
          S.current.okButton,
        ),
      ),
    );
  }
}
