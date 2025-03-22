// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i28;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/local/di/agent_idp.ds.dart' as _i4;
import '../../data/local/di/agent_idp_as.ds.dart' as _i3;
import '../../data/local/di/public_idp.ds.dart' as _i7;
import '../../data/local/di/public_idp_as.ds.dart' as _i6;
import '../../data/local/di/user.ds.dart' as _i9;
import '../../data/local/di/utility_public_idp.ds.dart' as _i10;
import '../../data/local/shared_preferences.dart' as _i8;
import '../../data/network/dio_client.dart' as _i29;
import '../../data/network/firebase_client.dart' as _i5;
import '../../data/repositories/agentAsDatasource.repo.dart' as _i22;
import '../../data/repositories/agentIdpDatasource.repo.dart' as _i23;
import '../../data/repositories/di/ndidService.repo.dev.dart' as _i49;
import '../../data/repositories/di/ndidService.repo.prod.dart' as _i48;
import '../../data/repositories/di/ndidService.repo.stag.dart' as _i47;
import '../../data/repositories/idpAsDatasource.repo.dart' as _i92;
import '../../data/repositories/idpDatasource.repo.dart' as _i35;
import '../../data/repositories/ndidService.repo.dart' as _i46;
import '../../data/repositories/utilityPublicIdpDatasource.repo.dart' as _i76;
import '../../features/authenticate/data/repositories/authentication.repo.dart'
    as _i81;
import '../../features/authenticate/data/repositories/di/authentication.repo.dev.dart'
    as _i84;
import '../../features/authenticate/data/repositories/di/authentication.repo.prod.dart'
    as _i83;
import '../../features/authenticate/data/repositories/di/authentication.repo.stag.dart'
    as _i82;
import '../../features/authenticate/service/di/authentication.firebase.dart'
    as _i17;
import '../../features/authenticate/service/di/phone_auth_countdown.dart'
    as _i12;
import '../../features/authenticate/view/di/create_account.vm.dart' as _i87;
import '../../features/authenticate/view/di/enter_pin.vm.dart' as _i89;
import '../../features/authenticate/view/di/forgot_password.vm.dart' as _i33;
import '../../features/authenticate/view/di/login_with_password.vm.dart'
    as _i43;
import '../../features/authenticate/view/di/otp_verification.vm.dart' as _i116;
import '../../features/authenticate/view/di/phone_auth.vm.dart' as _i57;
import '../../features/authenticate/view/di/send_reset_password.vm.dart'
    as _i66;
import '../../features/authenticate/view/di/set_pin.vm.dart' as _i122;
import '../../features/authenticate/view/di/sign_in.vm.dart' as _i123;
import '../../features/authenticate/view/di/sign_up_with_password.vm.dart'
    as _i70;
import '../../features/authenticate/view/di/suspend_account.vm.dart' as _i127;
import '../../features/authenticate/view/di/verify_email.vm.dart' as _i77;
import '../../features/bank/services/di/payment.firebase.dart' as _i56;
import '../../features/coin/service/coin.service.dart' as _i19;
import '../../features/dashboard/view/di/account_manage_submenu.vm.dart'
    as _i132;
import '../../features/dashboard/view/di/account_submenu.vm.dart' as _i21;
import '../../features/dashboard/view/di/help_submenu.vm.dart' as _i34;
import '../../features/dashboard/view/di/home.vm.dart' as _i91;
import '../../features/dashboard/view/di/notification.vm.dart' as _i51;
import '../../features/dashboard/view/di/other_submenu.vm.dart' as _i54;
import '../../features/dashboard/view/di/overview.vm.dart' as _i117;
import '../../features/dashboard/view/di/report_problem.vm.dart' as _i60;
import '../../features/dashboard/view/di/request_form.vm.dart' as _i61;
import '../../features/dashboard/view/di/setting_submenu.vm.dart' as _i68;
import '../../features/dashboard/view/di/side_menu.vm.dart' as _i69;
import '../../features/introduction/service/di/splash_screen.firebase.dart'
    as _i71;
