import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/create_account.st.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/create_account.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/phone_text_field.dart';

class CreateAccountPage extends CustomView<CreateAccountViewModel> {
  const CreateAccountPage({required CreateAccountViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState(viewModel);
}

class _CreateAccountPageState
    extends ViewState<CreateAccountPage, CreateAccountViewModel> {
  _CreateAccountPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).createAccountTitle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: StreamBuilder<CreateAccountState>(
                        stream: viewModel.state,
                        builder: (context, snapshot) {
                          return PhoneTextField(
                            label: S.of(context).createAccountMobileLabel,
                            onChanged: (value) {
                              viewModel.updateState(<String, dynamic>{
                                CreateAccountFields.mobileNumber: value
                              });
                            },
                            // errorText: snapshot.data!.mobileNumberErrorText,
                          );
                        })),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                    S.of(context).createAccountAgreeTerm,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      viewModel.verifyPhoneNumber();
                    },
                    child: Text(
                        S.of(context).createAccountSubmitButton.toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
