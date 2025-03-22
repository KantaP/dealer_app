import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/coin/view/widgets/coin_list_screen_appbar.dart';
import 'package:aconnec_1109_x/src/features/coin/view/widgets/coin_filter.dart';
import 'package:aconnec_1109_x/src/features/coin/view/widgets/coin_price_list.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class CoinListScreen extends StatelessWidget {
  const CoinListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bgColor: blueColor,
      slivers: [
        const CoinListScreenAppbar(),
        SliverFillRemaining(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(BorderRadiusSet.radius20),
                topRight: Radius.circular(BorderRadiusSet.radius20),
              ),
              color: whiteColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Spacing.spacing20),
              child: CoinPriceList(),
            ),
          ),
        )
      ],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: true,
    );
  }
}
