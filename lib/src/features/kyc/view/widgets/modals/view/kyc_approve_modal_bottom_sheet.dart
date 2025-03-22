import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/di/kyc_approve.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';

import '../../../../../../core/navigator_service.dart';

Future showKycApproveModalBottomSheet(BuildContext context,
    {Function? onPress, String? ref}) {
  return showCupertinoModalPopup(
    context: context,
    builder: (_) => KycApproveModal(
      viewModel: getIt<KycApproveViewModel>(),
      ref: ref ?? '',
    ),
  );
}

class KycApproveModal extends CustomView<KycApproveViewModel> {
  const KycApproveModal({
    super.key,
    required KycApproveViewModel viewModel,
    this.ref,
  }) : super.model(viewModel);

  final String? ref;

  @override
  ViewState<KycApproveModal, KycApproveViewModel> createState() =>
      _KycApproveModalState(viewModel);
}

class _KycApproveModalState
    extends ViewState<KycApproveModal, KycApproveViewModel> {
  _KycApproveModalState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leading: false,
      slivers: [
        _buildContent(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: paddingBottom(),
          ),
        ),
      ],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: true,
      safeAreaTop: true,
      safeAreaBottom: true,
    );
  }

  Widget _buildContent() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            _buildDetail(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                viewModel.onBackToHome();
              },
              child: Text(
                S.of(context).okButton,
              ),
            ),
            SizedBox(
              height: paddingBottom(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetail() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: 200,
          height: 261,
          child: Assets.images.kycSuccess.image(),
        ),
        const SizedBox(
          height: 60,
        ),
        Center(
          child: HilightText(
            textAlign: TextAlign.center,
            text: S.current.kycSuccessHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            '${S.of(context).kycSuccessRef}: ${widget.ref}',
            style: paragraph1RegularStyle,
          ),
        ),
      ],
    );
  }
}