import '../../features/introduction/view/di/create_complete.vm.dart' as _i26;
import '../../features/introduction/view/di/getting_started.vm.dart' as _i90;
import '../../features/introduction/view/di/set_pin_complete.vm.dart' as _i67;
import '../../features/introduction/view/di/splash_screen.vm.dart' as _i124;
import '../../features/introduction/view/di/welcome_back.vm.dart' as _i79;
import '../../features/kyc/service/di/kyc.firebase.dart' as _i93;
import '../../features/kyc/view/di/address.vm.dart' as _i145;
import '../../features/kyc/view/di/bank_ndid.vm.dart' as _i133;
import '../../features/kyc/view/di/bank_ndid_waiting.vm.dart' as _i134;
import '../../features/kyc/view/di/counter_service_ndid_waiting.vm.dart'
    as _i139;
import '../../features/kyc/view/di/dealer_ndid.vm.dart' as _i140;
import '../../features/kyc/view/di/fatca.vm.dart' as _i142;
import '../../features/kyc/view/di/fund.vm.dart' as _i94;
import '../../features/kyc/view/di/information.vm.dart' as _i96;
import '../../features/kyc/view/di/knowledge_question.vm.dart' as _i143;
import '../../features/kyc/view/di/knowledge_result.vm.dart' as _i144;
import '../../features/kyc/view/di/kyc.vm.dart' as _i100;
import '../../features/kyc/view/di/kyc_choice.vm.dart' as _i146;
import '../../features/kyc/view/di/kyc_id_card.vm.dart' as _i37;
import '../../features/kyc/view/di/kyc_information_summary.vm.dart' as _i95;
import '../../features/kyc/view/di/kyc_introdunction.vm.dart' as _i97;
import '../../features/kyc/view/di/kyc_level_1.vm.dart' as _i99;
import '../../features/kyc/view/di/kyc_level_1_process.vm.dart' as _i98;
import '../../features/kyc/view/di/kyc_new.vm.dart' as _i147;
import '../../features/kyc/view/di/kyc_not_success.vm.dart' as _i39;
import '../../features/kyc/view/di/kyc_pdpa.vm.dart' as _i101;
import '../../features/kyc/view/di/kyc_select_customer_type.vm.dart' as _i102;
import '../../features/kyc/view/di/kyc_select_national.vm.dart' as _i103;
import '../../features/kyc/view/di/kyc_selfie_intro.vm.dart' as _i40;
import '../../features/kyc/view/di/kyc_success.vm.dart' as _i104;
import '../../features/kyc/view/di/kyc_term.vm.dart' as _i105;
import '../../features/kyc/view/di/kyc_upload_id_card.vm.dart' as _i106;
import '../../features/kyc/view/di/ndid_intro.vm.dart' as _i109;
import '../../features/kyc/view/di/ndid_intro_counterservice.vm.dart' as _i108;
import '../../features/kyc/view/di/ndid_payment.vm.dart' as _i111;
import '../../features/kyc/view/di/ndid_payment_failed.vm.dart' as _i45;
import '../../features/kyc/view/di/ndid_payment_success.vm.dart' as _i110;
import '../../features/kyc/view/di/ndid_term.vm.dart' as _i112;
import '../../features/kyc/view/di/pre_knowledge.vm.dart' as _i118;
import '../../features/kyc/view/di/pre_suiteable_test.vm.dart' as _i58;
import '../../features/kyc/view/di/suiteable.vm.dart' as _i126;
import '../../features/kyc/view/di/suiteable_question.vm.dart' as _i125;
import '../../features/kyc/view/widgets/modals/di/dipchip_tryagain_modal.vm.dart'
    as _i141;
import '../../features/kyc/view/widgets/modals/di/kyc_approve.vm.dart' as _i36;
import '../../features/kyc/view/widgets/modals/di/kyc_not_approve.vm.dart'
    as _i38;
import '../../features/kyc/view/widgets/modals/di/kyc_term_condition.vm.dart'
    as _i41;
import '../../features/kyc/view/widgets/modals/di/kyc_tryagain.vm.dart' as _i42;
import '../../features/kyc/view/widgets/modals/di/kyc_under_review_modal.vm.dart'
    as _i73;
import '../../features/kyc/view/widgets/modals/di/ndid_suspended_modal.vm.dart'
    as _i50;
import '../../features/kyc/view/widgets/modals/di/ndid_tryagain_modal.vm.dart'
    as _i113;
