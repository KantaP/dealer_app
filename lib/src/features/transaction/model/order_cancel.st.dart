import 'package:aconnec_1109_x/src/model/request_order_cancel_reason.m.dart';
import 'package:aconnec_1109_x/src/model/request_payment_transaction.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class OrderCancelPageState implements IPageState<OrderCancelPageState> {
  PaymentTransactionModel _transactionDetail = PaymentTransactionModel();
  OrderCancelReasonRequestModel _cancelDetail = OrderCancelReasonRequestModel();
  bool _isLoading = false;

  OrderCancelPageState(
      {PaymentTransactionModel? transactionDetail,
      bool isLoading = false,
      OrderCancelReasonRequestModel? cancelDetail}) {
    _transactionDetail = transactionDetail ?? PaymentTransactionModel();
    _isLoading = isLoading;
    _cancelDetail = cancelDetail ?? OrderCancelReasonRequestModel();
  }

  PaymentTransactionModel get transactionDetail => _transactionDetail;
  bool get isLoading => _isLoading;
  OrderCancelReasonRequestModel get cancelDetail => _cancelDetail;

  @override
  OrderCancelPageState copyWith(Map<String, dynamic> value) {
    return OrderCancelPageState(
      transactionDetail: value[OrderCancelPageStateFields.transactionDetail] ??
          _transactionDetail,
      isLoading: value[OrderCancelPageStateFields.isLoading] ?? _isLoading,
      cancelDetail:
          value[OrderCancelPageStateFields.cancelDetail] ?? _cancelDetail,
    );
  }
}

class OrderCancelPageStateFields {
  OrderCancelPageStateFields._();

  static const String transactionDetail = 'transactionDetail';
  static const String isLoading = 'isLoading';
  static const String cancelDetail = 'cancelDetail';
}
