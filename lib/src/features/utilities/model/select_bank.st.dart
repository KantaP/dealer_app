import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class SelectBankPageState implements IPageState<SelectBankPageState> {
  String _selectedCode = '';
  Function(String value)? _onSelect;

  SelectBankPageState({
    String selectedCode = '',
    Function(String value)? onSelect,
  }) {
    _selectedCode = selectedCode;
    _onSelect = onSelect;
  }

  String get selectedCode => _selectedCode;
  Function(String value)? get onSelect => _onSelect;

  @override
  SelectBankPageState copyWith(Map<String, dynamic> value) {
    return SelectBankPageState(
      selectedCode:
          value[SelectBankPageStateFields.selectedCode] ?? _selectedCode,
      onSelect: value[SelectBankPageStateFields.onSelect] ?? _onSelect,
    );
  }
}

class SelectBankPageStateFields {
  SelectBankPageStateFields._();

  static const String selectedCode = 'selectedCode';
  static const String onSelect = 'onSelect';
}
