import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/loading/placeholder.dart';
import 'package:flutter/material.dart';

class SideMenuButton extends StatelessWidget {
  const SideMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final service = AuthenticateBinding.authenticationFirebaseService;
    return CustomFuture(
      future: service.getCurrentUser(),
      customLoading: _buildLoading(),
      customError: _buildError(),
      builder: (_, snapshot) => _buildWidget(snapshot),
    );
  }

  Widget _buildLoading() {
    return const SizedBox(
      width: 180,
      height: 50,
      child: ContentPlaceholder(lineType: ContentLineType.twoLines),
    );
  }

  Widget _buildError() {
    return const SizedBox(
      width: 180,
      height: 50,
      child: ContentPlaceholder(lineType: ContentLineType.twoLines),
    );
  }

  Widget _buildWidget(AsyncSnapshot<UserProfileModel> snapshot) {
    final data = snapshot.data;
    return InkWell(
      onTap: () {
        NavigationService.navigatorKey.currentState!
            .pushNamed(RoutesConstant.sideMenu);
      },
      child: Container(
        // width: 180,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: blueColor.withOpacity(0.1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing6),
        child: Row(
          children: [
            Assets.icons.user.image(fit: BoxFit.fill, width: 38, height: 38),
            const SizedBox(
              width: Spacing.spacing10,
            ),
            Text(
              data?.username ?? '',
              style: textInButtonStyle?.copyWith(color: blueColor),
              overflow: TextOverflow.ellipsis,
            ),
            Visibility(
              visible: data?.kycLevel == 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Assets.icons.kycLevel2.image(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
