import 'dart:convert';

import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/company_data.dart';
import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/confirm_order_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_payment_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_receive_coin_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/trxdigitalasset.service.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/trxfiat.service.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/already_pending_order_alert.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/bank_account_value.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_create.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxdigitalasset_function/trxdigitalasset_create.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxfiat_function/trxfiat_create.m.dart';
import 'package:aconnec_1109_x/src/model/network.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/confirm_order.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/transaction.firebase.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/model/payment_item.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_checkbox_field.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import '../../../../model/request_user_bank_account.m.dart';

@Injectable()
class ConfirmOrderViewModel extends ViewModel {
  final TransactionFirebaseService _firebaseService;
  final OrderFunctionService _orderService;
  final TrxFiatService _trxFiatService;
  final TrxDigitalAssetService _trxDigitalAssetService;
  ConfirmOrderViewModel(
    this._firebaseService,
    this._orderService,
    this._trxFiatService,
    this._trxDigitalAssetService,
  );

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject =
      BehaviorSubject<ConfirmOrderPageState>.seeded(ConfirmOrderPageState());
  Stream<ConfirmOrderPageState> get state => _stateSubject;

  final _formSubject =
      BehaviorSubject<ConfirmOrderFormState>.seeded(ConfirmOrderFormState());
  Stream<ConfirmOrderFormState> get formState => _formSubject;

  final TextEditingController noteControlelr = TextEditingController();
  final TextEditingController walletAddressTextController =
      TextEditingController();

