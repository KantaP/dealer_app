import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class OtpVerificationState implements IPageState<OtpVerificationState> {
  bool _isLoading = false;
  String _mode = "";

  OtpVerificationState({
    bool isLoading = false,
    String mode = "",
  }) {
    _isLoading = isLoading;
    _mode = mode;
  }

  bool get isLoading => _isLoading;
  String get mode => _mode;

  @override
  OtpVerificationState copyWith(Map<String, dynamic> value) {
    return OtpVerificationState(
      isLoading: value[OtpVerificationFields.isLoading] ?? _isLoading,
      mode: value[OtpVerificationFields.mode] ?? _mode,
    );
  }
}

class OtpVerificationFields {
  OtpVerificationFields._();
  static const String isLoading = "isLoading";
  static const String mode = "mode";
}

class OtpVerificationFormState implements IPageState<OtpVerificationFormState> {
  String _otp = "";
  String _phoneNumber = "";
  String _verificationId = "";
  String _errorState = "";
  bool _submit = false;

  OtpVerificationFormState({
    String otp = "",
    String phoneNumber = "",
    String verificationId = "",
    String errorState = "",
    bool submit = false,
  }) {
    _otp = otp;
    _phoneNumber = phoneNumber;
    _verificationId = verificationId;
    _errorState = errorState;
    _submit = submit;
  }

  String get otp => _otp;
  String get phoneNumber => _phoneNumber;
  String get verificationId => _verificationId;
  String get errorState => _errorState;
  bool get submit => _submit;

  @override
  OtpVerificationFormState copyWith(Map<String, dynamic> value) {
    return OtpVerificationFormState(
      otp: value[OtpVerificationFormFields.otp] ?? _otp,
      phoneNumber: value[OtpVerificationFormFields.phoneNumber] ?? _phoneNumber,
      verificationId:
          value[OtpVerificationFormFields.verificationId] ?? _verificationId,
      errorState: value[OtpVerificationFormFields.errorState] ?? _errorState,
      submit: value[OtpVerificationFormFields.submit] ?? _submit,
    );
  }
}

class OtpVerificationFormFields {
  OtpVerificationFormFields._();

  static const String otp = "otp";
  static const String phoneNumber = "phoneNumber";
  static const String verificationId = "verificationId";
  static const String errorState = "errorState";
  static const String submit = "submit";
}

class OtpVerificationTimerState
    implements IPageState<OtpVerificationTimerState> {
  int _time = 0;

  OtpVerificationTimerState({int time = 0}) {
    _time = time;
  }

  int get time => _time;

  @override
  OtpVerificationTimerState copyWith(Map<String, dynamic> value) {
    return OtpVerificationTimerState(
      time: value[OtpVerificationTimerFields.time] ?? _time,
    );
  }
}

class OtpVerificationTimerFields {
  OtpVerificationTimerFields._();
  static const String time = "time";
}
