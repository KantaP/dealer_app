import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_introdunction.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/id_upload.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class KycIntrodunctionView extends CustomView<KycIntrodunctionViewModel> {
  const KycIntrodunctionView(
      {required KycIntrodunctionViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _KycIntrodunctionViewState createState() =>
      _KycIntrodunctionViewState(viewModel);
}

class _KycIntrodunctionViewState
    extends ViewState<KycIntrodunctionView, KycIntrodunctionViewModel> {
  _KycIntrodunctionViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    // viewModel.onBack();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          HilightText(
            text: S.of(context).kycIntrodunctionHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const IdUpload(),
          const SizedBox(
            height: 40,
          ),
          _buildActionButtons(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return ElevatedButton(
      onPressed: () {
        viewModel.next();
      },
      child: Text(S.of(context).nextButton),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       actions: [
  //         Padding(
  //           padding: const EdgeInsets.only(top: 20.0, right: 20),
  //           child: GestureDetector(
  //             onTap: () {
  //               viewModel.next();
  //             },
  //             child: Text(
  //               S.of(context).nextButton,
  //               style: textInButtonStyle?.copyWith(color: blueColor),
  //             ),
  //           ),
  //         )
  //       ],
  //       leading: GestureDetector(
  //         onTap: () {
  //           viewModel.onBack();
  //         },
  //         child: Image.asset(
  //           AssetIcons.close,
  //           width: 25,
  //           height: 25,
  //         ),
  //       ),
  //     ),
  //     body: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 32.0),
  //         child: CustomScrollView(
  //           primary: false,
  //           slivers: [
  //             SliverFillRemaining(
  //               child: PageView(
  //                 controller: viewModel.pageController,
  //                 physics: const BouncingScrollPhysics(),
  //                 children: const [
  //                   IdUpload(),
  //                   FrontIdZoom(),
  //                   PhotoIdCard(),
  //                   PhotoFrontCard(),
  //                   PhotoSelfie()
  //                 ],
  //                 onPageChanged: (index) {
  //                   viewModel.updateState(
  //                     {KycIntrodunctionPageStateFields.pageIndex: index},
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
