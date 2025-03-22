import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_level_1.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_level_1.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_stepper_flex.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

class KycLevel1View extends CustomView<KycLevel1ViewModel> {
  const KycLevel1View({required KycLevel1ViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _KycLevel1ViewState createState() => _KycLevel1ViewState(viewModel);
}

class _KycLevel1ViewState extends ViewState<KycLevel1View, KycLevel1ViewModel> {
  _KycLevel1ViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.getCurrentProgress();
    viewModel.firebaseListener();
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
                S.of(context).kycLevel1Title,
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
                    child: StreamBuilder<KycLevel1PageState>(
                        stream: viewModel.state,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CustomStepperFlex(
                              maxStep: 2,
                              currentIndex: snapshot.data!.currentStepIndex,
                              currentIndexProgress:
                                  viewModel.getCurrentProgressPercent(),
                              labels: [
                                S.of(context).kycLevel1Step1,
                                S.of(context).kycLevel1Step2,
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
                      // KeepAlivePage(
                      //   child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     padding: const EdgeInsets.only(
                      //         top: 40.0, right: 24, left: 24),
                      //     children: const [
                      //       KycInformationView(
                      //         viewModel,
                      //         viewModel: getIt<KycInformationViewModel>(),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // KeepAlivePage(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(16.0),
                      //     child: KycLevel1ProcessView(
                      //       viewModel,
                      //       viewModel: getIt<KycLevel1ProcessViewModel>(),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        StreamBuilder<KycLevel1PageState>(
          stream: viewModel.state,
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
