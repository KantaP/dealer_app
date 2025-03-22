import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/main/model/main.st.dart';
import 'package:aconnec_1109_x/src/features/main/view/di/main.vm.dart';
import 'package:aconnec_1109_x/src/features/main/view/widgets/curved_bottom_nav.dart';
import 'package:aconnec_1109_x/src/features/main/view/widgets/custom_bottom_nav.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:flutter/material.dart';

class MainBottomNavBeta extends StatelessWidget {
  const MainBottomNavBeta({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<MainViewModel>();
    return CustomStreamBuilder(
      stream: viewModel.state,
      builder: (_, snapshot) => CurvedNavigationBar(
        items: <CurvedNavigationBarItem>[
          CurvedNavigationBarItem(
            label: 'หน้าหลัก',
            selectedIcon: Assets.vectorIcons.homeActiveIcon.svg(),
            unSelectedIcon: Assets.vectorIcons.homeIcon.svg(),
          ),
          CurvedNavigationBarItem(
            label: 'ตลาด',
            selectedIcon: Assets.vectorIcons.marketIconActive.svg(),
            unSelectedIcon: Assets.vectorIcons.marketIcon.svg(),
          ),
          CurvedNavigationBarItem(
            label: '',
            selectedIcon: Container(),
            unSelectedIcon: Container(),
          ),
          CurvedNavigationBarItem(
            label: 'รางวัล',
            selectedIcon: Assets.vectorIcons.rewardActiveIcon.svg(),
            unSelectedIcon: Assets.vectorIcons.rewardIcon.svg(),
          ),
          CurvedNavigationBarItem(
            label: 'บัญชี',
            selectedIcon: Assets.vectorIcons.accontActiveIcon.svg(),
            unSelectedIcon: Assets.vectorIcons.accountIcon.svg(),
          )
        ],
        currentIndex: snapshot.data?.currentIndex ?? 0,
        onTap: viewModel.onTapMenu,
      ),
    );
  }
}
