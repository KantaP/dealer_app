import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class WarningGrayTextBox extends StatelessWidget {
  const WarningGrayTextBox({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
        color: lightGrey1Color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.spacing10),
        child: Text(
          text,
          style: paragraph2Style?.copyWith(color: darkGreyColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
