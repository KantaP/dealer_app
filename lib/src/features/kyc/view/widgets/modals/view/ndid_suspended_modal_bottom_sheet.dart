import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/di/ndid_suspended_modal.vm.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/view_model/view_new.abs.dart';

Future<void> showNdidSuspendedModalBottomSheet() async {
  return showCupertinoModalPopup(
    context: NavigationService.navigatorKey.currentContext!,
    builder: (_) => NdidSuspendedModal(
      viewModel: getIt<NdidSuspendedModalViewModel>(),
    ),
  );
}

class NdidSuspendedModal extends CustomViewScreen<NdidSuspendedModalViewModel> {
  const NdidSuspendedModal(
      {super.key, required NdidSuspendedModalViewModel viewModel})
      : super.model(viewModel);

  @override
  CustomViewState<NdidSuspendedModal, NdidSuspendedModalViewModel>
      createState() => _NdidSuspendedModalState(viewModel);
}

class _NdidSuspendedModalState
    extends CustomViewState<NdidSuspendedModal, NdidSuspendedModalViewModel> {
  _NdidSuspendedModalState(super.viewModel);

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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Assets.images.failedFullFrame.image(scale: 0.5),
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
            S.current.ndidModalTimeoutMessage,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewModel.onBackToHome();
                  },
                  child: Text(S.current.okButton),
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
