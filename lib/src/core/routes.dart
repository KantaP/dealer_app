import 'package:aconnec_1109_x/src/features/authenticate/model/otp_verification_arguments.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/send_reset_password_arguments.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/verify_email_arguments.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/suspend_account.p.dart';
import 'package:aconnec_1109_x/src/features/coin/view/coin_list_screen.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/request_form.arguments.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/account_manage_submenu.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/account_submenu.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/contact.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/help_submenu.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/notification.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/other_submenu.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/report_problem.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/request_form.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/setting_submenu.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/confirm_order_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/exchange_token_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/exchange_input.p.dart';
import 'package:aconnec_1109_x/src/features/user/view/user_bank_account.p.dart';
import 'package:aconnec_1109_x/src/features/user/view/user_manage_personal_data.p.dart';
import 'package:aconnec_1109_x/src/features/user/view/user_profile.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/cancel_reason_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_cancel_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_completed_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_toreceive_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_payment_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_receive_coin_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/order_toreceive.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/select_network.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/transaction_download.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/waiting_receive_coin.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/order_toreceive.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/select_network.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/transaction_download.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/waiting_receive_coin.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/edit_bank_account_arguments.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/app_privacy_policy.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/app_term.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/check_id_card.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/qr_code_scanner.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/kyc_requied.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/qr_code_scanner.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/risk_condition.p.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/create_account.p.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/create_account.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/enter_pin.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/otp_verification.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/phone_auth.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/enter_pin.p.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/side_menu.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/side_menu.p.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/set_pin_complete.vm.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/set_pin_complete.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/knowledge_question.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_id_card.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_introdunction.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_level_1.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_selfie_intro.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/suiteable_question.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/knowledge_question.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_id_card.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_introdunction.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_level_1.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_new.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/kyc_selfie_intro.p.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/suiteable_question.p.dart';
import 'package:aconnec_1109_x/src/features/profile/view/di/set_fullname.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/set_pin.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/otp_verification.p.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/phone_auth.p.dart';
import 'package:aconnec_1109_x/src/features/profile/view/set_fullname.p.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/set_pin.p.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/sign_in.p.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/create_complete.p.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/create_complete.vm.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/getting_started.vm.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/splash_screen.vm.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/welcome_back.vm.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/getting_started.p.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/splash_screen.p.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/welcome_back.p.dart';
import 'package:aconnec_1109_x/src/features/main/view/di/main.vm.dart';
import 'package:aconnec_1109_x/src/features/main/view/main.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/transaction_history.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/exchange_government_token.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/cancel_reason.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/confirm_order.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/exchange_government_token.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/cancel_reason.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/confirm_order.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/order_cancel.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/order_completed.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/payment_completed.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/waiting_payment.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/order_cancel.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/order_completed.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/payment_completed.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/transaction_history.p.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/waiting_payment.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/add_bank_accout.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/capture_back_id_card.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/capture_face.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/capture_id_card.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/add_bank_account.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/capture_back_id_card.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/capture_face.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/capture_id_card.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/dropdown_payment.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/select_bank.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/select_item.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/select_payment.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/dropdown_payment.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/select_bank.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/select_bank_recieved.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/select_item.p.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/select_payment.p.dart';
import '../features/authenticate/view/di/sign_in.vm.dart';
import '../features/authenticate/view/forgot_password.p.dart';
import '../features/authenticate/view/login_with_password.p.dart';
import '../features/authenticate/view/send_reset_password.p.dart';
import '../features/authenticate/view/sign_up_with_password.p.dart';
import '../features/authenticate/view/verify_email.p.dart';
import '../features/utilities/view/di/select_bank_recieved.vm.dart';
import '../features/utilities/view/edit_bank_account.p.dart';

class SlideFadeRoute extends PageRouteBuilder {
  final Widget page;
  SlideFadeRoute({required this.page, RouteSettings? settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: FadeTransition(
              opacity: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(animation),
              child: child,
            ),
          ),
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
        );
}

