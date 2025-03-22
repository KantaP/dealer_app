import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/di/kyc_not_approve.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';

import '../../../../../../core/navigator_service.dart';

Future showKycNotApproveModalBottomSheet(BuildContext context,
    {String? title, String? content, Function? onBack}) {
  return showCupertinoModalPopup(
    context: NavigationService.navigatorKey.currentContext!,
    builder: (_) => KycFailedContent(
      viewModel: getIt<KycNotApproveViewModel>(),
      title: title ?? '',
      content: content ?? '',
      onBack: onBack ?? () {},
    ),
  );
}

class KycFailedContent extends CustomView<KycNotApproveViewModel> {
  const KycFailedContent(
      {super.key,
      required KycNotApproveViewModel viewModel,
      required this.title,
      required this.content,
      required this.onBack})
      : super.model(viewModel);

  final String title;
  final String content;
  final Function onBack;

  @override
  ViewState<KycFailedContent, KycNotApproveViewModel> createState() =>
      _KycFailedContentState(viewModel);
}

class _KycFailedContentState
    extends ViewState<KycFailedContent, KycNotApproveViewModel> {
  _KycFailedContentState(super.viewModel);

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
          child: _buildWidgets(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: paddingBottom(),
          ),
        )
      ],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: false,
    );
  }

  Widget _buildWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildContent(),
          const Spacer(),
          _buildButton(),
          SizedBox(
            height:
                max(MediaQuery.of(context).padding.bottom, Spacing.spacing24),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.images.failedFullFrame.image(),
        HilightText(
          text: widget.title,
          hilightStyle: headline4BoldStyle?.merge(
            const TextStyle(color: blueColor),
          ),
          normalStyle: headline4LightStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        Text(
          widget.content,
          style: paragraph1LightStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {
        viewModel.onBackToHome();
      },
      child: Text(
        S.of(context).okButton,
      ),
    );
  }
}
