import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycSelectNationalPageState
    implements IPageState<KycSelectNationalPageState> {
  bool _isLoading = false;
  String _selected = '';

  KycSelectNationalPageState({
    bool isLoading = false,
    String selected = '',
  }) {
    _isLoading = isLoading;
    _selected = selected;
  }

  bool get isLoading => _isLoading;
  String get selected => _selected;

  @override
  KycSelectNationalPageState copyWith(Map<String, dynamic> value) {
    return KycSelectNationalPageState(
      isLoading:
          value[KycSelectNationalPageStateFields.isLoading] ?? _isLoading,
      selected: value[KycSelectNationalPageStateFields.selected] ?? _selected,
    );
  }
}

class KycSelectNationalPageStateFields {
  KycSelectNationalPageStateFields._();

  static const isLoading = 'isLoading';
  static const selected = 'selected';
}
