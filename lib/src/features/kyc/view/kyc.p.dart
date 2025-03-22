import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_stepper_flex.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

class KycLevel2View extends CustomView<KycLevel2ViewModel> {
  const KycLevel2View({required KycLevel2ViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _KycLevel2ViewState createState() => _KycLevel2ViewState(viewModel);
}

class _KycLevel2ViewState extends ViewState<KycLevel2View, KycLevel2ViewModel> {
  _KycLevel2ViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.listenPageState();
    viewModel.firebaseListener();
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.getCurrentProgress();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    viewModel.getCurrentProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: blueColor,
          appBar: AppBar(
              // automaticallyImplyLeading: false,
              backgroundColor: blueColor,
              title: Text(
                S.of(context).kycTitle,
                style: lightNavTitleTextStyle,
              ),
              leading: GestureDetector(
                onTap: () {
                  viewModel.onBack();
                },
                child: const Icon(
                  Icons.close,
                  color: whiteColor,
                ),
              )),
          body: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 20.0),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    color: blueColor,
                    height: 100,
                    child: StreamBuilder<KycLevel2PageState>(
                        stream: viewModel.pageState,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CustomStepperFlex(
                              maxStep: 3,
                              currentIndex: snapshot.data!.currentStepIndex,
                              currentIndexProgress:
                                  viewModel.getCurrentProgressPercent(),
                              labels: [
                                S.of(context).kycStep2,
                                S.of(context).kycStep3,
                                S.of(context).kycStep4,
                              ],
                            );
                          }
                          return Container();
                        }),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: viewModel.pageController,
                    children: const [
                      //0
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     // padding: const EdgeInsets.only(
                      //     //     top: 40.0, right: 24, left: 24),
                      //     children: [
                      //       KycAddressView(viewModel,
                      //           viewModel: getIt<KycAddressViewModel>())
                      //     ],
                      //   ),
                      // ),
                      // //1
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     // padding: const EdgeInsets.only(
                      //     //     top: 40.0, right: 24, left: 24),
                      //     children: [
                      //       KycFundView(viewModel,
                      //           viewModel: getIt<KycFundViewModel>()),
                      //     ],
                      //   ),
                      // ),
                      // //2
                      // AcceptLawView(
                      //   viewModel,
                      //   viewModel: getIt<AcceptLawViewModel>(),
                      // ),
                      // //16
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       KycInformationSummaryView(
                      //         viewModel,
                      //         viewModel:
                      //             getIt<KycInformationSummaryViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //3
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       SuiteableView(
                      //         viewModel,
                      //         viewModel: getIt<SuiteableViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //4
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       PreKnowledgeView(
                      //         viewModel,
                      //         viewModel: getIt<PreKnowledgeViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //5
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       KnowledgeResultView(
                      //         viewModel,
                      //         viewModel: getIt<KnowledgeResultViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      //6
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       KycTermView(
                      //         viewModel,
                      //         viewModel: getIt<KycTermViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      //7
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       KycChoiceView(
                      //         viewModel,
                      //         viewModel: getIt<KycChoiceViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //8
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       KycUploadIdCardView(
                      //         viewModel,
                      //         viewModel: getIt<KycUploadIdCardViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //9
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       NdidTermView(
                      //         viewModel,
                      //         viewModel: getIt<NdidTermViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //10
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       NdidIntroView(
                      //         viewModel,
                      //         viewModel: getIt<NdidIntroViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //11
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       NdidPaymentView(
                      //         viewModel,
                      //         viewModel: getIt<NdidPaymentViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //12
                      // KeepAlivePage(
                      //   child: StreamBuilder<KycLevel2PageState>(
                      //       stream: viewModel.pageState,
                      //       builder: (context, snapshot) {
                      //         return SingleChildScrollView(
                      //           physics: const BouncingScrollPhysics(),
                      //           child: (snapshot.hasData)
                      //               ? (snapshot.data!.ndidPaymentResult ==
                      //                       'success')
                      //                   ? NdidPaymentSuccessView(viewModel,
                      //                       viewModel: getIt<
                      //                           NdidPaymentSuccessViewModel>())
                      //                   : NdidPaymentFailedView(viewModel,
                      //                       viewModel: getIt<
                      //                           NdidPaymentFailedViewModel>())
                      //               : Container(),
                      //         );
                      //       }),
                      // ),
                      // //13
                      // KeepAlivePage(
                      //   child: StreamBuilder<KycLevel2PageState>(
                      //     stream: viewModel.pageState,
                      //     builder: (context, snapshot) {
                      //       if (snapshot.hasData) {
                      //         return SingleChildScrollView(
                      //           physics: const BouncingScrollPhysics(),
                      //           child: (snapshot.data!.ndidType ==
                      //                   NdidType.public.name)
                      //               ? BankNdidView(
                      //                   viewModel,
                      //                   viewModel: getIt<BankNdidViewModel>(),
                      //                 )
                      //               : DealerNdidView(viewModel,
                      //                   viewModel:
                      //                       getIt<DealerNdidViewModel>()),
                      //         );
                      //       }
                      //       return Container();
                      //     },
                      //   ),
                      // ),
                      // //14
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       BankNdidWaitingView(
                      //         viewModel,
                      //         viewModel: getIt<BankNdidWaitingViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // //15
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       KycSuccessView(
                      //         viewModel,
                      //         viewModel: getIt<KycSuccessViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        StreamBuilder<KycLevel2PageState>(
          stream: viewModel.pageState,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data?.isLoading ?? false,
              child: const Loading(),
            );
          },
        ),
      ],
    );
  }
}
