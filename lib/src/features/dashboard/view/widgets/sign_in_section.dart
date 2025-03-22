import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:flutter/material.dart';

class SignInSection extends StatelessWidget {
  const SignInSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authenFirebaseService =
        AuthenticateBinding.authenticationFirebaseService;
    return CustomFuture(
      future: authenFirebaseService.getCurrentUser(),
      customLoading: Container(),
      customError: Container(
        margin: const EdgeInsets.only(bottom: Spacing.spacing16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusSet.radius20),
          color: blueColor.withOpacity(0.05),
        ),
        padding: const EdgeInsets.all(Spacing.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).signInSectionTitle,
              style: headline4LightStyle?.copyWith(color: blueColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Spacing.spacing8,
            ),
            Text(
              S.of(context).signInSectionSubtitle,
              style: paragraph1RegularStyle?.copyWith(
                  color: blueColor.withOpacity(0.5)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Spacing.spacing8,
            ),
            ElevatedButton(
              onPressed: () {
                NavigationService.toNamed(RoutesConstant.signUpWithPassword);
              },
              child: Text(S.of(context).signInSectionButton),
            )
          ],
        ),
      ),
      builder: (_, snapshot) => Container(),
    );
  }
}
