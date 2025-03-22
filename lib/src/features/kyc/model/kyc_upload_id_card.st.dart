import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycUploadIdCardPageState implements IPageState<KycUploadIdCardPageState> {
  String _frontIdCardPath = '';
  String _backIdCardPath = '';
  String _selfiePath = '';

  KycUploadIdCardPageState({
    String frontIdCardPath = '',
    String backIdCardPath = '',
    String selfiePath = '',
  }) {
    _frontIdCardPath = frontIdCardPath;
    _backIdCardPath = backIdCardPath;
    _selfiePath = selfiePath;
  }

  String get frontIdCardPath => _frontIdCardPath;
  String get backIdCardPath => _backIdCardPath;
  String get selfiePath => _selfiePath;

  @override
  KycUploadIdCardPageState copyWith(Map<String, dynamic> value) {
    return KycUploadIdCardPageState(
        frontIdCardPath:
            value[KycUploadIdCardPageStateFields.frontIdCardPath] ??
                _frontIdCardPath,
        backIdCardPath: value[KycUploadIdCardPageStateFields.backIdCardPath] ??
            _backIdCardPath,
        selfiePath:
            value[KycUploadIdCardPageStateFields.selfiePath] ?? _selfiePath);
  }
}

class KycUploadIdCardPageStateFields {
  KycUploadIdCardPageStateFields._();

  static const String frontIdCardPath = 'frontIdCardPath';
  static const String backIdCardPath = 'backIdCardPath';
  static const String selfiePath = 'selfiePath';
}
