import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class TextAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final Function()? onPress;

  const TextAlertDialog(
      {super.key, this.onPress, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return customDialog();
  }

  Widget customDialog() {
    return Dialog(
      insetPadding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              content,
              style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (onPress != null) {
                    onPress!();
                  }
                },
                child: Text(
                  S.current.textDialogSubmitButton,
                  style: textInButtonStyle?.copyWith(color: whiteColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
