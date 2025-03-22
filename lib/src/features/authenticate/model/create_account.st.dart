import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class CreateAccountState implements IPageState<CreateAccountState> {
  bool _acceptTerm = true;
  bool _isLoading = false;

  String _mobileNumber = '';
  String? _mobileNumberErrorText;
  bool _submit = false;

  CreateAccountState({
    bool acceptTerm = true,
    bool isLoading = false,
    String mobileNumber = '',
    bool submit = false,
    String? mobileNumberErrorText,
  }) {
    _acceptTerm = acceptTerm;
    _isLoading = isLoading;
    _mobileNumber = mobileNumber;
    _submit = submit;
    _mobileNumberErrorText = mobileNumberErrorText;
  }

  bool get acceptTerm => _acceptTerm;
  bool get isLoading => _isLoading;
  String get mobileNumber => _mobileNumber;
  bool get submit => _submit;
  String? get mobileNumberErrorText => _mobileNumberErrorText;

  @override
  CreateAccountState copyWith(Map<String, dynamic> value) {
    return CreateAccountState(
      acceptTerm: value[CreateAccountFields.acceptTerm] ?? _acceptTerm,
      isLoading: value[CreateAccountFields.isLoading] ?? _isLoading,
      mobileNumber: value[CreateAccountFields.mobileNumber] ?? _mobileNumber,
      submit: value[CreateAccountFields.submit] ?? _submit,
      mobileNumberErrorText: value[CreateAccountFields.mobileNumberErrorText] ??
          _mobileNumberErrorText,
    );
  }
}

class CreateAccountFields {
  CreateAccountFields._();
  static const String acceptTerm = 'acceptTerm';
  static const String isLoading = 'isLoading';
  static const String mobileNumber = 'mobileNumber';
  static const String submit = 'submit';
  static const String mobileNumberErrorText = 'mobileNumberErrorText';
}
