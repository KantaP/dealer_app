import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/counter_service_ndid_waiting.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/counter_service_ndid_waiting.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_pdpa.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_intro_counterservice.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_pdpa.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/ndid_intro_counterservice.p.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/fatca.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/address.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/bank_ndid.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/bank_ndid_waiting.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/dealer_ndid.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/address.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/bank_ndid.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/bank_ndid_waiting.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/dealer_ndid.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/fund.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/information.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/knowledge_result.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_choice.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_introdunction.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_select_customer_type.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_select_national.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_selfie_intro.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_success.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_term.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_intro.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_payment.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_payment_failed.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_payment_success.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_term.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/pre_knowledge.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/pre_suiteable_test.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/suiteable.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/fund.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/information.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/knowledge_result.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/ndid_choice.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_introdunction.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_select_customer_type.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_select_national.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_selfie_intro.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_success.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_term.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/ndid_intro.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/ndid_payment.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/ndid_payment_failed.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/ndid_payment_success.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/ndid_term.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/pre_knowloedge.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/pre_suiteable_test.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/suiteable.p.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_stepper_flex.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

import '../../../widgets/keep_alive.dart';
import 'di/fatca.vm.dart';
import 'di/kyc_level_1_process.vm.dart';
import 'kyc_level_1_process.p.dart';

class KycFinalView extends CustomView<KycFinalViewModel> {
  const KycFinalView({required KycFinalViewModel viewModel, super.key})
      : super.model(viewModel);
  @override
  ViewState<KycFinalView, KycFinalViewModel> createState() =>
      _KycNewViewState(viewModel);
}

