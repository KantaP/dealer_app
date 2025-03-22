import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/coin/view/widgets/coin_price_list.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

import '../../../constants/spacing.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../theme/custom_theme.dart';
import 'widgets/home_app_bar.dart';

class OtcScreen extends StatelessWidget {
  const OtcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        appBar: const HomeAppBar(),
        // bodyPadding: PaddingScreen.paddingLR16,
        bgColor: Colors.transparent,
        slivers: [
          SliverFillRemaining(
            // hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(Spacing.spacing20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Assets.images.underConstruction.image(height: 120),
                    // const SizedBox(
                    //   height: Spacing.spacing10,
                    // ),
                    // Text(
                    //   'เตรียมพบกับการซื้อขายในรูปแบบ OTC บน 1109x ได้เร็ว ๆ นี้',
                    //   style: titleStyle?.copyWith(
                    //       color: blackColor.withOpacity(0.3)),
                    //   textAlign: TextAlign.center,
                    // ),
                    // CustomTextField(
                    //   label: '',
                    //   prefixIcon: Assets.vectorIcons.searchIcon.svg(),
                    //   placeholder: S.current.searchPlaceholder,
                    //   bgColor: Colors.white,
                    //   filled: true,
                    // ),
                    const CoinPriceList()
                  ],
                ),
              ),
            ),
          )
        ],
        physics: NeverScrollableScrollPhysics());
  }
}
