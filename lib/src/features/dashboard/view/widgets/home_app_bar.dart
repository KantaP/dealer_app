import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SideMenuButton(),
          Padding(
            padding: const EdgeInsets.only(top: Spacing.spacing8),
            child: Assets.vectorIcons.logoHorizontal
                .svg(color: blueColor, height: 40),
          ),
          InkWell(
              onTap: () =>
                  NavigationService.toNamed(RoutesConstant.notification),
              child: Assets.vectorIcons.bell.svg(color: blueColor)),
        ],
      ),
    );
  }
}
