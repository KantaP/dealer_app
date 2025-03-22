import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/di/ndid_tryagain_modal.vm.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/view_model/view_new.abs.dart';

Future<void> showNdidTryagainModalBottomSheet() async {
  return showCupertinoModalPopup(
    context: NavigationService.navigatorKey.currentContext!,
    builder: (_) => NdidTryagainModal(
      viewModel: getIt<NdidTryagainModalViewModel>(),
    ),
  );
}

class NdidTryagainModal extends CustomViewScreen<NdidTryagainModalViewModel> {
  const NdidTryagainModal(
      {super.key, required NdidTryagainModalViewModel viewModel})
      : super.model(viewModel);

  @override
  CustomViewState<NdidTryagainModal, NdidTryagainModalViewModel>
      createState() => _NdidTryagainModalState(viewModel);
}

class _NdidTryagainModalState
    extends CustomViewState<NdidTryagainModal, NdidTryagainModalViewModel> {
  _NdidTryagainModalState(super.viewModel);

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
      physics: const BouncingScrollPhysics(),
      extendBody: false,
      safeAreaBottom: true,
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Assets.images.failedFullFrame.image(
            scale: 0.5,
          ),
          HilightText(
            text: S.current.ndidModalNotSuccessTitle,
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
            S.current.ndidModalTryagainMessage,
            style: paragraph1LightStyle,
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.spacing20),
            child: Divider(
              color: dividerColor,
            ),
          ),
          Text(
            S.current.ndidModalContactHint,
            style: paragraph2Style?.copyWith(color: darkGreyColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Spacing.spacing40,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewModel.onBackToSelectIdp();
                  },
                  child: Text(S.current.kycNdidAgainButton),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                OutlinedButton(
                  style: outlineAlertButtonStyle,
                  onPressed: () {
                    viewModel.goToHome();
                  },
                  child: Text(S.current.kycNdidCancel2ndButton),
                )
              ],
            ),
          ),
          SizedBox(
            height: paddingBottom(),
          )
        ],
      ),
    );
  }
}
