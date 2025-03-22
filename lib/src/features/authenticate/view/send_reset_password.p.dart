import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/utilities/string.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:flutter/material.dart';

import '../../../constants/spacing.dart';
import '../../../core/translate/generated/l10n.dart';
import '../../../theme/custom_theme.dart';
import '../../../widgets/layouts/default_layout.dart';

class SendResetPasswordScreen extends StatefulWidget {
  const SendResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<SendResetPasswordScreen> createState() =>
      _SendResetPasswordScreenState();
}

class _SendResetPasswordScreenState extends State<SendResetPasswordScreen> {
  final vm = AuthenticateBinding.sendResetPasswordViewModel;

  @override
  void initState() {
    super.initState();
    vm.emailSubject.setValue(widget.email);
    Future.delayed(const Duration(milliseconds: 100), () {
      vm.initSendResetPasswordEmail();
    });
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
        title: S.current.sendResetPasswordNavTitle,
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
                S.current.sendResetPasswordTitle,
                style: headline2Style,
              ),
              const SizedBox(
                height: Spacing.spacing24,
              ),
              Text(
                S.current.sendResetPasswordDescription.replaceAll(
                  '@value',
                  StringUtils.hideSomeEmailText(widget.email),
                ),
                style: paragraph1RegularStyle,
              ),
              const SizedBox(
                height: Spacing.spacing24,
              ),
              Text(
                S.current.sendResetPasswordHint,
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
                          vm.sendResetPasswordEmail();
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
                          : S.current.sendResetPasswordEmailButton),
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
                    onPressed: null,
                    child: Text(S.of(context).loginLinkButton),
                  ),
                ],
              ))
            ],
          ),
        )
      ],
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
