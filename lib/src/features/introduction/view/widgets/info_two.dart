import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

import '../../../../constants/spacing.dart';

class InfoTwo extends StatelessWidget {
  const InfoTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        HilightText(
          text: S.of(context).gettingStartedInfoTwoTitle,
          hilightStyle: headline2MediumStyle?.copyWith(color: blueColor),
          normalStyle: headline2MediumStyle,
          textAlign: TextAlign.center,
          // maxLines: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: Spacing.spacing20),
          child: Text(
            S.of(context).gettingStartedInfoTwoContent,
            style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Spacing.spacing20),
          child: Text(
            S.of(context).gettingStartedWarningText,
            style: paragraph3Style?.copyWith(color: yellowColor),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
