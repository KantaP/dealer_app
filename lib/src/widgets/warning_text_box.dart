import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class WarningTextBox extends StatelessWidget {
  const WarningTextBox({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
          color: warningTextBoxColor.withOpacity(0.5),
          border: Border.all(color: yellowColor)),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.spacing10),
        child: Text(
          text,
          style: paragraph2Style?.copyWith(color: yellowText),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
