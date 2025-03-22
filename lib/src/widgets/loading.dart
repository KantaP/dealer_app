import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: blueColor.withOpacity(0.4),
        ),
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Assets.lottie.loading.lottie(),
          ),
        )
      ],
    );
  }
}
