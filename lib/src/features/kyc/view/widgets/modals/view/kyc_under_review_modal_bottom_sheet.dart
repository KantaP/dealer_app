import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/di/kyc_under_review_modal.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';

import '../../../../../../core/navigator_service.dart';

Future showUnderReviewModalBottomSheet(BuildContext context,
    {Function? onPress}) {
  return showCupertinoModalPopup(
    context: context,
    builder: (_) => UnderReViewModal(
      viewModel: getIt<UnderReviewViewModel>(),
      onPress: onPress,
    ),
  );
}

class UnderReViewModal extends CustomView<UnderReviewViewModel> {
  const UnderReViewModal(
      {super.key, this.onPress, required UnderReviewViewModel viewModel})
      : super.model(viewModel);

  final Function? onPress;

  @override
  ViewState<UnderReViewModal, UnderReviewViewModel> createState() =>
      _UnderReViewModalState(viewModel);
}

class _UnderReViewModalState
    extends ViewState<UnderReViewModal, UnderReviewViewModel> {
  _UnderReViewModalState(super.viewModel);

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
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: _buildContent(),
        ),
      ],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: false,
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildGroup1(),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pop();
              if (widget.onPress != null) {
                widget.onPress!.call();
              }
              viewModel.onBackToHome();
            },
            child: Text(S.current.okButton),
          ),
          SizedBox(
            height: paddingBottom(),
          )
        ],
      ),
    );
  }

  Widget _buildGroup1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: HilightText(
            text: S.current.underReviewHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
        ),
        const SizedBox(
          height: Spacing.spacing40,
        ),
        Center(
          child: Assets.images.underReview.image(scale: 0.5),
        ),
        Flexible(
          child: Text(
            S.current.underReviewTitle,
            style: headline2Style?.copyWith(color: blueColor),
          ),
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        Text(
          S.current.underReviewContent,
          style: paragraph1LightStyle,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
