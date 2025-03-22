import 'package:aconnec_1109_x/src/model/response_trade_transaction.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class OrderCompletedPageState implements IPageState<OrderCompletedPageState> {
  ResponseTradeTransactionModel? _transaction;

  OrderCompletedPageState({
    ResponseTradeTransactionModel? transaction,
  }) {
    _transaction = transaction;
  }

  ResponseTradeTransactionModel? get transaction => _transaction;

  @override
  OrderCompletedPageState copyWith(Map<String, dynamic> value) {
    return OrderCompletedPageState(
      transaction:
          value[OrderCompletedPageStateFields.transaction] ?? _transaction,
    );
  }
}

class OrderCompletedPageStateFields {
  OrderCompletedPageStateFields._();

  static const String transaction = 'transaction_detail';
}