class _KycNewViewState extends ViewState<KycFinalView, KycFinalViewModel> {
  _KycNewViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    viewModel.reCheck();

    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultLayout(
          appBar: _buildAppBar(),
          slivers: [
            _buildStepper(),
            SliverFillRemaining(
              child: _buildContent(),
            ),
          ],
          physics: const NeverScrollableScrollPhysics(),
          safeAreaBottom: true,
        ),
        StreamBuilder<KycFinalPageState>(
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

  Widget _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: blueColor,
      automaticallyImplyLeading: false,
      title: Text(
        S.of(context).kycNavTitle,
        style: titlePageStyle?.copyWith(color: whiteColor),
      ),
      leading: GestureDetector(
        onTap: () {
          viewModel.onBack();
        },
        child: const SizedBox(
          width: 40,
          child: Icon(
            Icons.close,
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 20.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          color: blueColor,
          height: 100,
          child: StreamBuilder<KycFinalPageState>(
            stream: viewModel.pageState,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // if (snapshot.data!.currentStepIndex == 0) {
                //   return Assets.svgImages.kycStep1.svg();
                // }
                // if (snapshot.data!.currentStepIndex == 1) {
                //   return Assets.svgImages.kycStep2.svg();
                // }
                // if (snapshot.data!.currentStepIndex == 2) {
                //   return Assets.svgImages.kycStep3.svg();
                // }
                return CustomStepperFlex(
                  maxStep: 3,
                  currentIndex: snapshot.data!.currentStepIndex,
                  currentIndexProgress: 0,
                  labels: [
                    S.of(context).kycStep2,
                    S.of(context).kycStep3,
                    S.of(context).kycStep4,
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: viewModel.pageController,
      children: [
        KeepAlivePage(child: Container()),
        //0 start step1
        KeepAlivePage(
          child: KycSelectCustomerTypeView(
            viewModel: getIt<KycSelectCustomerTypeViewModel>(),
          ),
        ),

        //1
        KeepAlivePage(
          child: KycSelectNationalView(
            viewModel: getIt<KycSelectNationalViewModel>(),
          ),
        ),
        //2
        KeepAlivePage(
          child: FatcaView(
            viewModel,
            viewModel: getIt<FatcaViewModel>(),
          ),
        ),

        //3
        KeepAlivePage(
          child: KycTermView(
            viewModel,
            viewModel: getIt<KycTermViewModel>(),
          ),
        ),

        KeepAlivePage(
          child: KycPdpaView(
            viewModel,
            viewModel: getIt<KycPdpaViewModel>(),
          ),
        ),

        //4
        KeepAlivePage(
          child: KycIntrodunctionView(
            viewModel: getIt<KycIntrodunctionViewModel>(),
          ),
        ),
        KeepAlivePage(
          child: KycSelfieIntroView(
            viewModel: getIt<KycSelfieIntroViewModel>(),
          ),
        ),

        //5
        KeepAlivePage(
          child: KycInformationView(
            viewModel,
            viewModel: getIt<KycInformationViewModel>(),
          ),
        ),

        //6
        KeepAlivePage(
          child: KycLevel1ProcessView(
            viewModel,
            viewModel: getIt<KycLevel1ProcessViewModel>(),
          ),
        ),

        //7
        KeepAlivePage(
          child: KycAddressView(
            viewModel,
            viewModel: getIt<KycAddressViewModel>(),
          ),
        ),

        //8
        KeepAlivePage(
          child: KycFundView(
            viewModel,
            viewModel: getIt<KycFundViewModel>(),
          ),
        ),

        //9 start step 2-1
        KeepAlivePage(
          child: PreSuiteableTestView(
            viewModel,
            viewModel: getIt<PreSuiteableTestViewModel>(),
          ),
        ),
        KeepAlivePage(
          child: SuiteableView(
            viewModel,
            viewModel: getIt<SuiteableViewModel>(),
          ),
        ),
        KeepAlivePage(
          child: PreKnowledgeView(
            viewModel,
            viewModel: getIt<PreKnowledgeViewModel>(),
          ),
        ),
        //10 step 2-3
        KeepAlivePage(
          child: KnowledgeResultView(
            viewModel,
            viewModel: getIt<KnowledgeResultViewModel>(),
          ),
        ),
        //11 start step 3-1
        KeepAlivePage(
          child: NdidChoiceView(
            viewModel,
            viewModel: getIt<KycChoiceViewModel>(),
          ),
        ),
        //12 step 3-2
        KeepAlivePage(
          child: NdidTermView(
            viewModel,
            viewModel: getIt<NdidTermViewModel>(),
          ),
        ),
        //13 step 3-3
        KeepAlivePage(
          child: StreamBuilder<KycFinalPageState>(
            stream: viewModel.pageState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              final page = (snapshot.data!.ndidType == NdidType.public.name)
                  ? NdidIntroView(
                      viewModel,
                      viewModel: getIt<NdidIntroViewModel>(),
                    )
                  : (snapshot.data!.ndidType == NdidType.counterService.name)
                      ? NdidIntroCounterServiceView(
                          viewModel,
                          viewModel: getIt<NdidIntroCounterServiceViewModel>(),
                        )
                      : Container();
              return page;
            },
          ),
        ),
        //14 step3-4
        KeepAlivePage(
          child: NdidPaymentView(
            viewModel,
            viewModel: getIt<NdidPaymentViewModel>(),
          ),
        ),
        //15 step3-5
        KeepAlivePage(
          child: StreamBuilder<KycFinalPageState>(
            stream: viewModel.pageState,
            builder: (context, snapshot) {
              return (snapshot.hasData)
                  ? (snapshot.data!.ndidPaymentResult == 'success')
                      ? NdidPaymentSuccessView(
                          viewModel,
                          viewModel: getIt<NdidPaymentSuccessViewModel>(),
                        )
                      : NdidPaymentFailedView(
                          viewModel,
                          viewModel: getIt<NdidPaymentFailedViewModel>(),
                        )
                  : Container();
            },
          ),
        ),
        //16
        KeepAlivePage(
          child: StreamBuilder<KycFinalPageState>(
            stream: viewModel.pageState,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (snapshot.data!.ndidType == NdidType.public.name)
                    ? BankNdidView(
                        viewModel,
                        viewModel: getIt<BankNdidViewModel>(),
                      )
                    : DealerNdidView(viewModel,
                        viewModel: getIt<DealerNdidViewModel>());
              }
              return Container();
            },
          ),
        ),
        //17
        KeepAlivePage(
          child: StreamBuilder<KycFinalPageState>(
            stream: viewModel.pageState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();

              Widget page = Container();
              if (snapshot.data!.ndidType == NdidType.public.name) {
                page = BankNdidWaitingView(
                  viewModel,
                  viewModel: getIt<BankNdidWaitingViewModel>(),
                );
              } else if (snapshot.data!.ndidType ==
                  NdidType.counterService.name) {
                page = CounterServiceNdidWaitingView(
                  viewModel,
                  viewModel: getIt<CounterServiceNdidWaitingViewModel>(),
                );
              }

              return page;
            },
          ),
        ),
        //18
        KeepAlivePage(
          child: KycSuccessView(
            viewModel,
            viewModel: getIt<KycSuccessViewModel>(),
          ),
        ),
      ],
    );
  }
}
