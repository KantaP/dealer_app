import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/string.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../widgets/custom_steam_builder.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final vm = AuthenticateBinding.verifyEmailViewModel;

  @override
  void initState() {
    super.initState();
    vm.initCheckEmailVerify();
  }

  @override
  void dispose() {
    super.dispose();
    vm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: DefaultAppBar(
        title: S.current.verifyEmailNavTitle,
        centerTitle: true,
      ),
      bodyPadding: PaddingScreen.paddingLTR,
      safeAreaBottom: true,
      slivers: [
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                S.current.verifyEmailTitle,
                style: headline2Style,
              ),
              const SizedBox(
                height: Spacing.spacing24,
              ),
              CustomFuture(
                future: vm.getEmail(),
                builder: (_, snapshot) => Text(
                  S.current.verifyEmailUserLabel.replaceAll(
                    '@value',
                    StringUtils.hideSomeEmailText(snapshot.data!),
                  ),
                  style: paragraph1RegularStyle,
                ),
              ),
              SizedBox(
                height: Spacing.spacing24,
              ),
              Text(
                S.current.verifyEmailDescription,
                style: paragraph1RegularStyle,
              ),
              const SizedBox(
                height: Spacing.spacing32,
              ),
              CustomStreamBuilder(
                stream: vm.countdownSubject.state(),
                builder: (_, countdown) => OutlinedButton(
                  style: (countdown.data! > 0)
                      ? outlineDisabledButtonStyle
                      : outlineButtonStyle,
                  onPressed: (countdown.data! > 0)
                      ? null
                      : () {
                          vm.resendVerifyEmail();
                        },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.vectorIcons.refresh.svg(
                          color:
                              (countdown.data! > 0) ? midGreyColor : blueColor),
                      const SizedBox(
                        width: Spacing.spacing10,
                      ),
                      Text((countdown.data! > 0)
                          ? countdown.data!.toString()
                          : S.current.verifyEmailResendButton),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        NavigationService.toReplacementWithNamed(
                            RoutesConstant.loginWithPassword);
                      },
                      child: Text(S.of(context).loginLinkButton),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: paddingBottom(),
              )
            ],
          ),
        )
      ],
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
