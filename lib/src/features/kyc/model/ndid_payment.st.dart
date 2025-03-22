import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bank_function/response_bay_qr.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class NdidPaymentPageState implements IPageState<NdidPaymentPageState> {
  int _paymentSelectedIndex = 0;
  String _refNo = '';
  late BayQrResponseModel _qrResponse;
  String _qrData = '';
  double _amount = 0;

  NdidPaymentPageState({
    int paymentSelectedIndex = 0,
    String refNo = '',
    BayQrResponseModel? qrResponse,
    String qrData = '',
    double amount = 0,
  }) {
    _paymentSelectedIndex = paymentSelectedIndex;
    _refNo = refNo;
    _qrResponse = qrResponse ?? BayQrResponseModel();
    _qrData = qrData;
    _amount = amount;
  }

  int get paymentSelectedIndex => _paymentSelectedIndex;
  String get refNo => _refNo;
  BayQrResponseModel get qrResponse => _qrResponse;
  String get qrData => _qrData;
  double get amount => _amount;

  @override
  NdidPaymentPageState copyWith(Map<String, dynamic> value) {
    return NdidPaymentPageState(
      paymentSelectedIndex:
          value[NdidPaymentPageStateFields.paymentSelectedIndex] ??
              _paymentSelectedIndex,
      refNo: value[NdidPaymentPageStateFields.refNo] ?? _refNo,
      qrResponse: value[NdidPaymentPageStateFields.qrResponse] ?? _qrResponse,
      qrData: value[NdidPaymentPageStateFields.qrData] ?? _qrData,
      amount: value[NdidPaymentPageStateFields.amount] ?? _amount,
    );
  }
}

class NdidPaymentPageStateFields {
  NdidPaymentPageStateFields._();

  static const String paymentSelectedIndex = 'paymentSelectedIndex';
  static const String refNo = 'refNo';
  static const String qrResponse = 'qrResponse';
  static const String qrData = 'qrData';
  static const String amount = 'amount';
}

class NdidPaymentTimerState implements IPageState<NdidPaymentTimerState> {
  Duration _countdown = const Duration();

  NdidPaymentTimerState({Duration countdown = const Duration()}) {
    _countdown = countdown;
  }

  Duration get countdown => _countdown;

  @override
  NdidPaymentTimerState copyWith(Map<String, dynamic> value) {
    return NdidPaymentTimerState(
      countdown: value[NdidPaymentTimerStateFields.countdown] ?? _countdown,
    );
  }
}

class NdidPaymentTimerStateFields {
  NdidPaymentTimerStateFields._();

  static const String countdown = 'countdown';
}
