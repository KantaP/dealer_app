import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycFinalPageState implements IPageState<KycFinalPageState> {
  bool _isLoading = false, _shouldUpdateProgress = false;
  int _currentStepIndex = 0;
  // _firstStepProgress = 0,
  // _secondStepProgress = 0,
  // _thirdStepProgress = 0;

  String _ndidType = '';
  String _ndidPaymentResult = '';
  String _ndidResult = '';

  bool _editMode = false;

  String _firstStepProgress = '',
      _secondStepProgress = '',
      _thirdStepProgress = '';

  KycFinalPageState({
    bool isLoading = false,
    int currentStepIndex = 0,
    String firstStepProgress = '',
    String secondStepProgress = '',
    String thirdStepProgress = '',
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
  String get firstStepProgress => _firstStepProgress;
  String get secondStepProgress => _secondStepProgress;
  String get thirdStepProgress => _thirdStepProgress;

  bool get shouldUpdateProgress => _shouldUpdateProgress;

  String get ndidType => _ndidType;
  String get ndidPaymentResult => _ndidPaymentResult;

  bool get editMode => _editMode;

  String get ndidResult => _ndidResult;

  @override
  KycFinalPageState copyWith(Map<String, dynamic> value) {
    return KycFinalPageState(
      isLoading: value[KycFinalPageStateFields.isLoading] ?? _isLoading,
      currentStepIndex:
          value[KycFinalPageStateFields.currentStepIndex] ?? _currentStepIndex,
      firstStepProgress: value[KycFinalPageStateFields.firstStepProgress] ??
          _firstStepProgress,
      secondStepProgress: value[KycFinalPageStateFields.secondStepProgress] ??
          _secondStepProgress,
      thirdStepProgress: value[KycFinalPageStateFields.thirdStepProgress] ??
          _thirdStepProgress,
      shouldUpdateProgress:
          value[KycFinalPageStateFields.shouldUpdateProgress] ??
              _shouldUpdateProgress,
      ndidType: value[KycFinalPageStateFields.ndidType] ?? _ndidType,
      ndidPaymentResult: value[KycFinalPageStateFields.ndidPaymentResult] ??
          _ndidPaymentResult,
      editMode: value[KycFinalPageStateFields.editMode] ?? _editMode,
      ndidResult: value[KycFinalPageStateFields.ndidResult] ?? _ndidResult,
    );
  }
}

class KycFinalPageStateFields {
  KycFinalPageStateFields._();

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

class KycFinalPageStatePersistence implements ModelJson<KycFinalPageState> {
  @override
  List<KycFinalPageState> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  KycFinalPageState fromJson(Map<String, dynamic> json) {
    return KycFinalPageState(
      currentStepIndex: json[KycFinalPageStateFields.currentStepIndex] ?? 0,
      firstStepProgress: json[KycFinalPageStateFields.firstStepProgress] ?? 0,
      secondStepProgress: json[KycFinalPageStateFields.secondStepProgress] ?? 0,
      thirdStepProgress: json[KycFinalPageStateFields.thirdStepProgress] ?? 0,
      ndidType: json[KycFinalPageStateFields.ndidType] ?? '',
      ndidPaymentResult: json[KycFinalPageStateFields.ndidPaymentResult] ?? '',
      ndidResult: json[KycFinalPageStateFields.ndidResult] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(KycFinalPageState json) {
    return <String, dynamic>{
      KycFinalPageStateFields.currentStepIndex: json.currentStepIndex,
      KycFinalPageStateFields.firstStepProgress: json.firstStepProgress,
      KycFinalPageStateFields.secondStepProgress: json.secondStepProgress,
      KycFinalPageStateFields.thirdStepProgress: json.thirdStepProgress,
      KycFinalPageStateFields.ndidType: json.ndidType,
      KycFinalPageStateFields.ndidPaymentResult: json.ndidPaymentResult,
      KycFinalPageStateFields.ndidResult: json.ndidResult
    };
  }
}
