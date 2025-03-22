import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class SuiteablePageState implements IPageState<SuiteablePageState> {
  String _suiteableType = '';
  int _score = 0;
  List<UserChoiceModel> _prefill = [];
  String _iwtRiskId = '';
  int _iwtScore = 0;
  String _iwtRiskId2 = '';

  SuiteablePageState({
    String suiteableType = '',
    int score = 0,
    List<UserChoiceModel> prefill = const [],
    String iwtRiskId = '',
    int iwtScore = 0,
    String iwtRistId2 = '',
  }) {
    _suiteableType = suiteableType;
    _score = score;
    _prefill = prefill;
    _iwtRiskId = iwtRiskId;
    _iwtScore = iwtScore;
    _iwtRiskId2 = iwtRistId2;
  }

  String get suiteableType => _suiteableType;
  int get score => _score;
  List<UserChoiceModel> get prefill => _prefill;
  String get iwtRiskId => _iwtRiskId;
  int get iwtScore => _iwtScore;
  String get iwtRistId2 => _iwtRiskId2;

  @override
  SuiteablePageState copyWith(Map<String, dynamic> value) {
    return SuiteablePageState(
      suiteableType:
          value[SuiteablePageStateFields.suiteableType] ?? _suiteableType,
      score: value[SuiteablePageStateFields.score] ?? _score,
      prefill: value[SuiteablePageStateFields.prefill] ?? _prefill,
      iwtRiskId: value[SuiteablePageStateFields.iwtRiskId] ?? _iwtRiskId,
      iwtScore: value[SuiteablePageStateFields.iwtScore] ?? _iwtScore,
      iwtRistId2: value[SuiteablePageStateFields.iwtRistId2] ?? _iwtRiskId2,
    );
  }
}

class SuiteablePageStateFields {
  SuiteablePageStateFields._();

  static const String suiteableType = 'risk_type';
  static const String score = 'score';
  static const String prefill = 'user_choices';
  static const String iwtRiskId = 'iwt_risk_id';
  static const String iwtScore = 'iwt_score';
  static const String iwtRistId2 = 'iwt_rist_id_2';
}

class SuiteablePageStatePersistence implements ModelJson<SuiteablePageState> {
  @override
  List<SuiteablePageState> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  SuiteablePageState fromJson(Map<String, dynamic> json) {
    return SuiteablePageState(
      prefill: UserChoiceModelPersistence()
          .fromArrayJson(json[SuiteablePageStateFields.prefill]),
      score: json[SuiteablePageStateFields.score] ?? 0,
      suiteableType: json[SuiteablePageStateFields.suiteableType] ?? '',
      iwtRiskId: json[SuiteablePageStateFields.iwtRiskId] ?? '',
      iwtScore: json[SuiteablePageStateFields.iwtScore] ?? 0,
      // iwtRistId2: json[SuiteablePageStateFields.iwtRistId2] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(SuiteablePageState json) {
    return {
      SuiteablePageStateFields.suiteableType: json.suiteableType,
      SuiteablePageStateFields.score: json.score,
      SuiteablePageStateFields.prefill:
          UserChoiceModelPersistence().toArrayJson(json.prefill),
      SuiteablePageStateFields.iwtRiskId: json.iwtRiskId,
      SuiteablePageStateFields.iwtScore: json.iwtScore,
      // SuiteablePageStateFields.iwtRistId2: json.iwtRistId2,
    };
  }
}
