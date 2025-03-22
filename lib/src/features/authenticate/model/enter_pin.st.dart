import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class EnterPinPageState implements IPageState<EnterPinPageState> {
  bool _isLoading = false;

  Function()? _onCustomSubmit;

  EnterPinPageState({
    bool isLoading = false,
    Function()? onCustomSubmit,
  }) {
    _isLoading = isLoading;
    _onCustomSubmit = onCustomSubmit;
  }

  bool get isLoading => _isLoading;
  Function()? get onCustomSubmit => _onCustomSubmit;

  @override
  EnterPinPageState copyWith(Map<String, dynamic> value) {
    return EnterPinPageState(
      isLoading: value[EnterPinPageStateFields.isLoading] ?? _isLoading,
      onCustomSubmit:
          value[EnterPinPageStateFields.onCustomSubmit] ?? _onCustomSubmit,
    );
  }
}

class EnterPinPageStateFields {
  EnterPinPageStateFields._();

  static const String isLoading = 'isLoading';
  static const String onCustomSubmit = 'onCustomSubmit';
}

class EnterPinFormState implements IPageState<EnterPinFormState> {
  String _pin = '';

  EnterPinFormState({String pin = ''}) {
    _pin = pin;
  }

  String get pin => _pin;

  @override
  EnterPinFormState copyWith(Map<String, dynamic> value) {
    return EnterPinFormState(
      pin: value[EnterPinFormFields.pin] ?? _pin,
    );
  }

  String getPinIndex(int index) {
    if (pin.isEmpty) return '';
    if ((pin.length - 1) < index) {
      return '';
    }
    return pin.split('')[index];
  }
}

class EnterPinFormFields {
  EnterPinFormFields._();

  static const String pin = 'pin';
}
