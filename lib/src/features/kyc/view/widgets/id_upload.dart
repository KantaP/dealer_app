import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class IdUpload extends StatelessWidget {
  const IdUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).kycIntrodunctionTitle,
          style: paragraph1RegularStyle,
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        Text(
          S.of(context).kycIntrodunctionDescription1,
          style: paragraph2LightStyle,
        ),
        Center(
          child: Image.asset(AssetImages.kycIntro1),
        ),
        const SizedBox(
          height: 40,
        ),
        HilightText(
          text: S.of(context).kycIntrodunctionDescription2,
          hilightStyle: paragraph2LightStyle?.merge(
            const TextStyle(color: blueColor),
          ),
          normalStyle: paragraph2LightStyle,
        ),
        Center(
          child: Image.asset(AssetImages.kycIntro2),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          S.of(context).kycIntrodunctionDescription3,
          style: paragraph2LightStyle,
        ),
        Center(
          child: Image.asset(AssetImages.kycIntro3),
        ),
      ],
    );
  }
}
