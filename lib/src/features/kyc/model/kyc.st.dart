import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycLevel2PageState implements IPageState<KycLevel2PageState> {
  bool _isLoading = false, _shouldUpdateProgress = false;
  int _currentStepIndex = 0,
      _firstStepProgress = 0,
      _secondStepProgress = 0,
      _thirdStepProgress = 0;

  String _ndidType = '';
  String _ndidPaymentResult = '';
  String _ndidResult = '';

  bool _editMode = false;

  KycLevel2PageState({
    bool isLoading = false,
    int currentStepIndex = 0,
    int firstStepProgress = 0,
    int secondStepProgress = 0,
    int thirdStepProgress = 0,
    bool shouldUpdateProgress = false,
    String ndidType = '',
    String ndidPaymentResult = '',
    bool editMode = false,
    String ndidResult = '',
  }) {
    _isLoading = isLoading;
    _currentStepIndex = currentStepIndex;
    _firstStepProgress = firstStepProgress;
    _secondStepProgress = secondStepProgress;
    _thirdStepProgress = thirdStepProgress;
    _shouldUpdateProgress = shouldUpdateProgress;
    _ndidType = ndidType;
    _ndidPaymentResult = ndidPaymentResult;
    _editMode = editMode;
    _ndidResult = ndidResult;
  }

  bool get isLoading => _isLoading;
  int get currentStepIndex => _currentStepIndex;
  int get firstStepProgress => _firstStepProgress;
  int get secondStepProgress => _secondStepProgress;
  int get thirdStepProgress => _thirdStepProgress;

  bool get shouldUpdateProgress => _shouldUpdateProgress;

  String get ndidType => _ndidType;
  String get ndidPaymentResult => _ndidPaymentResult;

  bool get editMode => _editMode;

  String get ndidResult => _ndidResult;

  @override
  KycLevel2PageState copyWith(Map<String, dynamic> value) {
    return KycLevel2PageState(
      isLoading: value[KycLevel2PageStateFields.isLoading] ?? _isLoading,
      currentStepIndex:
          value[KycLevel2PageStateFields.currentStepIndex] ?? _currentStepIndex,
      firstStepProgress: value[KycLevel2PageStateFields.firstStepProgress] ??
          _firstStepProgress,
      secondStepProgress: value[KycLevel2PageStateFields.secondStepProgress] ??
          _secondStepProgress,
      thirdStepProgress: value[KycLevel2PageStateFields.thirdStepProgress] ??
          _thirdStepProgress,
      shouldUpdateProgress:
          value[KycLevel2PageStateFields.shouldUpdateProgress] ??
              _shouldUpdateProgress,
      ndidType: value[KycLevel2PageStateFields.ndidType] ?? _ndidType,
      ndidPaymentResult: value[KycLevel2PageStateFields.ndidPaymentResult] ??
          _ndidPaymentResult,
      editMode: value[KycLevel2PageStateFields.editMode] ?? _editMode,
      ndidResult: value[KycLevel2PageStateFields.ndidResult] ?? _ndidResult,
    );
  }
}

class KycLevel2PageStateFields {
  KycLevel2PageStateFields._();

  static const String isLoading = 'isLoading';
  static const String currentStepIndex = 'currentStepIndex';
  static const String firstStepProgress = 'firstStepProgress';
  static const String secondStepProgress = 'secondStepProgress';
  static const String thirdStepProgress = 'thirdStepProgress';
  static const String shouldUpdateProgress = 'shouldUpdateProgress';
  static const String ndidType = 'ndidType';
  static const String ndidPaymentResult = 'ndidPaymentResult';
  static const String editMode = 'editMode';
  static const String ndidResult = 'ndidResult';
}

class KycLevel2PageStatePersistence implements ModelJson<KycLevel2PageState> {
  @override
  List<KycLevel2PageState> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  KycLevel2PageState fromJson(Map<String, dynamic> json) {
    return KycLevel2PageState(
      currentStepIndex: json[KycLevel2PageStateFields.currentStepIndex] ?? 0,
      firstStepProgress: json[KycLevel2PageStateFields.firstStepProgress] ?? 0,
      secondStepProgress:
          json[KycLevel2PageStateFields.secondStepProgress] ?? 0,
      thirdStepProgress: json[KycLevel2PageStateFields.thirdStepProgress] ?? 0,
      ndidType: json[KycLevel2PageStateFields.ndidType] ?? '',
      ndidPaymentResult: json[KycLevel2PageStateFields.ndidPaymentResult] ?? '',
      ndidResult: json[KycLevel2PageStateFields.ndidResult] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(KycLevel2PageState json) {
    return <String, dynamic>{
      KycLevel2PageStateFields.currentStepIndex: json.currentStepIndex,
      KycLevel2PageStateFields.firstStepProgress: json.firstStepProgress,
      KycLevel2PageStateFields.secondStepProgress: json.secondStepProgress,
      KycLevel2PageStateFields.thirdStepProgress: json.thirdStepProgress,
      KycLevel2PageStateFields.ndidType: json.ndidType,
      KycLevel2PageStateFields.ndidPaymentResult: json.ndidPaymentResult,
      KycLevel2PageStateFields.ndidResult: json.ndidResult
    };
  }
}
