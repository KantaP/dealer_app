import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/main/model/main.st.dart';
import 'package:aconnec_1109_x/src/features/main/view/di/main.vm.dart';
import 'package:aconnec_1109_x/src/features/main/view/widgets/custom_bottom_nav.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class MainBottomNavAlpha extends StatelessWidget {
  const MainBottomNavAlpha({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<MainViewModel>();
    return StreamBuilder<MainState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(BorderRadiusSet.radius16),
                topLeft: Radius.circular(BorderRadiusSet.radius16)),
            boxShadow: [
              BoxShadow(color: midGreyColor, spreadRadius: 1, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(BorderRadiusSet.radius16),
              topRight: Radius.circular(BorderRadiusSet.radius16),
            ),
            child: CustomButtomNav(
              index: snapshot.data!.currentIndex,
              onTap: viewModel.onTapMenu,
            ),
          ),
        );
      },
    );
  }
}
