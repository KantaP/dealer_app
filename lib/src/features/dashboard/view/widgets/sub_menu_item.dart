import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class SubMenuItem extends StatelessWidget {
  const SubMenuItem({super.key, required this.text, required this.onPress});

  final String text;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.spacing10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: paragraph1LightStyle,
            ),
            (onPress != null)
                ? Assets.vectorIcons.arrowRight.svg()
                : Container(),
          ],
        ),
      ),
    );
  }
}
