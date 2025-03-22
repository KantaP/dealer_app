import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/sign_in.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';

class SignInPage extends CustomView<SignInPageViewModel> {
  const SignInPage({required SignInPageViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  ViewState<SignInPage, SignInPageViewModel> createState() =>
      _SignInPageState(viewModel);
}

class _SignInPageState extends ViewState<SignInPage, SignInPageViewModel> {
  _SignInPageState(SignInPageViewModel viewModel) : super(viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    S.of(context).signInHeadline,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      S.of(context).signInContent,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: ElevatedButton(
                          onPressed: () => viewModel.goToCreateAccount(),
                          child: Text(S.of(context).signInCreateAccountButton),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 52.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).signInAlreadyAccountContent,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () => viewModel.goToPhoneAuth(),
                              child: Text(
                                  S.of(context).signInAlreadyAccountAction),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: true,
    );
  }
}
