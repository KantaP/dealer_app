import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class PhotoFrontCard extends StatelessWidget {
  const PhotoFrontCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HilightText(
          text: S.of(context).kycIntrodunction4Headline,
          hilightStyle: headline4BoldStyle?.merge(
            const TextStyle(color: blueColor),
          ),
          normalStyle: headline4LightStyle,
        ),
        Text(
          S.of(context).kycIntrodunction4Description,
          style: paragraph1LightStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Center(
            child: Image.asset(AssetImages.kycIntroTakePicture),
          ),
        )
      ],
    );
  }
}
