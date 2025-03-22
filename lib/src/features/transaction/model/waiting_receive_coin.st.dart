import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class WaitingReceiveCoinPageState
    implements IPageState<WaitingReceiveCoinPageState> {
  @override
  WaitingReceiveCoinPageState copyWith(Map<String, dynamic> value) {
    return WaitingReceiveCoinPageState();
  }
}

class WaitingReceiveCoinFormState
    implements IPageState<WaitingReceiveCoinFormState> {
  String _selectedNetwork = '';
  String _receiveAddress = '';

  ResponseOrderFullModel? _orderDetail;

  WaitingReceiveCoinFormState({
    String selectedNetwork = '',
    String receiveAddress = '',
    ResponseOrderFullModel? orderDetail,
  }) {
    _selectedNetwork = selectedNetwork;
    _receiveAddress = receiveAddress;
    _orderDetail = orderDetail;
  }

  String get selectedNetwork => _selectedNetwork;
  String get receiveAddress => _receiveAddress;
  ResponseOrderFullModel? get orderDetail => _orderDetail;

  @override
  WaitingReceiveCoinFormState copyWith(Map<String, dynamic> value) {
    return WaitingReceiveCoinFormState(
      selectedNetwork:
          value[WaitingReceiveCoinFormStateFields.selectedNetwork] ??
              _selectedNetwork,
      receiveAddress: value[WaitingReceiveCoinFormStateFields.receiveAddress] ??
          _receiveAddress,
      orderDetail: value['orderDetail'] ?? _orderDetail,
    );
  }
}

class WaitingReceiveCoinFormStateFields {
  WaitingReceiveCoinFormStateFields._();

  static const String selectedNetwork = 'selectedNetwork';
  static const String receiveAddress = 'receiveAddress';
}

class WaitingReceiveCoinOrderData
    implements IPageState<WaitingReceiveCoinOrderData> {
  ResponseOrderFullModel? _orderFull;

  WaitingReceiveCoinOrderData({
    ResponseOrderFullModel? orderFull,
  }) {
    _orderFull = orderFull;
  }

  ResponseOrderFullModel get orderFull =>
      _orderFull ?? ResponseOrderFullModel();

  @override
  WaitingReceiveCoinOrderData copyWith(Map<String, dynamic> value) {
    return WaitingReceiveCoinOrderData(
      orderFull: value['orderFull'] ?? _orderFull,
    );
  }
}
