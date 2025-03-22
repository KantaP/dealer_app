import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class SignInPageState implements IPageState<SignInPageState> {
  String _username = '';
  String _password = '';
  bool _submit = false;

  SignInPageState(
      {String username = '', String password = '', bool submit = false}) {
    _username = username;
    _password = password;
    _submit = submit;
  }

  String get username => _username;
  String get password => _password;
  bool get submit => _submit;

  @override
  SignInPageState copyWith(Map<String, dynamic> value) {
    return SignInPageState(
      username: value[SignInFields.username] ?? _username,
      password: value[SignInFields.password] ?? _password,
      submit: value[SignInFields.submit] ?? _submit,
    );
  }
}

class SignInFields {
  SignInFields._();

  static const String username = 'username';
  static const String password = 'password';
  static const String submit = 'submit';
}
