import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.lottie.logo1109x2.lottie(repeat: false);
    // return Assets.vectorIcons.logo.svg();
    // return Lottie.asset(AssetJson.logo, repeat: false);
  }
}
