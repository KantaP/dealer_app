import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/utilities/bindings/utilities.binding.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class AppPrivacyPolicyViewScreen extends StatelessWidget {
  const AppPrivacyPolicyViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = UtilitiesBinding.appPrivacyViewModel;
    return DefaultLayout(
      appBar: DefaultAppBar(
        title: S.of(context).privacyTitle,
        centerTitle: true,
      ),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: CustomFuture<String>(
            customLoading: Container(),
            future: viewModel.loadPrivacy(),
            builder: (_, snapshot) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
              child: Text(snapshot.data!),
            ),
          ),
        )
      ],
      physics: const BouncingScrollPhysics(),
      extendBody: true,
    );
  }
}
