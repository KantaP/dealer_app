import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        appBar: const HomeAppBar(),
        bodyPadding: PaddingScreen.paddingLR16,
        bgColor: Colors.transparent,
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.svgImages.emptyReward.svg(),
                const SizedBox(
                  height: Spacing.spacing20,
                ),
                Text(
                  'ยังไม่มีรางวัล',
                  style: titleStyle?.copyWith(color: midGreyColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
        physics: NeverScrollableScrollPhysics());
  }
}
