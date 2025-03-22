import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/dashboard/bindings/dasboard.binding.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/widgets/home_app_bar.dart';
import 'package:aconnec_1109_x/src/features/main/bindings/main_bottom_app_bar.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/translate/generated/l10n.dart';
import '../../../widgets/app_bars/default_app_bar.dart';
import '../../../widgets/layouts/default_layout.dart';
import '../../user/view/widgets/user_spend_limit.dart';
import 'widgets/menu_item.dart';
import 'widgets/user_profile_section.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = DashboardBinding.sideMenuViewModel;
    final authVM = AuthenticateBinding.authenticationFirebaseService;

    final loggedInMenus = [
      // MenuItem(
      //   icon: Assets.svgImages.sideMenuUserProfile.svg(),
      //   label: S.of(context).sideMenuPersonalAccountInformationLabel,
      //   onTap: () {
      //     vm.gotoAccountMenu();
      //   },
      // ),
      MenuItem(
        icon: Assets.svgImages.sideMenuSetting.svg(),
        label: S.of(context).sideMenuSettingLabel,
        onTap: () {
          vm.gotoSettingMenu();
        },
      ),
      MenuItem(
        icon: Assets.svgImages.sideMenuHelp.svg(),
        label: S.of(context).sideMenuHelpLabel,
        onTap: () {
          vm.gotoHelpMenu();
        },
      ),
      MenuItem(
          icon: Assets.svgImages.sideMenuOther.svg(),
          label: S.of(context).sideMenuOtherLabel,
          onTap: () {
            vm.gotoOtherMenu();
          }),
      MenuItem(
          icon: Assets.svgImages.sideMenuLogout.svg(),
          label: S.of(context).sideMenuLogoutLabel,
          onTap: vm.signOut,
          showIcon: false,
          showDivider: false),
    ];

    final guestMenus = [
      MenuItem(
        icon: Assets.svgImages.sideMenuHelp.svg(),
        label: S.of(context).sideMenuHelpLabel,
        onTap: () {
          vm.gotoHelpMenu();
        },
      ),
      // MenuItem(
      //   icon: Assets.svgImages.sideMenuOther.svg(),
      //   label: 'Intercom',
      //   onTap: () {
      //     vm.showIntercomDisplay();
      //   },
      // ),
      MenuItem(
        icon: Assets.svgImages.sideMenuOther.svg(),
        label: S.of(context).sideMenuOtherLabel,
        onTap: () {
          vm.gotoOtherMenu();
        },
        showDivider: false,
      ),
    ];

    return DefaultLayout(
      bgColor: lightGrey1Color,
      bodyPadding: const EdgeInsets.all(Spacing.spacing16),
      appBar: const HomeAppBar(),
      safeAreaBottom: true,
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: Spacing.spacing16,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const UserProfileSection(),
              const SizedBox(
                height: Spacing.spacing20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(BorderRadiusSet.radius20),
                  color: whiteColor,
                ),
                padding: const EdgeInsets.all(Spacing.spacing20),
                child: Column(
                  children: [
                    const UserSpendLimitContainer(),
                    CustomFuture(
                      future: authVM.isLoggedIn(),
                      builder: (_, snapshot) => Column(
                        children: (snapshot.data == true)
                            ? loggedInMenus
                            : guestMenus,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: paddingBottom(),
          ),
        ),
      ],
      physics: const BouncingScrollPhysics(),
      extendBody: true,
    );
  }
}
