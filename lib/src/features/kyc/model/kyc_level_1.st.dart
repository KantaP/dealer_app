import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycLevel1PageState implements IPageState<KycLevel1PageState> {
  bool _isLoading = false, _shouldUpdateProgress = false;
  int _currentStepIndex = 0, _firstStepProgress = 0, _secondStepProgress = 0;
  String _checkResult = '';

  KycLevel1PageState({
    bool isLoading = false,
    int currentStepIndex = 0,
    int firstStepProgress = 0,
    int secondStepProgress = 0,
    bool shouldUpdateProgress = false,
    String checkResult = '',
  }) {
    _isLoading = isLoading;
    _currentStepIndex = currentStepIndex;
    _firstStepProgress = firstStepProgress;
    _secondStepProgress = secondStepProgress;
    _shouldUpdateProgress = shouldUpdateProgress;
    _checkResult = checkResult;
  }

  bool get isLoading => _isLoading;
  int get currentStepIndex => _currentStepIndex;
  int get firstStepProgress => _firstStepProgress;
  int get secondStepProgress => _secondStepProgress;

  bool get shouldUpdateProgress => _shouldUpdateProgress;

  String get checkResult => _checkResult;

  @override
  KycLevel1PageState copyWith(Map<String, dynamic> value) {
    return KycLevel1PageState(
      isLoading: value[KycLevel1PageStateFields.isLoading] ?? _isLoading,
      currentStepIndex:
          value[KycLevel1PageStateFields.currentStepIndex] ?? _currentStepIndex,
      firstStepProgress: value[KycLevel1PageStateFields.firstStepProgress] ??
          _firstStepProgress,
      secondStepProgress: value[KycLevel1PageStateFields.secondStepProgress] ??
          _secondStepProgress,
      shouldUpdateProgress:
          value[KycLevel1PageStateFields.shouldUpdateProgress] ??
              _shouldUpdateProgress,
      checkResult: value[KycLevel1PageStateFields.checkResult] ?? _checkResult,
    );
  }
}

class KycLevel1PageStateFields {
  KycLevel1PageStateFields._();

  static const String isLoading = 'isLoading';
  static const String currentStepIndex = 'currentStepIndex';
  static const String firstStepProgress = 'firstStepProgress';
  static const String secondStepProgress = 'secondStepProgress';
  static const String shouldUpdateProgress = 'shouldUpdateProgress';
  static const String checkResult = 'checkResult';
}

class KycLevel1PageStatePersistence implements ModelJson<KycLevel1PageState> {
  @override
  List<KycLevel1PageState> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  KycLevel1PageState fromJson(Map<String, dynamic> json) {
    return KycLevel1PageState(
      currentStepIndex: json[KycLevel1PageStateFields.currentStepIndex] ?? 0,
      firstStepProgress: json[KycLevel1PageStateFields.firstStepProgress] ?? 0,
      secondStepProgress:
          json[KycLevel1PageStateFields.secondStepProgress] ?? 0,
      checkResult: json[KycLevel1PageStateFields.checkResult] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(KycLevel1PageState json) {
    return <String, dynamic>{
      KycLevel1PageStateFields.currentStepIndex: json.currentStepIndex,
      KycLevel1PageStateFields.firstStepProgress: json.firstStepProgress,
      KycLevel1PageStateFields.secondStepProgress: json.secondStepProgress,
      KycLevel1PageStateFields.checkResult: json.checkResult,
    };
  }
}
