import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycLevel1ProcessPageState extends IPageState<KycLevel1ProcessPageState> {
  bool _isLoading = false;
  String _isSuccess = '';

  KycLevel1ProcessPageState({bool isLoading = false, String isSuccess = ''}) {
    _isLoading = isLoading;
    _isSuccess = isSuccess;
  }

  bool get isLoading => _isLoading;
  String get isSuccess => _isSuccess;

  @override
  KycLevel1ProcessPageState copyWith(Map<String, dynamic> value) {
    return KycLevel1ProcessPageState(
      isLoading: value[KycLevel1ProcessPageStateFields.isLoading] ?? _isLoading,
      isSuccess: value[KycLevel1ProcessPageStateFields.isSuccess] ?? _isSuccess,
    );
  }
}

class KycLevel1ProcessPageStateFields {
  KycLevel1ProcessPageStateFields._();

  static const String isLoading = 'isLoading';
  static const String isSuccess = 'isSuccess';
}
