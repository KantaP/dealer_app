import 'package:aconnec_1109_x/src/model/response_trade_transaction.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class CancelReasonPageState implements IPageState<CancelReasonPageState> {
  bool _isLoading = false;

  CancelReasonPageState({
    bool isLoading = false,
  }) {
    _isLoading = isLoading;
  }

  bool get isLoading => _isLoading;

  @override
  CancelReasonPageState copyWith(Map<String, dynamic> value) {
    return CancelReasonPageState(
      isLoading:
          value[CancelReasonPageStateFields.isLoading] as bool ?? _isLoading,
    );
  }
}

class CancelReasonPageStateFields {
  CancelReasonPageStateFields._();

  static const String isLoading = 'isLoading';
}
