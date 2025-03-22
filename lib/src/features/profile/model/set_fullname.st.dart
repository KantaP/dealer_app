import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class SetFullnameState implements IPageState<SetFullnameState> {
  String _firstName = "";
  String _lastName = "";
  bool _submit = false;

  String? _inputFirstNameError;
  String? _inputLastNameError;

  SetFullnameState({
    String firstName = "",
    String lastName = "",
    bool submit = false,
    String? inputFirstNameError,
    String? inputLastNameError,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _submit = submit;
    _inputFirstNameError = inputFirstNameError;
    _inputLastNameError = inputLastNameError;
  }

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get fullName => "$firstName $lastName";
  bool get submit => _submit;

  String? get inputFirstNameError => _inputFirstNameError;
  String? get inputLastNameError => _inputLastNameError;

  @override
  SetFullnameState copyWith(Map<String, dynamic> value) {
    return SetFullnameState(
      firstName: value[SetFullnameFields.firstName] ?? _firstName,
      lastName: value[SetFullnameFields.lastName] ?? _lastName,
      submit: value[SetFullnameFields.submit] ?? _submit,
      inputFirstNameError: value[SetFullnameFields.inputFirstNameError],
      inputLastNameError: value[SetFullnameFields.inputLastNameError],
    );
  }
}

class SetFullnameFields {
  SetFullnameFields._();

  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String submit = "submit";
  static const String inputFirstNameError = "inputFirstNameError";
  static const String inputLastNameError = "inputLastNameError";
}
