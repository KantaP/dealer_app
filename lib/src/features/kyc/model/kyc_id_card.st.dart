import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycIdCardState implements IPageState<KycIdCardState> {
  bool _isLoading = false;

  KycIdCardState({bool isLoading = false}) {
    _isLoading = isLoading;
  }

  @override
  KycIdCardState copyWith(Map<String, dynamic> value) {
    return KycIdCardState(
      isLoading: value[KycIdCardFields.isLoading] ?? _isLoading,
    );
  }
}

class KycIdCardFields {
  KycIdCardFields._();
  static const String isLoading = "isLoading";
}

class KycIdCardFormState implements IPageState<KycIdCardFormState> {
  String _idCard = "";
  bool _submit = false;

  KycIdCardFormState({
    String idCard = "",
    bool submit = false,
  }) {
    _idCard = idCard;
    _submit = submit;
  }

  @override
  KycIdCardFormState copyWith(Map<String, dynamic> value) {
    return KycIdCardFormState(
      idCard: value[KycIdCardFormFields.idCard] ?? _idCard,
      submit: value[KycIdCardFormFields.submit] ?? _submit,
    );
  }
}

class KycIdCardFormFields {
  KycIdCardFormFields._();

  static const String idCard = "idCard";
  static const String submit = "submit";
}
