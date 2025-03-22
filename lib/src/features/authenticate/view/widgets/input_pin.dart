import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class InputPin extends StatelessWidget {
  final String pinText;
  const InputPin({Key? key, required this.pinText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (pinText.isNotEmpty)
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: blackColor, shape: BoxShape.circle),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: lightGrey1Color, shape: BoxShape.circle),
            ),
    );
  }
}
