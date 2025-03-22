import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_choice.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

import 'widgets/kyc_choice_item.dart';

class NdidChoiceView extends CustomView<KycChoiceViewModel> {
  final KycFinalViewModel kycViewModel;

  const NdidChoiceView(this.kycViewModel,
      {required KycChoiceViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _KycChoiceViewState createState() => _KycChoiceViewState(viewModel);
}

class _KycChoiceViewState
    extends ViewState<NdidChoiceView, KycChoiceViewModel> {
  _KycChoiceViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).kycWayDescription,
            style: paragraph1LightStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          KycChoiceItem(
            icon: Assets.svgImages.ndidBank.svg(width: 40),
            title: S.of(context).kycWayChioce1,
            descriptions: [
              S.of(context).kycWayChoice1Description1,
              S.of(context).kycWayChoice1Description2,
              S.of(context).kycWayChoice1Description3,
              S.of(context).kycWayChoice1Description4,
              S.of(context).kycWayChoice1Description5,
              S.of(context).kycWayChoice1Description6,
            ],
            onPressed: () {
              viewModel.process(NdidType.public);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          KycChoiceItem(
            icon: Assets.svgImages.ndidCounterService.svg(width: 40),
            title: S.of(context).kycWayChoice2,
            descriptions: [
              S.of(context).kycWayChoice2Description1,
              S.of(context).kycWayChoice2Description2,
              S.of(context).kycWayChoice2Description3
            ],
            onPressed: () {
              viewModel.process(NdidType.counterService);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          // KycChoiceItem(
          //   icon: Assets.svgImages.ndidCounterService.svg(width: 40),
          //   title: 'Dealer',
          //   descriptions: [
          //     S.of(context).kycWayChoice2Description1,
          //     S.of(context).kycWayChoice2Description2,
          //     S.of(context).kycWayChoice2Description3
          //   ],
          //   onPressed: () {
          //     viewModel.process(NdidType.agent);
          //   },
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          Text(
            S.of(context).contactCompany,
            style: paragraph3Style?.copyWith(color: midGreyColor),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
