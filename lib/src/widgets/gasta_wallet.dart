import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class GastaWallet extends StatelessWidget {
  const GastaWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: blueColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AssetSvg.wallet),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  S.of(context).gasta_balance,
                  style: paragraph2Style?.copyWith(color: whiteColor),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: whiteColor, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AssetSvg.gasta,
                      color: blackColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '1200.000000',
                  style: headline2Style?.copyWith(color: whiteColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
