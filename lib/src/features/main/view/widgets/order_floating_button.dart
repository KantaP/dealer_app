import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:animated_svg/animated_svg.dart';
import 'package:flutter/material.dart';

import '../../bindings/main_bottom_app_bar.binding.dart';

class OrderFloatingButton extends StatelessWidget {
  const OrderFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = MainBottomAppBarBinding.mainBottomAppBarViewModel;
    final authService = AuthenticateBinding.authenticationFirebaseService;
    return CustomFuture(
      future: authService.isAnonymously(),
      customLoading: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: blueColor,
        ),
        child: Container(
          height: 24,
          width: 24,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: blueColor),
        ),
      ),
      builder: (_, snapshot) => CustomStreamBuilder(
        stream: viewModel.state,
        builder: (_, streamSnapshot) => Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (streamSnapshot.data!.openOrderMenu)
                ? darkBlueColor
                : blueColor,
          ),
          child: AnimatedSvg(
            controller: viewModel.svgController,
            duration: const Duration(milliseconds: 500),
            onTap: () {
              viewModel.showOrderMenu();
            },
            size: 24,
            clockwise: false,
            isActive: (snapshot.data == true) ? false : true,
            children: [
              Assets.vectorIcons.exchangeMenu.svg(width: 24),
              Assets.vectorIcons.exchangeClose.svg(width: 24),
            ],
          ),
        ),
      ),
    );
  }
}
