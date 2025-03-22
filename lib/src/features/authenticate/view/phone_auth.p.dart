import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/phone_auth.st.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/phone_auth.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/phone_text_field.dart';

class PhoneAuthPage extends CustomView<PhoneAuthViewModel> {
  const PhoneAuthPage({required PhoneAuthViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState(viewModel);
}

class _PhoneAuthPageState extends ViewState<PhoneAuthPage, PhoneAuthViewModel> {
  _PhoneAuthPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    final countdownService = AuthenticateBinding.phoneAuthCountDownService;
    countdownService.timerListener();
  }

  @override
  void didPopNext() {
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: S.of(context).phoneAuthTitle,
      slivers: [_buildLayout()],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: true,
    );
  }

  Widget _buildLayout() {
    final countdownService = AuthenticateBinding.phoneAuthCountDownService;
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.all(Spacing.spacing24),
        child: Column(
          children: [
            Text(
              S.current.phoneAuthDescription,
              style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
            ),
            Padding(
              padding: const EdgeInsets.only(top: Spacing.spacing24),
              child: CustomStreamBuilder<PhoneAuthFormState>(
                stream: viewModel.formState,
                builder: (context, snapshot) {
                  return PhoneTextField(
                    label: S.of(context).phoneAuthMobileLabel,
                    onChanged: (value) {
                      viewModel.updateFormState(
                        <String, dynamic>{
                          PhoneAuthFormFields.mobileNumber: value
                        },
                      );
                    },
                    errorText: snapshot.data!.mobileNumberErrorText,
                  );
                },
              ),
            ),
            const SizedBox(
              height: Spacing.spacing24,
            ),
            CustomTextField(
              label: S.current.inviteCodeLabel,
              placeholder: S.current.inviteCodePlaceholder,
              onChanged: (value) {
                viewModel.updateFormState(
                  <String, dynamic>{PhoneAuthFormFields.invitationCode: value},
                );
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.spacing20),
                    child: Text(
                      S.of(context).createAccountAgreeTerm,
                      style:
                          paragraph1RegularStyle?.copyWith(color: termsColor),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          viewModel.goToTerm();
                        },
                        child: Text(
                          S.of(context).termsAndConditions,
                          style: paragraph1MediumStyle?.copyWith(
                            color: blueColor,
                            decoration: TextDecoration.underline,
                            decorationColor: blueColor,
                          ),
                        ),
                      ),
                      Text(
                        ' | ',
                        style: paragraph1RegularStyle?.copyWith(
                          color: blueColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          viewModel.goToPrivacy();
                        },
                        child: Text(
                          S.of(context).privacyPolicy,
                          style: paragraph1MediumStyle?.copyWith(
                            color: blueColor,
                            decoration: TextDecoration.underline,
                            decorationColor: blueColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.spacing40),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomStreamBuilder(
                        stream: countdownService.countdownState.state(),
                        builder: (_, countdownSnapshot) =>
                            (countdownSnapshot.data! > 0)
                                ? ElevatedButton(
                                    onPressed: null,
                                    child: Text(
                                      '${S.of(context).continueButton} (${countdownSnapshot.data})',
                                    ),
                                  )
                                : CustomStreamBuilder<PhoneAuthFormState>(
                                    stream: viewModel.formState,
                                    builder: (context, snapshot) {
                                      final mobileNumber =
                                          snapshot.data!.mobileNumber;
                                      final invitecationCode =
                                          snapshot.data!.invitationCode;
                                      return ElevatedButton(
                                        onPressed: snapshot.data == null ||
                                                mobileNumber.isEmpty ||
                                                invitecationCode.isEmpty
                                            ? null
                                            : () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                viewModel.verifyPhoneNumber();
                                              },
                                        child: Text(
                                          S.of(context).continueButton,
                                        ),
                                      );
                                    },
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
