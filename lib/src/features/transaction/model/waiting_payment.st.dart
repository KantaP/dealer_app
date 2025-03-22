import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/model/response_trade_transaction.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class WaitingPaymentPageState implements IPageState<WaitingPaymentPageState> {
  ResponseTradeTransactionModel _transactionDetail =
      ResponseTradeTransactionModel();
  bool _isLoading = false;
  bool _slipUploaded = false;
  WaitingPaymentPageState(
      {ResponseTradeTransactionModel? transactionDetail,
      bool isLoading = false,
      bool slipUploaded = false}) {
    _transactionDetail = transactionDetail ?? ResponseTradeTransactionModel();
    _isLoading = isLoading;
    _slipUploaded = slipUploaded;
  }

  ResponseTradeTransactionModel get transactionDetail => _transactionDetail;
  bool get isLoading => _isLoading;
  bool get slipUploaded => _slipUploaded;

  @override
  WaitingPaymentPageState copyWith(Map<String, dynamic> value) {
    return WaitingPaymentPageState(
      transactionDetail:
          value[WaitingPaymentPageStateFields.transactionDetail] ??
              _transactionDetail,
      isLoading: value[WaitingPaymentPageStateFields.isLoading] ?? _isLoading,
      slipUploaded:
          value[WaitingPaymentPageStateFields.slipUploaded] ?? _slipUploaded,
    );
  }
}

class WaitingPaymentPageStateFields {
  WaitingPaymentPageStateFields._();

  static const String transactionDetail = 'transactionDetail';
  static const String isLoading = 'isLoading';
  static const String slipUploaded = 'slipUploaded';
}

class WaitingPaymentUploadSlipFormState
    implements IPageState<WaitingPaymentUploadSlipFormState> {
  String _slipPath = '';
  WaitingPaymentUploadSlipFormState({String slipPath = ''}) {
    _slipPath = slipPath;
  }

  String get slipPath => _slipPath;

  @override
  WaitingPaymentUploadSlipFormState copyWith(Map<String, dynamic> value) {
    return WaitingPaymentUploadSlipFormState(
      slipPath:
          value[WaitingPaymentUploadSlipFormStateFields.slipPath] ?? _slipPath,
    );
  }
}

class WaitingPaymentUploadSlipFormStateFields {
  WaitingPaymentUploadSlipFormStateFields._();
  static const String slipPath = '';
}

class WaitingPaymentTimerState implements IPageState<WaitingPaymentTimerState> {
  Duration _countdown = const Duration();

  WaitingPaymentTimerState({Duration countdown = const Duration()}) {
    _countdown = countdown;
  }

  Duration get countdown => _countdown;

  @override
  WaitingPaymentTimerState copyWith(Map<String, dynamic> value) {
    return WaitingPaymentTimerState(
      countdown: value[WaitingPaymentTimerStateFields.countdown] ?? _countdown,
    );
  }
}

class WaitingPaymentTimerStateFields {
  WaitingPaymentTimerStateFields._();

  static const String countdown = 'countdown';
}

class WaitingPaymentOrderData implements IPageState<WaitingPaymentOrderData> {
  ResponseOrderFullModel? _orderFull;

  WaitingPaymentOrderData({
    ResponseOrderFullModel? orderFull,
  }) {
    _orderFull = orderFull;
  }

  ResponseOrderFullModel get orderFull =>
      _orderFull ?? ResponseOrderFullModel();

  @override
  WaitingPaymentOrderData copyWith(Map<String, dynamic> value) {
    return WaitingPaymentOrderData(
      orderFull: value['orderFull'] ?? _orderFull,
    );
  }
}
