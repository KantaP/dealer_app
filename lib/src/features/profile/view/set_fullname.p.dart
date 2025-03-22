import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/profile/model/set_fullname.st.dart';
import 'package:aconnec_1109_x/src/features/profile/view/di/set_fullname.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';

class SetFullnamePage extends CustomView<SetFullnameViewModel> {
  const SetFullnamePage({required SetFullnameViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SetFullnamePageState createState() => _SetFullnamePageState(viewModel);
}

class _SetFullnamePageState
    extends ViewState<SetFullnamePage, SetFullnameViewModel> {
  _SetFullnamePageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    // viewModel.listenFirebaseDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).setFullnameTitle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  S.of(context).setFullnameHeadline,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.merge(const TextStyle(fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    S.of(context).setFullnameHeadline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: StreamBuilder<SetFullnameState>(
                      stream: viewModel.state,
                      builder: (context, snapshot) {
                        return CustomTextField(
                          label: S.of(context).setFullnameFirstNameInputLabel,
                          onChanged: (value) {
                            viewModel.updateState(<String, dynamic>{
                              SetFullnameFields.firstName: value,
                            });
                          },
                          errorText: snapshot.data?.inputFirstNameError,
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: StreamBuilder<SetFullnameState>(
                      stream: viewModel.state,
                      builder: (context, snapshot) {
                        return CustomTextField(
                          label: S.of(context).setFullnameLastNameInputLabel,
                          onChanged: (value) {
                            viewModel.updateState(<String, dynamic>{
                              SetFullnameFields.lastName: value,
                            });
                          },
                          errorText: snapshot.data?.inputLastNameError,
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    S.of(context).setFullnameContent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      // viewModel.setProfile();
                    },
                    child: Text(
                        S.of(context).setFullnameSubmitButton.toUpperCase()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
