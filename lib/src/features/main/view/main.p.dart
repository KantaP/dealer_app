import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/home.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/otc.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/reward.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/side_menu.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/widgets/sign_in_section.dart';
import 'package:aconnec_1109_x/src/features/main/view/widgets/main_bottom_nav_alpha.dart';
import 'package:aconnec_1109_x/src/features/main/view/widgets/main_bottom_nav_beta.dart';
import 'package:aconnec_1109_x/src/features/main/view/widgets/order_floating_button.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/overview.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/overview.p.dart';
import 'package:aconnec_1109_x/src/features/main/view/di/main.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

import 'widgets/modals/view/order_menu_modal_bottom_sheet.dart';

class MainPage extends CustomView<MainViewModel> {
  const MainPage({required MainViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _MainPageState createState() => _MainPageState(viewModel);
}

class _MainPageState extends ViewState<MainPage, MainViewModel> {
  _MainPageState(super.viewModel);

  @override
  void didPopNext() {
    super.didPopNext();
    viewModel.closeOrderMenu();
  }

  @override
  void didPushNext() {
    super.didPushNext();
    viewModel.closeOrderMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: lightGrey1Color,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: viewModel.pageController,
            children: <Widget>[
              const HomeView(),
              const OtcScreen(),
              Container(),
              const RewardScreen(),
              const SideMenuView()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 0,
            ),
            child: CustomStreamBuilder(
              stream: viewModel.state,
              builder: (_, snapshot) => AnimatedAlign(
                alignment: (snapshot.data!.openOrderMenu)
                    ? Alignment(0.0, 1.2)
                    : const Alignment(0, 300),
                duration: const Duration(milliseconds: 500),
                child: const OrderMenuModal(),
                curve: Curves.fastOutSlowIn,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const MainBottomNavBeta(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const OrderFloatingButton(),
    );
  }
}