class LeftToRightRoute extends PageRouteBuilder {
  final Widget page;
  LeftToRightRoute({required this.page, RouteSettings? settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: FadeTransition(
              opacity: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(animation),
              child: child,
            ),
          ),
          settings: settings,
          transitionDuration: const Duration(milliseconds: 200),
        );
}

class AppRouter {
  Route<dynamic>? route(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstant.splashScreen:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SplashScreenPage(viewModel: getIt<SplashScreenViewModel>()),
        );
      case RoutesConstant.home:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: MainPage(
            viewModel: getIt<MainViewModel>(),
          ),
        );
      case RoutesConstant.createAccount:
        return SlideFadeRoute(
          settings: settings,
          page: CreateAccountPage(viewModel: getIt<CreateAccountViewModel>()),
        );
      case RoutesConstant.userSignIn:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SignInPage(viewModel: getIt<SignInPageViewModel>()),
        );
      case RoutesConstant.setPin:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SetPinPage(viewModel: getIt<SetPinViewModel>()),
        );
      case RoutesConstant.gettingStarted:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: GettingStartedPage(viewModel: getIt<GettingStartedViewModel>()),
        );
      case RoutesConstant.otpVerification:
        final OtpVerificationArgumentsScreen arguments =
            settings.arguments as OtpVerificationArgumentsScreen;
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: OtpVerificationPage(
            viewModel: getIt<OtpVerificationViewModel>(),
            phoneNumber: arguments.phoneNumber,
            mode: arguments.mode,
          ),
        );
      case RoutesConstant.phoneAuth:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          // page: PhoneAuthPage(viewModel: getIt<PhoneAuthViewModel>()),
          page: SignUpWithPasswordScreen(),
        );
      case RoutesConstant.welcomBack:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: WelcomBackPage(viewModel: getIt<WelcomeBackViewModel>()),
        );
      case RoutesConstant.setFullname:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SetFullnamePage(viewModel: getIt<SetFullnameViewModel>()),
        );
      case RoutesConstant.createComplete:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: CreateCompletePage(viewModel: getIt<CreateCompleteViewModel>()),
        );
      case RoutesConstant.kycIdCard:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: KycIdCardView(viewModel: getIt<KycIdCardViewModel>()),
        );
      case RoutesConstant.enterPin:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: EnterPinView(viewModel: getIt<EnterPinViewModel>()),
        );
      case RoutesConstant.setPinComplete:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SetPinCompleteView(viewModel: getIt<SetPinCompleteViewModel>()),
        );
      case RoutesConstant.kyc:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: KycLevel2View(viewModel: getIt<KycLevel2ViewModel>()),
        );
      case RoutesConstant.selectItem:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SelectItemView(viewModel: getIt<SelectItemViewModel>()),
        );
      case RoutesConstant.suiteableQuestion:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SuiteableQuestionView(
            viewModel: getIt<SuiteableQuestionViewModel>(),
          ),
        );
      case RoutesConstant.knowledgeQuestion:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: KnowledgeQuestionView(
            viewModel: getIt<KnowledgeQuestionViewModel>(),
          ),
        );
      case RoutesConstant.kycIntrodunction:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: KycIntrodunctionView(
            viewModel: getIt<KycIntrodunctionViewModel>(),
          ),
        );
      case RoutesConstant.captureIdCard:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: CaptureIdCardView(
            viewModel: getIt<CaptureIdCardViewModel>(),
          ),
        );
      case RoutesConstant.kycLevel1:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: KycLevel1View(
            viewModel: getIt<KycLevel1ViewModel>(),
          ),
        );
      case RoutesConstant.captureFace:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: CaptureFaceView(
            viewModel: getIt<CaptureFaceViewModel>(),
          ),
        );
      case RoutesConstant.kycSelfieIntro:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: KycSelfieIntroView(
            viewModel: getIt<KycSelfieIntroViewModel>(),
          ),
        );
      case RoutesConstant.captureBackIdCard:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: CaptureBackIdCardView(
            viewModel: getIt<CaptureBackIdCardViewModel>(),
          ),
        );
      // case RoutesConstant.sideMenu:
      //   return SlideFadeRoute(
      //     // Make sure to pass `setting` in to ensure the route name is kept
      //     settings: settings,
      //     page:  SideMenuView(
      //       viewModel: getIt<SideMenuViewModel>(),
      //     ),
      //   );
      case RoutesConstant.buyGToken:
        final ExchangeTokenArguments arguments =
            settings.arguments as ExchangeTokenArguments;
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: ExchangeInputScreen(
            // viewModel: getIt<ExchangeGovernmentTokenViewModel>(),
            coinData: arguments.coinData,
            coinPrice: arguments.coinPrice,
          ),
        );
      case RoutesConstant.confirmOrder:
        final ConfirmOrderArgumentsScreen arguments =
            settings.arguments as ConfirmOrderArgumentsScreen;
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: ConfirmOrderView(
            viewModel: getIt<ConfirmOrderViewModel>(),
            arguments: arguments,
          ),
        );
      case RoutesConstant.addBankAccount:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: AddBackAccountView(
            viewModel: getIt<AddBankAccountViewModel>(),
          ),
        );
      case RoutesConstant.selectBank:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SelectBankView(
            viewModel: getIt<SelectBankViewModel>(),
          ),
        );
      case RoutesConstant.selectPayment:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SelectPaymentView(
            viewModel: getIt<SelectPaymentViewModel>(),
          ),
        );
      case RoutesConstant.dropdownPayment:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: DropdownPaymentView(
            viewModel: getIt<DropdownPaymentViewModel>(),
          ),
        );
      case RoutesConstant.waitingPayment:
        final WaitingPaymentArgumentsScreen arguments =
            settings.arguments as WaitingPaymentArgumentsScreen;
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: WaitingPaymentView(
            viewModel: getIt<WaitingPaymentViewModel>(),
            idOrder: arguments.idOrder,
            refCode: arguments.refCode,
          ),
        );
      case RoutesConstant.paymentCompleted:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: PaymentCompletedView(
            viewModel: getIt<PaymentCompletedViewModel>(),
          ),
        );
      case RoutesConstant.orderCompleted:
        final OrderCompletedArgumentsScreen arguments =
            settings.arguments as OrderCompletedArgumentsScreen;
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: OrderCompletedView(
            viewModel: getIt<OrderCompletedViewModel>(),
            idOrder: arguments.idOrder,
            refCode: arguments.refCode,
          ),
        );
      case RoutesConstant.cancelReason:
        final CancelReasonArgumentsScreen arguments =
            settings.arguments as CancelReasonArgumentsScreen;
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: CancelReasonView(
            viewModel: getIt<CancelReasonViewModel>(),
            idOrder: arguments.idOrder,
            refCode: arguments.refCode,
          ),
        );
      case RoutesConstant.orderCancel:
        final OrderCancelArgumentsScreen arguments =
            settings.arguments as OrderCancelArgumentsScreen;
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: OrderCancelView(
            viewModel: getIt<OrderCancelViewModel>(),
            idOrder: arguments.idOrder,
            refCode: arguments.refCode,
          ),
        );
      case RoutesConstant.selectBankRecieved:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SelectBankRecievedView(
            viewModel: getIt<SelectBankRecievedViewModel>(),
          ),
        );
      case RoutesConstant.orderHistory:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: TransactionHistoryView(
            viewModel: getIt<TransactionHistoryViewModel>(),
          ),
        );
      case RoutesConstant.kycAll:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: KycFinalView(
            viewModel: getIt<KycFinalViewModel>(),
          ),
        );
      case RoutesConstant.qrCodeScanner:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: QrCodeScannerView(
            viewModel: getIt<QrCodeScannerViewModel>(),
          ),
        );
      case RoutesConstant.selectNetwork:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: SelectNetworkView(
            viewModel: getIt<SelectNetworkViewModel>(),
          ),
        );
      case RoutesConstant.waitReceiveCoin:
        final WaitingReceiveCoinArgumentsScreen arguments =
            settings.arguments as WaitingReceiveCoinArgumentsScreen;
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: WaitingReceiveCoinView(
            viewModel: getIt<WaitingReceiveCoinViewModel>(),
            idOrder: arguments.idOrder,
            refCode: arguments.refCode,
          ),
        );
      case RoutesConstant.orderToReceive:
        final OrderToreceiveArgumentsScreen arguments =
            settings.arguments as OrderToreceiveArgumentsScreen;
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: OrderToReceiveView(
            viewModel: getIt<OrderToReceiveViewModel>(),
            idOrder: arguments.idOrder,
            refCode: arguments.refCode,
          ),
        );
      case RoutesConstant.transactioDownload:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: TransactionDownloadView(
            viewModel: getIt<TransactionDownloadViewModel>(),
          ),
        );
      case RoutesConstant.accountSubmenu:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const AccountSubmenuView(),
        );
      case RoutesConstant.userProfile:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const UserProfileView(),
        );
      case RoutesConstant.requestForm:
        final RequestFormArgumentsScreen arguments =
            settings.arguments as RequestFormArgumentsScreen;
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: RequestFormView(
            title: arguments.title,
            formUrl: arguments.formUrl,
          ),
        );
      case RoutesConstant.accountManageSubmenu:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const AccountManageSubmenuView(),
        );
      case RoutesConstant.suspendAccount:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const SuspendAccountView(),
        );
      case RoutesConstant.settingSubmenu:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const SettingSubmenuView(),
        );
      case RoutesConstant.userBankAccount:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const UserBankAccountView(),
        );
      case RoutesConstant.helpSubmenu:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const HelpSubmenuView(),
        );
      case RoutesConstant.contact:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const ContactView(),
        );
      case RoutesConstant.otherSubmenu:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const OtherSubmenuView(),
        );
      case RoutesConstant.coinList:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const CoinListScreen(),
        );
      case RoutesConstant.appTerm:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const AppTermViewScreen(),
        );
      case RoutesConstant.appPrivacy:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const AppPrivacyPolicyViewScreen(),
        );
      case RoutesConstant.reportProblem:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const ReportProblemViewScreen(),
        );
      case RoutesConstant.userManagePersonalData:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const UserManagePersonalDataViewScreen(),
        );
      case RoutesConstant.checkIdCard:
        return LeftToRightRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const CheckIdCardViewScreen(),
        );
      case RoutesConstant.riskCondition:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const RiskConditionScreen(),
        );
      case RoutesConstant.notification:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const NotificationScreen(),
        );
      case RoutesConstant.kycRequiredWarning:
        return SlideFadeRoute(
          // Make sure to pass `setting` in to ensure the route name is kept
          settings: settings,
          page: const KycRequiredScreen(),
        );
      case RoutesConstant.editBankAccount:
        final EditBankAccountArguments arguments =
            settings.arguments as EditBankAccountArguments;
        return SlideFadeRoute(
          settings: settings,
          page: EditBankAccountScreen(
            accountData: arguments.bankData,
          ),
        );
      case RoutesConstant.loginWithPassword:
        return SlideFadeRoute(
          settings: settings,
          page: const LoginWithPasswordScreen(),
        );
      case RoutesConstant.signUpWithPassword:
        return SlideFadeRoute(
            page: SignUpWithPasswordScreen(), settings: settings);
      case RoutesConstant.verifyEmail:
        return SlideFadeRoute(page: VerifyEmailScreen(), settings: settings);
      case RoutesConstant.forgotPassword:
        return SlideFadeRoute(page: ForgotPasswordScreen(), settings: settings);
      case RoutesConstant.resetPassword:
        final SendResetPasswordArgumentsScreen arguments =
            settings.arguments as SendResetPasswordArgumentsScreen;
        return SlideFadeRoute(
            page: SendResetPasswordScreen(
              email: arguments.email,
            ),
            settings: settings);
      default:
        throw Exception('Route ${settings.name} not implemented');
    }
  }
}