  final argumentSubject =
      CustomStreamSubject<ConfirmOrderArgumentsScreen?>(null);

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
    _formSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void updateFormState(Map<String, dynamic> updateValue) {
    final state = _formSubject.value;
    _formSubject.add(state.copyWith(updateValue));
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  Future<void> selectBankAccount() async {
    final formState = _formSubject.value;
    if (formState.mode == ExchangeMode.buy.name) {
      final dynamic callback =
          await NavigationService.toNamed(RoutesConstant.selectPayment);
      final UserBankAccountModel selectedBank =
          callback?.bankData ?? UserBankAccountModel();

      onSelectPayment(
        selectedBank: selectedBank,
        selectedBankIndex: callback?.index,
      );
    } else {
      final dynamic callback =
          await NavigationService.toNamed(RoutesConstant.selectBankRecieved);

      final UserBankAccountModel selectedBank =
          callback?.bankData ?? UserBankAccountModel();

      onSelectPayment(
        selectedBank: selectedBank,
        selectedBankIndex: callback?.index,
      );
    }
  }

  void onSelectPayment({
    PaymentItemModel? selectedPayment,
    UserBankAccountModel? selectedBank,
    int? selectedBankIndex,
  }) {
    updateFormState({
      ConfirmOrderFormStateFields.selectedPayment: selectedPayment,
      ConfirmOrderFormStateFields.selectedBank: selectedBank,
      ConfirmOrderFormStateFields.selectedBankIndex: selectedBankIndex
    });
  }

  void toggleCondition(CheckboxValue item) {
    final state = _formSubject.value;
    final conditions = state.conditionSelected;
    final find = conditions.where((e) => e.value == item.value).toList();
    if (find.isNotEmpty) {
      final removed = [...conditions]
        ..removeWhere((e) => e.value == item.value);
      updateFormState({ConfirmOrderFormStateFields.conditionSelected: removed});
    } else {
      final added = [...conditions, item];
      updateFormState({ConfirmOrderFormStateFields.conditionSelected: added});
    }
  }

  bool validate() {
    final pageState = _stateSubject.value;
    final formState = _formSubject.value;
    if (formState.mode == ExchangeMode.buy.name) {
      if (formState.selectedBank.bankAccountNumber.isEmpty) return false;
      // if (formState.selectedPayment.value.isEmpty) return false;
      if (formState.bahtAmount == 0) return false;
      if (formState.coinAmount == 0) return false;
      if (formState.conditionSelected.length < 3) return false;
      // if (formState.networkCode.isEmpty) return false;
      if (pageState.walletAddress.isEmpty) return false;
    }

    if (formState.mode == ExchangeMode.sell.name) {
      if (formState.selectedBank.bankAccountNumber.isEmpty) return false;
      if (formState.bahtAmount == 0) return false;
      if (formState.coinAmount == 0) return false;
    }

    return true;
  }

  void preSubmit(BuildContext context) {
    final formState = _formSubject.value;
    if (formState.mode == ExchangeMode.buy.name) {
      createBuyRequest();
    } else {
      createSellRequest();
    }
  }

  Future<void> createSellRequest() async {
    try {
      final callback = await confirmPin();
      await Future.delayed(const Duration(milliseconds: 500));
      if (callback == false) {
        return;
      }
      updateState({'isLoading': true});
      final formState = _formSubject.value;

      final checkResult = await _orderService.orderOpenCheck();
      if (checkResult.idOrder != 0 &&
          checkResult.orderStatus != OrderStatus.cancelled.name) {
        showAlreadyPendingOrderAlert(
            NavigationService.navigatorKey.currentContext!);
        //bypass go to pending with pending order
        updateState({'isLoading': false});
        return;
      }
      final bankData = BankAccountValueModel(
        bankName: formState.selectedBank.bankName,
        bankAccountName: formState.selectedBank.bankAccountName,
        bankAccountNo: formState.selectedBank.bankAccountNumber,
        bankAccountBranch: formState.selectedBank.branchCode,
        bankCode: formState.selectedBank.bankCode,
      );
      // bankAccountNo: jsonEncode(bankData.toJson()),
      //  bankAccountNo: FirebaseRealtimeDatabaseValue.bankAccountPathWithOutId(
      //     formState.selectedBankIndex,
      //   ),
      final arguments = argumentSubject.subject.value;
      final pageState = _stateSubject.value;
      final request = RequestOrderCreateModel(
        digitalAssetPrice: arguments?.coinPrice.getSellValue() ?? 0.00,
        listedPair: arguments?.symbol ?? '',
        orderSide: ExchangeMode.sell.name,
        orderValueFiatSet: formState.totalAmount,
        orderValueCryptoSet: formState.coinAmount,
        // bankAccountNo: jsonEncode(bankData.toJson()),
        bankAccountNo: 'bank_${formState.selectedBankIndex}',
        walletAdress: pageState.walletAddress,
        digitalAssetType: 'crypto',
        digitalAssetFeeSet: arguments?.coinPrice.getFeeValue() ?? 0.00,
      );

      print(request.toJson());

      final result = await _orderService.orderCreate(request);
      if (result.idOrder == 0 && result.refcode.isEmpty) {
        DialogUtils.showToast(
            msg: 'Create order ${S.current.somethingWentWrong}', type: 'error');
        updateState({'isLoading': false});
        return;
      }
      final requestTrxDigitalAsset = RequestTrxDigitalAssetCreateModel(
          idOrder: result.idOrder,
          paymentChannel:
              OrderSellPaymentChannel.bitgo.name, //need more information
          paymentAutoSettle: true,
          paymentValueSet: formState.coinAmount.toPrecision(2),
          paymentCurrency: arguments?.coinData.getBaseSymbol() ?? '',
          paymentAccountDesActual: '',
          paymentValueAcutal: 0,
          paymentValueFee: 0,
          isNeedApprove: true,
          isNeedAudit: true,
          refcode: result.refcode);
      final trxResult = await _trxDigitalAssetService
          .trxDigitalAssetCreate(requestTrxDigitalAsset);
      updateState({'isLoading': false});

      _routesSubject.add(
        AppRouteSpec(
          name: RoutesConstant.waitReceiveCoin,
          arguments: WaitingReceiveCoinArgumentsScreen(
              idOrder: result.idOrder, refCode: result.refcode),
          action: AppRouteAction.replaceWith,
        ),
      );
    } on Exception catch (e) {
      //Sentry.captureException(e);
      String message = e.toString();
      print(e);
      updateState({'isLoading': false});
      DialogUtils.showToast(msg: message, type: 'error');
      return;
      // alert message
    }
  }

  Future<void> createBuyRequest() async {
    try {
      final callback = await confirmPin();
      await Future.delayed(const Duration(milliseconds: 500));
      if (callback == false) {
        return;
      }

      updateState({'isLoading': true});
      final formState = _formSubject.value;

      final checkResult = await _orderService.orderOpenCheck();
      if (checkResult.idOrder != 0 &&
          checkResult.orderStatus != OrderStatus.cancelled.name) {
        showAlreadyPendingOrderAlert(
            NavigationService.navigatorKey.currentContext!);
        //bypass go to pending with pending order
        updateState({'isLoading': false});
        return;
      }
      final bankData = BankAccountValueModel(
        bankName: formState.selectedBank.bankName,
        bankAccountName: formState.selectedBank.bankAccountName,
        bankAccountNo: formState.selectedBank.bankAccountNumber,
        bankAccountBranch: formState.selectedBank.branchCode,
        bankCode: formState.selectedBank.bankCode,
      );
      const companyBankData = BankAccountValueModel(
        bankName: CompanyData.bankNameTh,
        bankAccountName: CompanyData.bankAccountNameTh,
        bankAccountNo: CompanyData.bankAccountNumber,
        bankAccountBranch: '',
        bankCode: CompanyData.bankCode,
      );
      final arguments = argumentSubject.subject.value;
      //  bankAccountNo: FirebaseRealtimeDatabaseValue.bankAccountPathWithOutId(
      //     formState.selectedBankIndex,
      //   ),
      final pageState = _stateSubject.value;
      final request = RequestOrderCreateModel(
        digitalAssetPrice: arguments?.coinPrice.getBuyValue() ?? 0.00,
        listedPair: arguments?.symbol ?? '',
        orderSide: ExchangeMode.buy.name,
        orderValueFiatSet: formState.totalAmount,
        orderValueCryptoSet: formState.coinAmount,
        // bankAccountNo: jsonEncode(bankData.toJson()),
        bankAccountNo: 'bank_${formState.selectedBankIndex}',
        walletAdress: pageState.walletAddress,
        digitalAssetType: 'crypto',
        digitalAssetFeeSet: arguments?.coinPrice.getFeeValue() ?? 0.00,
      );
      // print(request.toJson());
      final result = await _orderService.orderCreate(request);
      if (result.idOrder == 0 && result.refcode.isEmpty) {
        DialogUtils.showToast(
            msg: 'Create order ${S.current.somethingWentWrong}', type: 'error');
        updateState({'isLoading': false});
        return;
      }
      final requestTrxFiat = RequestTrxFiatCreateModel(
        idOrder: result.idOrder,
        paymentChannel: formState.totalAmount.toDouble() > 2000000
            ? OrderBuyPaymentChannel.bank.name
            : OrderBuyPaymentChannel.qr.name,
        paymentAutoSettle: true,
        paymentValueSet: formState.totalAmount.toPrecision(2),
        paymentCurrency: 'THB',
        // paymentAccountDesActual: formState.totalAmount.toDouble() > 2000000
        //     ? jsonEncode(companyBankData.toJson())
        //     : '',
        paymentAccountDesActual: jsonEncode(companyBankData.toJson()),
        paymentAccountSrcActual: jsonEncode(bankData.toJson()),
        paymentValueAcutal: 0,
        paymentValueFee: 0,
        isNeedApprove: true,
        isNeedAudit: true,
        refcode: result.refcode,
      );
      // print(requestTrxFiat.toJson());
      final trxResult = await _trxFiatService.trxCreate(requestTrxFiat);
      // print(trxResult.toJson());
      updateState({'isLoading': false});

      _routesSubject.add(
        AppRouteSpec(
          name: RoutesConstant.waitingPayment,
          arguments: WaitingPaymentArgumentsScreen(
              idOrder: result.idOrder, refCode: result.refcode),
          action: AppRouteAction.replaceWith,
        ),
      );
    } catch (e) {
      //Sentry.captureException(e);
      updateState({'isLoading': false});
      // print(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      return;
      // alert message
    }
  }

  Future<void> gotoQrCodeScanner() async {
    NavigationService.navigatorKey.currentState!
        .pushNamed(RoutesConstant.qrCodeScanner)
        .then(
      (value) {
        Map<String, dynamic>? result;
        result = value as Map<String, dynamic>;
        walletAddressTextController.value =
            TextEditingValue(text: result['result']);
        updateState({
          ConfirmOrderFormStateFields.walletAddress: result['result'],
        });
      },
    );
  }

  Future<void> gotoSelectNetwork() async {
    NavigationService.navigatorKey.currentState!
        .pushNamed(RoutesConstant.selectNetwork)
        .then(
      (value) {
        Map<String, dynamic>? result;
        result = value as Map<String, dynamic>;
        final networkData = NetworkModelPersistence().fromJson(result);
        updateFormState({
          ConfirmOrderFormStateFields.networkCode: networkData.networkCode,
        });
      },
    );
  }

  Future<bool> confirmPin() async {
    final callback = await NavigationService.toNamed(RoutesConstant.enterPin);

    // if (callback.runtimeType == Map<String, dynamic>) {
    final mappedCallback = callback as Map<String, dynamic>;
    if (mappedCallback['result']) {
      return true;
    }
    return false;
    // }
  }

  Future<bool> checkPendingOrder() async {
    final checkResult = await _orderService.orderOpenCheck();
    if (checkResult.idOrder != 0) {
      showAlreadyPendingOrderAlert(
          NavigationService.navigatorKey.currentContext!);
      //bypass go to pending with pending order
      // _routesSubject.add(
      //   AppRouteSpec(
      //     name: RoutesConstant.waitReceiveCoin,
      //     arguments:
      //         WaitingReceiveCoinArgumentsScreen(idOrder: checkResult.idOrder),
      //     action: AppRouteAction.replaceWith,
      //   ),
      // );
      return false;
    }
    return true;
  }
}
