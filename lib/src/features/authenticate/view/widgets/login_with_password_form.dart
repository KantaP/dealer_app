import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/streams.dart';

import '../../../../constants/constants.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/translate/generated/l10n.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../widgets/custom_steam_builder.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../bindings/authenticate.binding.dart';

class LoginWithPasswordForm extends StatefulWidget {
  const LoginWithPasswordForm({super.key});

  @override
  State<LoginWithPasswordForm> createState() => _LoginWithPasswordFormState();
}

class _LoginWithPasswordFormState extends State<LoginWithPasswordForm> {
  final vm = AuthenticateBinding.loginWithPasswordViewModel;

  @override
  void dispose() {
    super.dispose();
    vm.resetForm();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          label: '',
          placeholder: S.current.emailTextFieldPlaceholder,
          onChanged: (email) {
            vm.emailSubject.setValue(email);
          },
        ),
        const SizedBox(
          height: Spacing.spacing12,
        ),
        CustomStreamBuilder(
          stream: vm.hidePasswordSubject.state(),
          builder: (_, hidePassword) => CustomTextField(
            label: '',
            placeholder: S.current.passwordTextFieldPlaceholder,
            suffixIcon: GestureDetector(
              onTap: () {
                vm.hidePasswordSubject
                    .setValue(!vm.hidePasswordSubject.subject.value);
              },
              child: Assets.vectorIcons.showPasswordIcon.svg(
                  color: hidePassword.data! == true ? midGreyColor : blueColor),
            ),
            secureText: hidePassword.data!,
            onChanged: (password) {
              vm.passwordSubject.setValue(password);
            },
          ),
        ),
        const SizedBox(
          height: Spacing.spacing24,
        ),
        CustomStreamBuilder(
          stream: CombineLatestStream(
              [vm.emailSubject.state(), vm.passwordSubject.state()],
              (values) => vm.canSubmit()),
          builder: (_, canSubmit) => ElevatedButton(
            onPressed: (canSubmit.data!)
                ? () {
                    vm.login();
                  }
                : null,
            child: Text(S.of(context).loginButton),
          ),
        ),
        const SizedBox(
          height: Spacing.spacing24,
        ),
        SizedBox(
          height: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  vm.goToSignUp();
                },
                child: Text(
                  S.current.signUpLinkButton,
                  style: paragraph2Style?.copyWith(color: blueColor),
                ),
              ),
              const SizedBox(
                width: Spacing.spacing24,
              ),
              const VerticalDivider(
                color: Color(0xFFE1E3EA),
              ),
              const SizedBox(
                width: Spacing.spacing24,
              ),
              GestureDetector(
                onTap: () {
                  NavigationService.toNamed(RoutesConstant.forgotPassword);
                },
                child: Text(
                  S.current.forgotPasswordLinkButton,
                  style: paragraph2Style?.copyWith(color: blueColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
