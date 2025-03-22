import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class PhoneAuthState implements IPageState<PhoneAuthState> {
  bool _isLoading = false;

  PhoneAuthState({
    bool isLoading = false,
  }) {
    _isLoading = isLoading;
  }

  bool get isLoading => _isLoading;

  @override
  PhoneAuthState copyWith(Map<String, dynamic> value) {
    return PhoneAuthState(
      isLoading: value[PhoneAuthFields.isLoading] ?? _isLoading,
    );
  }
}

class PhoneAuthFields {
  PhoneAuthFields._();
  static const String isLoading = "isLoading";
}

class PhoneAuthFormState implements IPageState<PhoneAuthFormState> {
  String _mobileNumber = '';
  String _mobileNumberErrorText = '';
  bool _submit = false;
  String _invitationCode = '';
  String _invitationCodeErrorText = '';

  PhoneAuthFormState({
    String mobileNumber = '',
    bool submit = false,
    String mobileNumberErrorText = '',
    String invitationCode = '',
    String invitationCodeErrorText = '',
  }) {
    _mobileNumber = mobileNumber;
    _submit = submit;
    _mobileNumberErrorText = mobileNumberErrorText;
    _invitationCode = invitationCode;
    _invitationCodeErrorText = invitationCodeErrorText;
  }

  String get mobileNumber => _mobileNumber;
  bool get submit => _submit;
  String get mobileNumberErrorText => _mobileNumberErrorText;
  String get invitationCode => _invitationCode;
  String get invitationCodeErrorText => _invitationCodeErrorText;

  @override
  PhoneAuthFormState copyWith(Map<String, dynamic> value) {
    return PhoneAuthFormState(
      mobileNumber: value[PhoneAuthFormFields.mobileNumber] ?? _mobileNumber,
      submit: value[PhoneAuthFormFields.submit] ?? _submit,
      mobileNumberErrorText: value[PhoneAuthFormFields.mobileNumberErrorText] ??
          _mobileNumberErrorText,
      invitationCode:
          value[PhoneAuthFormFields.invitationCode] ?? _invitationCode,
      invitationCodeErrorText:
          value[PhoneAuthFormFields.invitationCodeErrorText] ??
              _invitationCodeErrorText,
    );
  }
}

class PhoneAuthFormFields {
  PhoneAuthFormFields._();
  static const String mobileNumber = "mobileNumber";
  static const String submit = "submit";
  static const String mobileNumberErrorText = "mobileNumberErrorText";
  static const String invitationCode = "invitationCode";
  static const String invitationCodeErrorText = "invitationCodeErrorText";
}