import '../../features/main/view/di/main.vm.dart' as _i44;
import '../../features/main/view/di/order_menu_modal.vm.dart' as _i52;
import '../../features/profile/service/di/user.firebase.dart' as _i16;
import '../../features/profile/view/di/set_fullname.vm.dart' as _i121;
import '../../features/transaction/service/di/bitgo.service.dart' as _i18;
import '../../features/transaction/service/di/order.service.dart' as _i11;
import '../../features/transaction/service/di/transaction.firebase.dart'
    as _i13;
import '../../features/transaction/service/di/trxdigitalasset.service.dart'
    as _i14;
import '../../features/transaction/service/di/trxfiat.service.dart' as _i15;
import '../../features/transaction/view/di/cancel_reason.vm.dart' as _i85;
import '../../features/transaction/view/di/confirm_order.vm.dart' as _i86;
import '../../features/transaction/view/di/exchange_government_token.vm.dart'
    as _i32;
import '../../features/transaction/view/di/order_cancel.vm.dart' as _i114;
import '../../features/transaction/view/di/order_completed.vm.dart' as _i115;
import '../../features/transaction/view/di/order_toreceive.vm.dart' as _i53;
import '../../features/transaction/view/di/payment_completed.vm.dart' as _i55;
import '../../features/transaction/view/di/select_network.vm.dart' as _i65;
import '../../features/transaction/view/di/transaction_download.vm.dart'
    as _i128;
import '../../features/transaction/view/di/transaction_history.vm.dart' as _i72;
import '../../features/transaction/view/di/waiting_payment.vm.dart' as _i78;
import '../../features/transaction/view/di/waiting_receive_coin.vm.dart'
    as _i131;
import '../../features/user/services/user_data.service.dart' as _i20;
import '../../features/user/view/di/user_bank_account.vm.dart' as _i129;
import '../../features/user/view/di/user_manage_personal_data.vm.dart' as _i74;
import '../../features/user/view/di/user_profile.vm.dart' as _i130;
import '../../features/utilities/service/utilitiy.firebase.dart' as _i75;
import '../../features/utilities/view/di/add_bank_account.vm.dart' as _i80;
import '../../features/utilities/view/di/app_privacy_policy.vm.dart' as _i24;
import '../../features/utilities/view/di/app_term.vm.dart' as _i25;
import '../../features/utilities/view/di/capture_back_id_card.vm.dart' as _i135;
import '../../features/utilities/view/di/capture_face.vm.dart' as _i136;
import '../../features/utilities/view/di/capture_id_card.vm.dart' as _i137;
import '../../features/utilities/view/di/check_id_card.vm.dart' as _i138;
import '../../features/utilities/view/di/dropdown_payment.vm.dart' as _i30;
import '../../features/utilities/view/di/edit_bank_account.vm.dart' as _i31;
import '../../features/utilities/view/di/qr_code_scanner.vm.dart' as _i59;
import '../../features/utilities/view/di/risk_condition.vm.dart' as _i62;
import '../../features/utilities/view/di/select_bank.vm.dart' as _i63;
import '../../features/utilities/view/di/select_bank_recieved.vm.dart' as _i119;
import '../../features/utilities/view/di/select_item.vm.dart' as _i64;
import '../../features/utilities/view/di/select_payment.vm.dart' as _i120;
import '../../widgets/dialogs/di/kyc_warning_dialog.vm.dart' as _i107;
import '../../widgets/layouts/di/default_layout_with_loading.vm.dart' as _i27;
import '../../widgets/utilities/deposit_wallet_address_qr_code/di/deposit_wallet_address_qr_code.vm.dart'
    as _i88;
import '../modules/network_module.dart' as _i148;

