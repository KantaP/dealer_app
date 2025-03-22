import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_level_1_process.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_level_1_process.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:lottie/lottie.dart';

class KycLevel1ProcessView extends CustomView<KycLevel1ProcessViewModel> {
  final KycFinalViewModel kycViewModel;

  const KycLevel1ProcessView(this.kycViewModel,
      {required KycLevel1ProcessViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _KycLevel1ProcessViewState createState() =>
      _KycLevel1ProcessViewState(viewModel);
}

class _KycLevel1ProcessViewState
    extends ViewState<KycLevel1ProcessView, KycLevel1ProcessViewModel> {
  _KycLevel1ProcessViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycLevel1ViewModel(widget.kycViewModel);
  }

  @override
  void didPush() {
    super.didPush();
    Future.delayed(const Duration(seconds: 2), () {
      viewModel.checkIdCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<KycLevel1ProcessPageState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isSuccess == 'success') {
            return successWidget();
          } else if (snapshot.data!.isSuccess == 'failed') {
            return const Center(
              child: Text('failed'),
            );
          }
        }
        return processWidget();
      },
    );
  }

  Widget successWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetImages.kycSuccess,
          height: 250,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: HilightText(
            text: S.of(context).kycLevel1SuccessContent,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            viewModel.goToSetPin();
          },
          child: Text(
            S.of(context).setpinButton,
          ),
        ),
        SizedBox(
          height: paddingBottom(),
        ),
      ],
    );
  }

  Widget processWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Assets.lottie.loading.lottie(),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              S.of(context).kycLevel1ProcessText,
              style: titleStyle?.copyWith(color: blueColor),
            ),
          ),
        ],
      ),
    );
  }
}
