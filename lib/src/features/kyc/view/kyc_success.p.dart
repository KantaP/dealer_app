import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_success.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_success.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:lottie/lottie.dart';

class KycSuccessView extends CustomView<KycSuccessViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const KycSuccessView(this.kycLevel2ViewModel,
      {required KycSuccessViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<KycSuccessView, KycSuccessViewModel> createState() =>
      _KycSuccessViewState(viewModel);
}

class _KycSuccessViewState
    extends ViewState<KycSuccessView, KycSuccessViewModel> {
  _KycSuccessViewState(super.viewModel);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
    viewModel.setContext(context);
    viewModel.onValueRefResponse();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<KycSuccessPageState>(
        stream: viewModel.state,
        builder: (context, stateSnapshot) {
          if (stateSnapshot.hasData == false) return Container();
          if (stateSnapshot.data!.isLoading) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Lottie.asset(
                      AssetJson.loading,
                    ),
                  ),
                ),
              ],
            );
          }
          return Padding(
            padding: const EdgeInsets.all(24),
            child: FutureBuilder<KycFinalPageState>(
              future: viewModel.getCurrentProgress(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Lottie.asset(
                        AssetJson.loading,
                      ),
                    ),
                  );
                }
                // if (snapshot.connectionState == ConnectionState.done) {
                //   return FutureBuilder<int>(
                //     initialData: 1,
                //     future: viewModel.getAttempt(),
                //     builder: (_, attemptValue) {
                //       if (attemptValue.connectionState ==
                //           ConnectionState.waiting) {
                //         return Container();
                //       }
                //       if (attemptValue.connectionState ==
                //           ConnectionState.done) {
                //         return StreamBuilder<KycSuccessPageState>(
                //           stream: viewModel.state,
                //           builder: (context, state) {
                //             if (state.hasData == false) return Container();
                //             print(snapshot.data!.ndidResult);
                //             return Column(
                //               mainAxisSize: MainAxisSize.min,
                //               crossAxisAlignment: CrossAxisAlignment.stretch,
                //               children: (snapshot.data!.ndidResult ==
                //                       'completed')
                //                   ? successWidgets(
                //                       state.data ?? KycSuccessPageState(),
                //                     )
                //                   : (snapshot.data!.ndidResult == 'failed')
                //                       ? failedWidgets(
                //                           attemptValue.data ?? 0,
                //                           state.data ?? KycSuccessPageState(),
                //                         )
                //                       : rejectWidget(
                //                           state.data ?? KycSuccessPageState(),
                //                         ),
                //             );
                //           },
                //         );
                //       }
                //       return Container();
                //     },
                //   );
                // }
                return Container();
              },
            ),
          );
        });
  }

  List<Widget> successWidgets(KycSuccessPageState pageState) {
    return [
      const SizedBox(
        height: 24,
      ),
      SizedBox(
        width: 200,
        height: 261,
        child: Image.asset(AssetImages.kycSuccess),
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
          '${S.of(context).kycSuccessRef}: ${pageState.ref}',
          style: paragraph1RegularStyle,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
        onPressed: () {
          viewModel.next();
        },
        child: Text(S.of(context).backtoHomeButton),
      )
    ];
  }

  List<Widget> failedWidgets(int attempt, KycSuccessPageState pageState) {
    return [
      const SizedBox(
        height: 24,
      ),
      SizedBox(
        width: 200,
        height: 261,
        child: Image.asset(AssetImages.kycNotSuccess),
      ),
      const SizedBox(
        height: 60,
      ),
      Center(
        child: HilightText(
          textAlign: TextAlign.center,
          text: S.current.ndidFailedTitle,
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
          pageState.errorMessage,
          style: paragraph1RegularStyle,
          textAlign: TextAlign.center,
        ),
      ),
      Visibility(
        visible: attempt == 2 ||
            pageState.createRequestResponse.type == NdidType.agent.name,
        child: const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Divider(
            color: midGreyColor,
          ),
        ),
      ),
      Visibility(
        visible: attempt == 2 ||
            pageState.createRequestResponse.type == NdidType.agent.name,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).ndidIntroContact,
              style: paragraph2Style?.copyWith(color: darkGreyColor),
              textAlign: TextAlign.center,
            ),
            // Text(
            //   S.of(context).ndidErrorFinalDesc1,
            //   style: paragraph2Style?.copyWith(color: darkGreyColor),
            // ),
            // const SizedBox(
            //   height: 4,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0),
            //   child: Text(
            //     S.of(context).ndidErrorFinalDesc2,
            //     style: paragraph2Style?.copyWith(color: darkGreyColor),
            //   ),
            // ),
            // const SizedBox(
            //   height: 4,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0),
            //   child: Text(
            //     S.of(context).ndidErrorFinalDesc3,
            //     style: paragraph2Style?.copyWith(color: darkGreyColor),
            //   ),
            // ),
            // const SizedBox(
            //   height: 4,
            // ),
            // Text(
            //   S.of(context).ndidErrorFinalDesc4,
            //   style: paragraph2Style?.copyWith(color: darkGreyColor),
            // )
          ],
        ),
      ),
      const SizedBox(
        height: 60,
      ),
      Visibility(
        visible: attempt < 2 &&
            pageState.createRequestResponse.type == NdidType.public.name,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ElevatedButton(
            onPressed: () {
              viewModel.backtoIdp();
            },
            child: Text(S.of(context).kycNdidAgainButton),
          ),
        ),
      ),
      Visibility(
        visible: attempt < 2 &&
            pageState.createRequestResponse.type == NdidType.public.name,
        child: OutlinedButton(
          style: outlineAlertButtonStyle,
          onPressed: () {
            viewModel.cancelDialogAlert(context);
          },
          child: Text(S.of(context).kycNdidCancel2ndButton),
        ),
      ),
      Visibility(
        visible: attempt == 2 ||
            pageState.createRequestResponse.type == NdidType.agent.name,
        child: ElevatedButton(
          onPressed: () {
            viewModel.backToHome();
          },
          child: Text(
            S.of(context).backtoHomeButton,
          ),
        ),
      )
    ];
  }

  List<Widget> rejectWidget(KycSuccessPageState pageState) {
    return [
      const SizedBox(
        height: 24,
      ),
      SizedBox(
        width: 200,
        height: 261,
        child: Image.asset(AssetImages.kycNotSuccess),
      ),
      const SizedBox(
        height: 60,
      ),
      Center(
        child: HilightText(
          textAlign: TextAlign.center,
          text: S.current.ndidFailedTitle,
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
        child: Center(
          child: Text(
            S.of(context).ndidFailedTimeoutDesc,
            style: paragraph1RegularStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Divider(
          color: midGreyColor,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).ndidErrorFinalDesc1,
            style: paragraph2Style?.copyWith(color: darkGreyColor),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              S.of(context).ndidErrorFinalDesc2,
              style: paragraph2Style?.copyWith(color: darkGreyColor),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              S.of(context).ndidErrorFinalDesc3,
              style: paragraph2Style?.copyWith(color: darkGreyColor),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            S.of(context).ndidErrorFinalDesc4,
            style: paragraph2Style?.copyWith(color: darkGreyColor),
          )
        ],
      ),
      const SizedBox(
        height: 60,
      ),
      ElevatedButton(
        onPressed: () {
          viewModel.backToHome();
        },
        child: Text(
          S.of(context).backtoHomeButton,
        ),
      )
    ];
  }
}