const String _stagging = 'stagging';
const String _production = 'production';
const String _development = 'development';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.AgentAsDatasource>(
    () => _i3.AgentAsDatasource(),
    dispose: _i3.disposeDataSource,
  );
  gh.singleton<_i4.AgentIdpDatasource>(
    () => _i4.AgentIdpDatasource(),
    dispose: _i4.disposeDataSource,
  );
  gh.singleton<_i5.FirebaseClient>(() => _i5.FirebaseClient());
  gh.singleton<_i6.IdpAsDatasource>(
    () => _i6.IdpAsDatasource(),
    dispose: _i6.disposeDataSource,
  );
  gh.singleton<_i7.IdpDataSource>(
    () => _i7.IdpDataSource(),
    dispose: _i7.disposeDataSource,
  );
  gh.singleton<_i8.SharedPreferencesHelper>(
      () => _i8.SharedPreferencesHelper());
  gh.singleton<_i9.UserDataSource>(() => _i9.UserDataSource());
  gh.singleton<_i10.UtilityPublicIdpDatasource>(
    () => _i10.UtilityPublicIdpDatasource(),
    dispose: _i10.disposeDataSource,
  );
  gh.singleton<_i11.OrderFunctionService>(
      () => _i11.OrderFunctionService(gh<_i5.FirebaseClient>()));
  gh.singleton<_i12.PhoneAuthCountDownService>(
      () => _i12.PhoneAuthCountDownService());
  gh.singleton<_i13.TransactionFirebaseService>(
      () => _i13.TransactionFirebaseService(gh<_i5.FirebaseClient>()));
  gh.singleton<_i14.TrxDigitalAssetService>(
      () => _i14.TrxDigitalAssetService(gh<_i5.FirebaseClient>()));
  gh.singleton<_i15.TrxFiatService>(
      () => _i15.TrxFiatService(gh<_i5.FirebaseClient>()));
  gh.singleton<_i16.UserFirebaseService>(() => _i16.UserFirebaseService(
        gh<_i5.FirebaseClient>(),
        gh<_i9.UserDataSource>(),
      ));
  gh.singleton<_i17.AuthenticationFirebaseService>(
      () => _i17.AuthenticationFirebaseService(
            gh<_i5.FirebaseClient>(),
            gh<_i9.UserDataSource>(),
            gh<_i8.SharedPreferencesHelper>(),
          ));
  gh.singleton<_i18.BitgoService>(
      () => _i18.BitgoService(gh<_i5.FirebaseClient>()));
  gh.singleton<_i19.CoinService>(
      () => _i19.CoinService(gh<_i5.FirebaseClient>()));
  gh.singleton<_i20.UserDataService>(() => _i20.UserDataService(
        gh<_i5.FirebaseClient>(),
        gh<_i17.AuthenticationFirebaseService>(),
      ));
  gh.singleton<_i21.AccountSubmenuViewModel>(
      () => _i21.AccountSubmenuViewModel());
  gh.factory<_i22.AgentAsDatasourceRepository>(
      () => _i22.AgentAsDatasourceRepository(gh<_i3.AgentAsDatasource>()));
  gh.factory<_i23.AgentIdpDatasourceRepository>(
      () => _i23.AgentIdpDatasourceRepository(gh<_i4.AgentIdpDatasource>()));
  gh.singleton<_i24.AppPrivacyPolicyViewModel>(
      () => _i24.AppPrivacyPolicyViewModel());
  gh.singleton<_i25.AppTermViewModel>(() => _i25.AppTermViewModel());
  gh.factory<_i26.CreateCompleteViewModel>(
      () => _i26.CreateCompleteViewModel());
  gh.singleton<_i27.DefaultLayoutWithLoadingViewModel>(
      () => _i27.DefaultLayoutWithLoadingViewModel());
  gh.factory<_i28.Dio>(() => networkModule.provideDio());
  gh.singleton<_i29.DioClient>(() => _i29.DioClient(gh<_i28.Dio>()));
  gh.factory<_i30.DropdownPaymentViewModel>(
      () => _i30.DropdownPaymentViewModel());
  gh.singleton<_i31.EditBankAccount>(() => _i31.EditBankAccount());
  gh.singleton<_i32.ExchangeGovernmentTokenViewModel>(
      () => _i32.ExchangeGovernmentTokenViewModel());
  gh.singleton<_i33.ForgotPasswordViewModel>(
      () => _i33.ForgotPasswordViewModel());
  gh.singleton<_i34.HelpSubmenuViewModel>(() => _i34.HelpSubmenuViewModel());
  gh.factory<_i35.IdpDatasouceRepository>(
      () => _i35.IdpDatasouceRepository(gh<_i7.IdpDataSource>()));
  gh.factory<_i36.KycApproveViewModel>(() => _i36.KycApproveViewModel());
  gh.factory<_i37.KycIdCardViewModel>(() => _i37.KycIdCardViewModel());
  gh.factory<_i38.KycNotApproveViewModel>(() => _i38.KycNotApproveViewModel());
  gh.factory<_i39.KycNotSuccessViewModel>(() => _i39.KycNotSuccessViewModel());
  gh.factory<_i40.KycSelfieIntroViewModel>(
      () => _i40.KycSelfieIntroViewModel());
  gh.factory<_i41.KycTermConditionViewModel>(
      () => _i41.KycTermConditionViewModel());
  gh.factory<_i42.KycTryagainViewModel>(() => _i42.KycTryagainViewModel());
  gh.singleton<_i43.LoginWithPasswordViewModel>(
      () => _i43.LoginWithPasswordViewModel());
  gh.singleton<_i44.MainViewModel>(() => _i44.MainViewModel());
  gh.factory<_i45.NdidPaymentFailedViewModel>(
      () => _i45.NdidPaymentFailedViewModel());
  gh.factory<_i46.NdidServiceRepository>(
    () => _i47.NdidServiceRepositoryStag(),
    registerFor: {_stagging},
  );
  gh.factory<_i46.NdidServiceRepository>(
    () => _i48.NdidServiceRepositoryProd(),
    registerFor: {_production},
  );
  gh.factory<_i46.NdidServiceRepository>(
    () => _i49.NdidServiceRepositoryDev(),
    registerFor: {_development},
  );
  gh.factory<_i50.NdidSuspendedModalViewModel>(
      () => _i50.NdidSuspendedModalViewModel());
  gh.singleton<_i51.NotificationViewModel>(() => _i51.NotificationViewModel());
  gh.singleton<_i52.OrderMenuModalViewModel>(
      () => _i52.OrderMenuModalViewModel(gh<_i11.OrderFunctionService>()));
  gh.factory<_i53.OrderToReceiveViewModel>(
      () => _i53.OrderToReceiveViewModel(gh<_i11.OrderFunctionService>()));
  gh.singleton<_i54.OtherSubmenuViewModel>(() => _i54.OtherSubmenuViewModel());
  gh.factory<_i55.PaymentCompletedViewModel>(
      () => _i55.PaymentCompletedViewModel());
  gh.singleton<_i56.PaymentFirebaseService>(
      () => _i56.PaymentFirebaseService(gh<_i5.FirebaseClient>()));
  gh.factory<_i57.PhoneAuthViewModel>(() => _i57.PhoneAuthViewModel());
  gh.factory<_i58.PreSuiteableTestViewModel>(
      () => _i58.PreSuiteableTestViewModel());
  gh.factory<_i59.QrCodeScannerViewModel>(() => _i59.QrCodeScannerViewModel());
  gh.singleton<_i60.ReportProblemViewModel>(
      () => _i60.ReportProblemViewModel());
  gh.singleton<_i61.RequestFormViewModel>(() => _i61.RequestFormViewModel());
  gh.singleton<_i62.RiskConditionViewModel>(
      () => _i62.RiskConditionViewModel());
  gh.factory<_i63.SelectBankViewModel>(() => _i63.SelectBankViewModel());
  gh.factory<_i64.SelectItemViewModel>(() => _i64.SelectItemViewModel());
  gh.factory<_i65.SelectNetworkViewModel>(() => _i65.SelectNetworkViewModel());
  gh.singleton<_i66.SendResetPasswordViewModel>(
      () => _i66.SendResetPasswordViewModel());
  gh.factory<_i67.SetPinCompleteViewModel>(
      () => _i67.SetPinCompleteViewModel());
  gh.singleton<_i68.SettingSubmenuVieWModel>(
      () => _i68.SettingSubmenuVieWModel());
  gh.factory<_i69.SideMenuViewModel>(() => _i69.SideMenuViewModel());
  gh.singleton<_i70.SignUpWithPasswordViewModel>(
      () => _i70.SignUpWithPasswordViewModel());
  gh.singleton<_i71.SplashScreenFirebaseService>(
      () => _i71.SplashScreenFirebaseService(
            gh<_i5.FirebaseClient>(),
            gh<_i46.NdidServiceRepository>(),
          ));
  gh.factory<_i72.TransactionHistoryViewModel>(
      () => _i72.TransactionHistoryViewModel(
            gh<_i13.TransactionFirebaseService>(),
            gh<_i11.OrderFunctionService>(),
          ));
  gh.factory<_i73.UnderReviewViewModel>(() => _i73.UnderReviewViewModel());
  gh.singleton<_i74.UserManagePersonalDataViewModel>(
      () => _i74.UserManagePersonalDataViewModel());
  gh.singleton<_i75.UtilityFirebaseService>(
      () => _i75.UtilityFirebaseService(gh<_i5.FirebaseClient>()));
  gh.factory<_i76.UtilityPublicIdpDatasourceRepository>(() =>
      _i76.UtilityPublicIdpDatasourceRepository(
          gh<_i10.UtilityPublicIdpDatasource>()));
  gh.singleton<_i77.VerifyEmailViewModel>(() => _i77.VerifyEmailViewModel());
  gh.factory<_i78.WaitingPaymentViewModel>(() => _i78.WaitingPaymentViewModel(
        gh<_i13.TransactionFirebaseService>(),
        gh<_i11.OrderFunctionService>(),
        gh<_i15.TrxFiatService>(),
      ));
  gh.factory<_i79.WelcomeBackViewModel>(() => _i79.WelcomeBackViewModel());
  gh.factory<_i80.AddBankAccountViewModel>(
      () => _i80.AddBankAccountViewModel(gh<_i75.UtilityFirebaseService>()));
  gh.factory<_i81.AuthenticationRepository>(
    () => _i82.AuthenticationRepositoryStag(gh<_i9.UserDataSource>()),
    registerFor: {_stagging},
  );
  gh.factory<_i81.AuthenticationRepository>(
    () => _i83.AuthenticationRepositoryProd(gh<_i9.UserDataSource>()),
    registerFor: {_production},
  );
  gh.factory<_i81.AuthenticationRepository>(
    () => _i84.AuthenticationRepositoryDev(gh<_i9.UserDataSource>()),
    registerFor: {_development},
  );
  gh.factory<_i85.CancelReasonViewModel>(() => _i85.CancelReasonViewModel(
        gh<_i13.TransactionFirebaseService>(),
        gh<_i11.OrderFunctionService>(),
      ));
  gh.factory<_i86.ConfirmOrderViewModel>(() => _i86.ConfirmOrderViewModel(
        gh<_i13.TransactionFirebaseService>(),
        gh<_i11.OrderFunctionService>(),
        gh<_i15.TrxFiatService>(),
        gh<_i14.TrxDigitalAssetService>(),
      ));
  gh.factory<_i87.CreateAccountViewModel>(() => _i87.CreateAccountViewModel(
        gh<_i81.AuthenticationRepository>(),
        gh<_i17.AuthenticationFirebaseService>(),
        gh<_i8.SharedPreferencesHelper>(),
      ));
  gh.factory<_i88.DepositWalletAddressQrCodeViewModel>(
      () => _i88.DepositWalletAddressQrCodeViewModel(gh<_i18.BitgoService>()));
  gh.factory<_i89.EnterPinViewModel>(() => _i89.EnterPinViewModel(
        gh<_i17.AuthenticationFirebaseService>(),
        gh<_i8.SharedPreferencesHelper>(),
      ));
  gh.factory<_i90.GettingStartedViewModel>(
      () => _i90.GettingStartedViewModel(gh<_i8.SharedPreferencesHelper>()));
  gh.singleton<_i91.HomeViewModel>(
      () => _i91.HomeViewModel(gh<_i8.SharedPreferencesHelper>()));
  gh.factory<_i92.IdpAsDatasouceRepository>(
      () => _i92.IdpAsDatasouceRepository(gh<_i6.IdpAsDatasource>()));
  gh.singleton<_i93.KycFirebaseService>(() => _i93.KycFirebaseService(
        gh<_i5.FirebaseClient>(),
        gh<_i17.AuthenticationFirebaseService>(),
      ));
  gh.factory<_i94.KycFundViewModel>(
      () => _i94.KycFundViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i95.KycInformationSummaryViewModel>(
      () => _i95.KycInformationSummaryViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i96.KycInformationViewModel>(
      () => _i96.KycInformationViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i97.KycIntrodunctionViewModel>(
      () => _i97.KycIntrodunctionViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i98.KycLevel1ProcessViewModel>(
      () => _i98.KycLevel1ProcessViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i99.KycLevel1ViewModel>(
      () => _i99.KycLevel1ViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i100.KycLevel2ViewModel>(
      () => _i100.KycLevel2ViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i101.KycPdpaViewModel>(
      () => _i101.KycPdpaViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i102.KycSelectCustomerTypeViewModel>(() =>
      _i102.KycSelectCustomerTypeViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i103.KycSelectNationalViewModel>(
      () => _i103.KycSelectNationalViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i104.KycSuccessViewModel>(() => _i104.KycSuccessViewModel(
        gh<_i46.NdidServiceRepository>(),
        gh<_i93.KycFirebaseService>(),
      ));
  gh.factory<_i105.KycTermViewModel>(
      () => _i105.KycTermViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i106.KycUploadIdCardViewModel>(
      () => _i106.KycUploadIdCardViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i107.KycWarningDialogViewModel>(
      () => _i107.KycWarningDialogViewModel(gh<_i8.SharedPreferencesHelper>()));
  gh.factory<_i108.NdidIntroCounterServiceViewModel>(
      () => _i108.NdidIntroCounterServiceViewModel(
            gh<_i93.KycFirebaseService>(),
            gh<_i46.NdidServiceRepository>(),
          ));
  gh.factory<_i109.NdidIntroViewModel>(
      () => _i109.NdidIntroViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i110.NdidPaymentSuccessViewModel>(
      () => _i110.NdidPaymentSuccessViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i111.NdidPaymentViewModel>(() => _i111.NdidPaymentViewModel(
        gh<_i93.KycFirebaseService>(),
        gh<_i17.AuthenticationFirebaseService>(),
        gh<_i56.PaymentFirebaseService>(),
      ));
  gh.factory<_i112.NdidTermViewModel>(
      () => _i112.NdidTermViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i113.NdidTryagainModalViewModel>(
      () => _i113.NdidTryagainModalViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i114.OrderCancelViewModel>(() => _i114.OrderCancelViewModel(
        gh<_i13.TransactionFirebaseService>(),
        gh<_i11.OrderFunctionService>(),
      ));
  gh.factory<_i115.OrderCompletedViewModel>(
      () => _i115.OrderCompletedViewModel(gh<_i11.OrderFunctionService>()));
  gh.factory<_i116.OtpVerificationViewModel>(
      () => _i116.OtpVerificationViewModel(
            gh<_i17.AuthenticationFirebaseService>(),
            gh<_i8.SharedPreferencesHelper>(),
          ));
  gh.factory<_i117.OverViewViewModel>(() => _i117.OverViewViewModel(
        gh<_i17.AuthenticationFirebaseService>(),
        gh<_i8.SharedPreferencesHelper>(),
        gh<_i11.OrderFunctionService>(),
      ));
  gh.factory<_i118.PreKnowledgeViewModel>(
      () => _i118.PreKnowledgeViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i119.SelectBankRecievedViewModel>(() =>
      _i119.SelectBankRecievedViewModel(
          gh<_i17.AuthenticationFirebaseService>()));
  gh.factory<_i120.SelectPaymentViewModel>(() =>
      _i120.SelectPaymentViewModel(gh<_i17.AuthenticationFirebaseService>()));
  gh.factory<_i121.SetFullnameViewModel>(() => _i121.SetFullnameViewModel(
        gh<_i16.UserFirebaseService>(),
        gh<_i8.SharedPreferencesHelper>(),
      ));
  gh.factory<_i122.SetPinViewModel>(() => _i122.SetPinViewModel(
        gh<_i17.AuthenticationFirebaseService>(),
        gh<_i8.SharedPreferencesHelper>(),
      ));
  gh.factory<_i123.SignInPageViewModel>(() => _i123.SignInPageViewModel(
        gh<_i81.AuthenticationRepository>(),
        gh<_i17.AuthenticationFirebaseService>(),
        gh<_i8.SharedPreferencesHelper>(),
      ));
  gh.lazySingleton<_i124.SplashScreenViewModel>(
      () => _i124.SplashScreenViewModel(
            gh<_i8.SharedPreferencesHelper>(),
            gh<_i71.SplashScreenFirebaseService>(),
            gh<_i35.IdpDatasouceRepository>(),
            gh<_i92.IdpAsDatasouceRepository>(),
            gh<_i76.UtilityPublicIdpDatasourceRepository>(),
            gh<_i17.AuthenticationFirebaseService>(),
          ));
  gh.factory<_i125.SuiteableQuestionViewModel>(
      () => _i125.SuiteableQuestionViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i126.SuiteableViewModel>(
      () => _i126.SuiteableViewModel(gh<_i93.KycFirebaseService>()));
  gh.singleton<_i127.SuspendAccountViewModel>(() =>
      _i127.SuspendAccountViewModel(gh<_i17.AuthenticationFirebaseService>()));
  gh.factory<_i128.TransactionDownloadViewModel>(() =>
      _i128.TransactionDownloadViewModel(
          gh<_i13.TransactionFirebaseService>()));
  gh.singleton<_i129.UserBankAccountVieWModel>(() =>
      _i129.UserBankAccountVieWModel(gh<_i17.AuthenticationFirebaseService>()));
  gh.singleton<_i130.UserProfileViewModel>(() => _i130.UserProfileViewModel(
        gh<_i93.KycFirebaseService>(),
        gh<_i17.AuthenticationFirebaseService>(),
      ));
  gh.factory<_i131.WaitingReceiveCoinViewModel>(
      () => _i131.WaitingReceiveCoinViewModel(
            gh<_i11.OrderFunctionService>(),
            gh<_i18.BitgoService>(),
          ));
  gh.singleton<_i132.AccountManageSubmenuViewModel>(() =>
      _i132.AccountManageSubmenuViewModel(
          gh<_i17.AuthenticationFirebaseService>()));
  gh.factory<_i133.BankNdidViewModel>(() => _i133.BankNdidViewModel(
        gh<_i93.KycFirebaseService>(),
        gh<_i35.IdpDatasouceRepository>(),
        gh<_i92.IdpAsDatasouceRepository>(),
        gh<_i46.NdidServiceRepository>(),
        gh<_i76.UtilityPublicIdpDatasourceRepository>(),
      ));
  gh.factory<_i134.BankNdidWaitingViewModel>(
      () => _i134.BankNdidWaitingViewModel(
            gh<_i93.KycFirebaseService>(),
            gh<_i46.NdidServiceRepository>(),
          ));
  gh.factory<_i135.CaptureBackIdCardViewModel>(
      () => _i135.CaptureBackIdCardViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i136.CaptureFaceViewModel>(
      () => _i136.CaptureFaceViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i137.CaptureIdCardViewModel>(
      () => _i137.CaptureIdCardViewModel(gh<_i93.KycFirebaseService>()));
  gh.singleton<_i138.CheckIdCardViewModel>(
      () => _i138.CheckIdCardViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i139.CounterServiceNdidWaitingViewModel>(
      () => _i139.CounterServiceNdidWaitingViewModel(
            gh<_i93.KycFirebaseService>(),
            gh<_i46.NdidServiceRepository>(),
          ));
  gh.factory<_i140.DealerNdidViewModel>(() => _i140.DealerNdidViewModel(
        gh<_i93.KycFirebaseService>(),
        gh<_i23.AgentIdpDatasourceRepository>(),
        gh<_i22.AgentAsDatasourceRepository>(),
        gh<_i46.NdidServiceRepository>(),
      ));
  gh.factory<_i141.DipchipTryagainModalBottomSheetViewModel>(() =>
      _i141.DipchipTryagainModalBottomSheetViewModel(
          gh<_i93.KycFirebaseService>()));
  gh.factory<_i142.FatcaViewModel>(
      () => _i142.FatcaViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i143.KnowledgeQuestionViewModel>(
      () => _i143.KnowledgeQuestionViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i144.KnowledgeResultViewModel>(
      () => _i144.KnowledgeResultViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i145.KycAddressViewModel>(
      () => _i145.KycAddressViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i146.KycChoiceViewModel>(
      () => _i146.KycChoiceViewModel(gh<_i93.KycFirebaseService>()));
  gh.factory<_i147.KycFinalViewModel>(() => _i147.KycFinalViewModel(
        gh<_i93.KycFirebaseService>(),
        gh<_i17.AuthenticationFirebaseService>(),
      ));
  return getIt;
}

class _$NetworkModule extends _i148.NetworkModule {}
