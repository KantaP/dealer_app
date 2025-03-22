import 'package:aconnec_1109_x/src/model/model.abs.dart';

class KycLevel1ProgressModel implements Model<KycLevel1ProgressModel> {
  int _currentStepIndex = 0,
      _firstStepProgress = 0,
      _secondStepProgress = 0,
      _thirdStepProgress = 0,
      _fourthStepProgress = 0;

  KycLevel1ProgressModel({
    bool isLoading = false,
    int currentStepIndex = 0,
    int firstStepProgress = 0,
    int secondStepProgress = 0,
    int thirdStepProgress = 0,
    int fourthStepProgress = 0,
    bool shouldUpdateProgress = false,
  }) {
    _currentStepIndex = currentStepIndex;
    _firstStepProgress = firstStepProgress;
    _secondStepProgress = secondStepProgress;
    _thirdStepProgress = thirdStepProgress;
    _fourthStepProgress = fourthStepProgress;
  }

  int get currentStepIndex => _currentStepIndex;
  int get firstStepProgress => _firstStepProgress;
  int get secondStepProgress => _secondStepProgress;
  int get thirdStepProgress => _thirdStepProgress;
  int get fourthStepProgress => _fourthStepProgress;

  @override
  KycLevel1ProgressModel copyWith(Map<String, dynamic> value) {
    return KycLevel1ProgressModel(
        currentStepIndex:
            value[KycLevel1ProgressModelFields.currentStepIndex] ??
                _currentStepIndex,
        firstStepProgress:
            value[KycLevel1ProgressModelFields.firstStepProgress] ??
                _firstStepProgress,
        secondStepProgress:
            value[KycLevel1ProgressModelFields.secondStepProgress] ??
                _secondStepProgress);
  }
}

class KycLevel1ProgressModelFields {
  KycLevel1ProgressModelFields._();

  static const String currentStepIndex = "currentStepIndex";
  static const String firstStepProgress = "firstStepProgress";
  static const String secondStepProgress = "secondStepProgress";
}
