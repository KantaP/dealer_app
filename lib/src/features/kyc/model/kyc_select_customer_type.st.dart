import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycSelectCustomerTypePageState
    implements IPageState<KycSelectCustomerTypePageState> {
  bool _isLoading = false;
  String _selected = '';

  KycSelectCustomerTypePageState({
    bool isLoading = false,
    String selected = '',
  }) {
    _isLoading = isLoading;
    _selected = selected;
  }

  bool get isLoading => _isLoading;
  String get selected => _selected;

  @override
  KycSelectCustomerTypePageState copyWith(Map<String, dynamic> value) {
    return KycSelectCustomerTypePageState(
      isLoading:
          value[KycSelectCustomerTypePageStageFields.isLoading] ?? _isLoading,
      selected:
          value[KycSelectCustomerTypePageStageFields.selected] ?? _selected,
    );
  }
}

class KycSelectCustomerTypePageStageFields {
  KycSelectCustomerTypePageStageFields._();

  static const isLoading = 'isLoading';
  static const selected = 'selected';
}
