import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class DropdownPaymentPageState implements IPageState<DropdownPaymentPageState> {
  Function(String value)? _onSelect;
  String _selectedValue = '';
  DropdownPaymentPageState(
      {Function(String value)? onSelect, String selectedValue = ''}) {
    _onSelect = onSelect;
    _selectedValue = selectedValue;
  }

  Function(String value)? get onSelect => _onSelect;
  String get selectedValue => _selectedValue;

  @override
  DropdownPaymentPageState copyWith(Map<String, dynamic> value) {
    return DropdownPaymentPageState(
      onSelect: value[DropdownPaymentPageStateFields.onSelect] ?? _onSelect,
      selectedValue:
          value[DropdownPaymentPageStateFields.selectedValue] ?? _selectedValue,
    );
  }
}

class DropdownPaymentPageStateFields {
  DropdownPaymentPageStateFields._();
  static const String onSelect = 'onSelect';
  static const String selectedValue = 'selectedValue';
}
