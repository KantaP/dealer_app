import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:flutter/material.dart';

class CoinListScreenAppbar extends StatelessWidget {
  const CoinListScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
      centerTitle: true,
      title: S.current.SelectCoinNavTitle,
      bgColor: blueColor,
      textNormalColor: whiteColor,
      leading: const BackButton(
        color: whiteColor,
      ),
    );
  }
}
