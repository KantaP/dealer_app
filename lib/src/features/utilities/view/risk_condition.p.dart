import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/utilities/bindings/utilities.binding.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

import '../../../core/translate/generated/l10n.dart';

class RiskConditionScreen extends StatelessWidget {
  const RiskConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = UtilitiesBinding.riskConditionViewModel;
    return DefaultLayout(
      appBar: DefaultAppBar(
        title: S.of(context).kycTermAcceptRiskTitle,
        centerTitle: true,
      ),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: CustomFuture<String>(
            future: viewModel.loadTerm(),
            customLoading: Container(),
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
