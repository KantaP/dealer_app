import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomButtomNav extends StatelessWidget {
  const CustomButtomNav({super.key, required this.index, required this.onTap});

  final int index;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: whiteColor,
      onTap: onTap,
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: regular11Text,
      unselectedLabelStyle: regular11Text,
      selectedItemColor: blueColor,
      unselectedItemColor: darkGreyColor,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: Spacing.spacing16),
            child: Assets.icons.homeIconInactive.image(width: 24),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: Spacing.spacing16),
            child: Assets.icons.homeIcon.image(width: 24),
          ),
          label: S.current.bottomMenuHomeButton,
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: Spacing.spacing16),
            child: Assets.vectorIcons.otcIcon.svg(width: 24),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: Spacing.spacing16),
            child: Assets.vectorIcons.otcActiveIcon.svg(width: 24),
          ),
          label: 'OTC',
        ),
        const BottomNavigationBarItem(
            label: '',
            icon: Visibility(visible: false, child: Icon(Icons.home))),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: Spacing.spacing16),
            child: Assets.vectorIcons.rewardIcon.svg(width: 24),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: Spacing.spacing16),
            child: Assets.vectorIcons.rewardActiveIcon.svg(width: 24),
          ),
          label: 'Reward',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: Spacing.spacing16),
            child: Assets.vectorIcons.accountIcon.svg(width: 24),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: Spacing.spacing16),
            child: Assets.vectorIcons.accontActiveIcon.svg(width: 24),
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
