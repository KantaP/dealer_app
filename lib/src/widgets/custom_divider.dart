import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // const SizedBox(
        //   height: 20,
        // ),
        Container(
          height: 10,
          width: double.infinity,
          color: lightGrey1Color,
        ),
        // const SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }
}
