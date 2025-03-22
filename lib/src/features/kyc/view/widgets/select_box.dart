import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class SelectBox extends StatelessWidget {
  const SelectBox(
      {super.key,
      required this.image,
      required this.label,
      required this.activate});
  final Widget image;
  final Widget label;
  final bool activate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 161,
      // height: 132,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: activate ? 1 : 0,
          color: (activate) ? blueColor : whiteColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: Spacing.spacing10,
          bottom: Spacing.spacing10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [image, label],
        ),
      ),
    );
  }
}
