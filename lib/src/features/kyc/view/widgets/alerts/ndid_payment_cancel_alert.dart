import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';

Future<void> showNdidPaymentCancelAlert({required Function onCancel}) async {
  DialogUtils.customShowDialog(
    context: NavigationService.navigatorKey.currentContext!,
    dialog: (BuildContext _) => NdidPaymentCancelAlert(
      onCancel: onCancel,
    ),
  );
}

class NdidPaymentCancelAlert extends StatelessWidget {
  const NdidPaymentCancelAlert({super.key, required this.onCancel});

  final Function onCancel;

  @override
  Widget build(BuildContext context) {
    return CustomDialogAlert(
      title: Text(
        S.current.ndidPaymentCancellationTitle,
        style: titleStyle,
      ),
      descriptions: Text(
        S.current.ndidPaymentCancellationDesc,
        style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
        textAlign: TextAlign.center,
      ),
      submitButton: OutlinedButton(
        style: outlineAlertButtonStyle,
        onPressed: () {
          onCancel();
          Navigator.of(context).pop();
        },
        child: Text(
          S.current.ndidPaymentCancellationSubmitButton,
          style: textInButtonStyle?.copyWith(color: redColor),
        ),
      ),
      optionalButton: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Text(
            S.current.ndidPaymentCancellationReturnButton,
            style: textInButtonStyle,
          ),
        ),
      ),
    );
  }
}
