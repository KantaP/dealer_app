import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class SetPinPageState implements IPageState<SetPinPageState> {
  bool _isLoading = false;
  SetPinPageState({
    bool isLoading = false,
  }) {
    _isLoading = isLoading;
  }

  bool get isLoading => _isLoading;

  @override
  SetPinPageState copyWith(Map<String, dynamic> value) {
    return SetPinPageState(isLoading: value['isLoading'] ?? _isLoading);
  }
}

class SetPinState implements IPageState<SetPinState> {
  String _pin = '';
  String _confirmPin = '';
  bool _isNotSecurity = false;

  SetPinState(
      {String pin = '', String confirmPin = '', bool isNotSecurity = false}) {
    _pin = pin;
    _confirmPin = confirmPin;
    _isNotSecurity = isNotSecurity;
  }

  String get pin => _pin;
  String get confirmPin => _confirmPin;
  bool get pinAlready => (_pin.length == 6);
  bool get confirmPinAlready => _confirmPin.length == 6;
  bool get pinAllMatch => _pin == _confirmPin;
  bool get isNotSecurityPin => _isNotSecurity;

  @override
  SetPinState copyWith(Map<String, dynamic> value) {
    return SetPinState(
      pin: value[SetPinFields.pin] ?? _pin,
      confirmPin: value[SetPinFields.confirmPin] ?? _confirmPin,
      isNotSecurity: value[SetPinFields.isNotSecurity] ?? _isNotSecurity,
    );
  }

  String getPinIndex(int index) {
    if (pin.isEmpty) return '';
    if ((pin.length - 1) < index) {
      return '';
    }
    return pin.split('')[index];
  }

  String getConfirmPinIndex(int index) {
    if (confirmPin.isEmpty) return '';
    if ((confirmPin.length - 1) < index) {
      return '';
    }
    return confirmPin.split('')[index];
  }
}

class SetPinFields {
  SetPinFields._();

  static const String pin = 'pin';
  static const String confirmPin = 'confirmPin';
  static const String isNotSecurity = 'isNotSecurity';
}
