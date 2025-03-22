import 'package:flutter/widgets.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:lottie/lottie.dart';

class LoadingLogo extends StatelessWidget {
  const LoadingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Lottie.asset(
        AssetJson.loading,
      ),
    );
  }
}
