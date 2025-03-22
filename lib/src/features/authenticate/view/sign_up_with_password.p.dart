import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout_with_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constants/constants.dart';
import '../../../widgets/app_bars/default_app_bar.dart';
import 'widgets/sign_up_form.dart';

class SignUpWithPasswordScreen extends StatelessWidget {
  const SignUpWithPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayoutWithLoading(
      appBar: DefaultAppBar(
        title: S.current.signUpNavTitle,
        centerTitle: true,
      ),
      bodyPadding: PaddingScreen.paddingLTR,
      slivers: const [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SignUpForm(),
        ),
      ],
      physics: const BouncingScrollPhysics(),
    );
  }
}
