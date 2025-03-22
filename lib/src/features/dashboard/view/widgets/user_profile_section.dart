import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/dashboard/bindings/dasboard.binding.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/side_menu.vm.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.p.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/loading/placeholder.dart';
import 'package:flutter/material.dart';

import '../../../../model/user_profile.m.dart';

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final SideMenuViewModel vm = DashboardBinding.sideMenuViewModel;
    return CustomFuture<UserProfileModel>(
      future: vm.getCurrentUser(),
      customLoading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteColor),
        padding: const EdgeInsets.only(
          top: Spacing.spacing20,
          left: Spacing.spacing20,
          right: Spacing.spacing20,
          bottom: Spacing.spacing20,
        ),
        child: const ContentPlaceholder(
          lineType: ContentLineType.threeLines,
        ),
      ),
      // guest mode
      customError: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteColor),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Spacing.spacing20,
            left: Spacing.spacing20,
            right: Spacing.spacing20,
            bottom: Spacing.spacing20,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(BorderRadiusSet.radius12)),
                child: Assets.vectorIcons.userGuest.svg(),
              ),
              const SizedBox(
                width: Spacing.spacing10,
              ),
              Text(
                'Guest',
                style: titleStyle,
              )
            ],
          ),
        ),
      ),
      builder: (_, snapshot) {
        return CustomStreamBuilder(
          stream: vm.trackingUserData(),
          builder: (_, userTracking) {
            final userData = UserProfileModelPersistence().fromJson(
                Map<String, dynamic>.from(
                    userTracking.data!.snapshot.value as dynamic));

            return Container(
              decoration: BoxDecoration(
                  // border: Border.all(width: 1, color: lightBlue10),
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: Spacing.spacing20,
                  left: Spacing.spacing20,
                  right: Spacing.spacing20,
                  bottom: Spacing.spacing20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(BorderRadiusSet.radius12)),
                          child: Assets.vectorIcons.userLogged.svg(),
                        ),
                        const SizedBox(
                          width: Spacing.spacing10,
                        ),
                        Text(
                          userData.username,
                          style: titleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Spacing.spacing10,
                    ),
                    Wrap(
                      runSpacing: Spacing.spacing8,
                      spacing: Spacing.spacing4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        //Kyc Level
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: (userData.kycLevel == 0)
                                ? lightGrey1Color
                                : (userData.kycLevel == 1)
                                    ? lightBlue10
                                    : lightGreen30,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13.0, vertical: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  vm.showKycLevel(
                                      userData.kycLevel, userData.kycStatus),
                                  style: textInButtonStyle?.copyWith(
                                    color: (userData.kycLevel == 0 ||
                                            userData.kycLevel == 99)
                                        ? midGreyColor
                                        : (userData.kycLevel == 1)
                                            ? seaBlue
                                            : greenColor,
                                  ),
                                ),
                                Visibility(
                                  visible: userData.kycLevel == 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Assets.icons.kycLevel2.image(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        //Suspended Tag
                        Visibility(
                          visible: userData.status == 'suspended',
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: redColor.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13.0, vertical: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Suspended',
                                    style: textInButtonStyle?.copyWith(
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //Kyc Link Button
                        Visibility(
                          visible: userData.kycLevel == 0,
                          child: InkWell(
                            onTap: () {
                              vm.goToKyc();
                            },
                            child: Text(
                              S.of(context).sideMenuKycLinkButtonLabel,
                              style: regular14Text?.copyWith(
                                  color: blueColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: blueColor),
                            ),
                          ),
                        ),
                        //Under Review Text
                        // Visibility(
                        //   visible: userData.kycStatus == '2-',
                        //   child: Container(
                        //     margin: const EdgeInsets.only(right: 10),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(25),
                        //       color: blueColor.withOpacity(0.1),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 13.0, vertical: 8.0),
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children: [
                        //           Text(
                        //             'Under Review',
                        //             style: textInButtonStyle?.copyWith(
                        //               color: seaBlue,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //Not Approve
                        Visibility(
                          visible: userData.kycStatus == '2--',
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: redColor.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13.0, vertical: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Not Approve',
                                    style: textInButtonStyle?.copyWith(
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
