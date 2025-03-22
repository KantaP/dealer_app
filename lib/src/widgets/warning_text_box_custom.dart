import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class WarningTextBoxCustom extends StatelessWidget {
  const WarningTextBoxCustom({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
          color: warningTextBoxColor.withOpacity(0.5),
          border: Border.all(color: yellowColor)),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.spacing10),
        child: child,
      ),
    );
  }
}
