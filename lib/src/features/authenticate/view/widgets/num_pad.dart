import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class NumPad extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const NumPad({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(BorderRadiusSet.radius20),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            width: 86,
            height: 86,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: lightGrey2Color),
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
