import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/di/kyc_term_condition.vm.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_new.abs.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showKycRisk({Function? onPress}) {
  return showCupertinoModalPopup(
    context: NavigationService.navigatorKey.currentContext!,
    builder: (_) => KycTermConditionModalBottomSheet(
      viewModel: getIt<KycTermConditionViewModel>(),
    ),
  );
}

class KycTermConditionModalBottomSheet
    extends CustomViewScreen<KycTermConditionViewModel> {
  const KycTermConditionModalBottomSheet(
      {super.key, required KycTermConditionViewModel viewModel})
      : super.model(viewModel);

  @override
  State<KycTermConditionModalBottomSheet> createState() =>
      _KycTermConditionModalBottomSheetState(viewModel);
}

class _KycTermConditionModalBottomSheetState extends CustomViewState<
    KycTermConditionModalBottomSheet, KycTermConditionViewModel> {
  _KycTermConditionModalBottomSheetState(super.viewModel);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: DefaultAppBar(
        pinned: true,
        title: S.of(context).kycTermAcceptRiskTitle,
      ),
      slivers: [
        // SliverToBoxAdapter(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
        //     child: Text(
        //       S.of(context).kycTermAcceptRiskTitle,
        //       style: titleStyle,
        //     ),
        //   ),
        // ),
        const SliverToBoxAdapter(
          child: SizedBox(height: Spacing.spacing20),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            child: FutureBuilder<String>(
              future: viewModel.loadTermCondition(),
              builder: (context, snapshot) => Text(snapshot.data!),
            ),
          ),
        ),
        SizedBox(
          height: paddingBottom(),
        )
      ],
      physics: const BouncingScrollPhysics(),
      extendBody: false,
    );
  }
}
