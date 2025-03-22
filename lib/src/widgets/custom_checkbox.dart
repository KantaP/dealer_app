import 'package:flutter/material.dart';

import '../theme/custom_theme.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, required this.value, this.onChanged});

  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      checkColor: whiteColor,
      activeColor: blueColor,
      side: const BorderSide(color: midGreyColor),
      value: value,
      onChanged: onChanged,
    );
  }
}
