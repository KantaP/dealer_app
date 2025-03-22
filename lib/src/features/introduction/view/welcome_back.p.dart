import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/welcome_back.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomBackPage extends CustomView<WelcomeBackViewModel> {
  const WelcomBackPage({required WelcomeBackViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _WelcomBackPageState createState() => _WelcomBackPageState(viewModel);
}

class _WelcomBackPageState
    extends ViewState<WelcomBackPage, WelcomeBackViewModel> {
  _WelcomBackPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  void didPush() {
    // TODO: implement didPush
    super.didPush();
    viewModel.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      statusBarColor: Colors.transparent,
      slivers: [
        SliverFillRemaining(
          // hasScrollBody: false,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  opacity: 0.1,
                  child: Assets.vectorIcons.welcomeBg.svg(),
                ),
              ),
              _buildLayout(),
            ],
          ),
        )
      ],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: true,
    );
  }

  Widget _widgetButtonSubmit() {
    return ElevatedButton(
      onPressed: () => viewModel.goToSignIn(),
      child: Text(S.of(context).welcomeBackSubmitButton),
    );
  }

  Widget _buildLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Align(
            child: Assets.images.mascot1109x.image(height: 280),
          ),
          const Spacer(),
          HilightText(
            text: S.of(context).welcomeBackHeadlineHilight,
            hilightStyle: headline1Style?.copyWith(color: blueColor),
            normalStyle: headline1Style,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: Spacing.spacing10),
            child: Text(
              S.of(context).welcomeBackContent,
              style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
              textAlign: TextAlign.center,
              maxLines: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Spacing.spacing40,
            ),
            child: ElevatedButton(
              onPressed: () => viewModel.gotoSignUp(),
              child: Text(S.of(context).signUpButton),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: Spacing.spacing10),
            child: OutlinedButton(
              onPressed: () => viewModel.goToSignIn(),
              child: Text(S.of(context).loginButton),
            ),
          ),
          SizedBox(
            height: Spacing.spacing10,
          ),
          TextButton(
            style: elevatedTransparentButton,
            onPressed: () {
              viewModel.continueAsGuest();
            },
            child: Text(
              S.of(context).continueAsGuestButton,
              style: textInButtonStyle?.copyWith(
                  color: blueColor,
                  decoration: TextDecoration.underline,
                  decorationColor: blueColor),
            ),
          ),
          SizedBox(
            height: paddingBottom(),
          )
        ],
      ),
    );
  }
}
