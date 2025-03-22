import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout_with_loading.dart';
import 'package:flutter/material.dart';

import '../../../core/translate/generated/l10n.dart';
import '../../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final vm = AuthenticateBinding.forgotPasswordViewModel;

  @override
  void dispose() {
    super.dispose();
    vm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayoutWithLoading(
      appBar: DefaultAppBar(
        title: S.current.forgotPasswordNavTitle,
        centerTitle: true,
      ),
      bodyPadding: PaddingScreen.paddingLTR,
      safeAreaBottom: true,
      slivers: [
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                label: '',
                placeholder: S.current.emailTextFieldPlaceholder,
                onChanged: (email) {
                  vm.emailSubject.setValue(email);
                },
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomStreamBuilder(
                      stream: vm.emailSubject.state(),
                      builder: (_, fields) => ElevatedButton(
                        onPressed: (fields.data!.isEmpty)
                            ? null
                            : () {
                                vm.checkEmail();
                              },
                        child: Text(S.current.confirmButton),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
