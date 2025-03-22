import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_ndid_ref.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycSuccessPageState implements IPageState<KycSuccessPageState> {
  String _ref = '';
  String _errorMessage = '';
  NdidRefResponseModel _createRequestResponse = NdidRefResponseModel();
  bool _isLoading = false;

  KycSuccessPageState({
    String ref = '',
    String errorMessage = '',
    NdidRefResponseModel? createRequestResponse,
    bool isLoading = false,
  }) {
    _ref = ref;
    _errorMessage = errorMessage;
    _createRequestResponse = createRequestResponse ?? NdidRefResponseModel();
    _isLoading = isLoading;
  }

  String get ref => _ref;
  String get errorMessage => _errorMessage;
  NdidRefResponseModel get createRequestResponse => _createRequestResponse;
  bool get isLoading => _isLoading;

  @override
  KycSuccessPageState copyWith(Map<String, dynamic> value) {
    return KycSuccessPageState(
      ref: value[KycSuccessPageStateFields.ref] ?? _ref,
      errorMessage:
          value[KycSuccessPageStateFields.errorMessage] ?? _errorMessage,
      createRequestResponse:
          value[KycSuccessPageStateFields.createRequestResponse] ??
              _createRequestResponse,
      isLoading: value[KycSuccessPageStateFields.isLoading] ?? _isLoading,
    );
  }
}

class KycSuccessPageStateFields {
  KycSuccessPageStateFields._();
  static const String ref = 'ref';
  static const String errorMessage = 'errorMessage';
  static const String createRequestResponse = 'createRequestResponse';
  static const String isLoading = 'isLoading';
}
