import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../constants/constants.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/translate/generated/l10n.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../utilities/validate.dart';
import '../../../../widgets/custom_checkbox.dart';
import '../../../../widgets/custom_steam_builder.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/hilight_text.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final vm = AuthenticateBinding.signUpWithPasswordViewModel;

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
          stream: vm.emailSubject.state(),
          builder: (_, email) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (FieldValidate.isEmail(email.data!))
                  ? Assets.vectorIcons.checkedCircleIcon.svg()
                  : Assets.vectorIcons.closeCircleIcon.svg(),
              const SizedBox(
                width: Spacing.spacing8,
              ),
              Text(
                S.current.emailFormatCondition,
                style: paragraph2Style?.copyWith(
                  color: (FieldValidate.isEmail(email.data!))
                      ? greenColor
                      : midGreyColor,
                  height: 1,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: Spacing.spacing16,
        ),
        CustomStreamBuilder(
          stream: vm.passwordSubject.state(),
          builder: (_, password) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (password.data!.length >= 8)
                  ? Assets.vectorIcons.checkedCircleIcon.svg()
                  : Assets.vectorIcons.closeCircleIcon.svg(),
              const SizedBox(
                width: Spacing.spacing8,
              ),
              Text(
                S.current.setPasswordCondition1Text,
                style: paragraph2Style?.copyWith(
                  color:
                      (password.data!.length >= 8) ? greenColor : midGreyColor,
                  height: 1,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: Spacing.spacing16,
        ),
        CustomStreamBuilder(
          stream: vm.passwordSubject.state(),
          builder: (_, password) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (FieldValidate.isStrongPassword(password.data!))
                  ? Assets.vectorIcons.checkedCircleIcon.svg()
                  : Assets.vectorIcons.closeCircleIcon.svg(),
              const SizedBox(
                width: Spacing.spacing8,
              ),
              Text(
                S.current.setPasswordCondition2Text,
                style: paragraph2Style?.copyWith(
                    color: (FieldValidate.isStrongPassword(password.data!))
                        ? greenColor
                        : midGreyColor,
                    height: 1),
              )
            ],
          ),
        ),
        const SizedBox(
          height: Spacing.spacing24,
        ),
        CustomTextField(
          label: '',
          placeholder: S.current.inviteCodeTextFieldPlaceholder,
          onChanged: (inviteCode) {
            vm.inviteCodeSubject.setValue(inviteCode);
          },
        ),
        const SizedBox(
          height: Spacing.spacing24,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CustomStreamBuilder(
                stream: vm.acceptSubject.state(),
                builder: (_, accept) => CustomCheckbox(
                  value: accept.data!,
                  onChanged: (value) {
                    vm.acceptSubject.setValue(value!);
                  },
                ),
              ),
            ),
            const SizedBox(
              width: Spacing.spacing12,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        vm.goToTerm();
                      },
                      child: HilightText(
                        text: S.current.acceptTermAndPrivacyText,
                        hilightStyle: paragraph2Style?.copyWith(
                            color: blueColor, height: 1.45),
                        normalStyle: paragraph2Style,
                      ),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        vm.goToPrivacy();
                      },
                      child: HilightText(
                        text: S.current.acceptTermAndPrivacy2Text,
                        hilightStyle: paragraph2Style?.copyWith(
                            color: blueColor, height: 1.45),
                        normalStyle: paragraph2Style,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: Spacing.spacing24,
        ),
        CustomStreamBuilder(
          stream: CombineLatestStream([
            vm.passwordSubject.state(),
            vm.acceptSubject.state(),
            vm.emailSubject.state(),
            vm.inviteCodeSubject.state()
          ], (values) => vm.canSubmit()),
          builder: (_, canSubmit) => ElevatedButton(
            onPressed: (canSubmit.data!)
                ? () {
                    vm.signUp();
                  }
                : null,
            child: Text(S.of(context).signUpButton),
          ),
        ),
        const SizedBox(
          height: Spacing.spacing24,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              NavigationService.toReplacementWithNamed(
                  RoutesConstant.loginWithPassword);
            },
            child: Text(
              S.current.loginButton,
              style: paragraph2Style?.copyWith(
                  color: blueColor,
                  decoration: TextDecoration.underline,
                  decorationColor: blueColor),
            ),
          ),
        )
      ],
    );
  }
}
