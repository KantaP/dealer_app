import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widgets/layouts/default_layout_with_loading.dart';
import 'widgets/login_with_password_form.dart';

class LoginWithPasswordScreen extends StatelessWidget {
  const LoginWithPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayoutWithLoading(
      appBar: DefaultAppBar(
        title: S.current.loginWithPasswordNavTitle,
        centerTitle: true,
      ),
      bodyPadding: PaddingScreen.paddingLTR,
      slivers: [SliverFillRemaining(child: LoginWithPasswordForm())],
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
