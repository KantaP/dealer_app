import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class CustomCloseButton extends StatelessWidget {
  final Function() onTap;

  const CustomCloseButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: lightGrey2Color),
        child: Image.asset(AssetIcons.close),
      ),
    );
  }
}
