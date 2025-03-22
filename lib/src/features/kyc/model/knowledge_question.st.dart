import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/model/knowledge_question.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KnowledgeQuestionPageState
    implements IPageState<KnowledgeQuestionPageState> {
  List<KnowledgeQuestionModel> _questions = [];

  bool _isLoading = false;

  KnowledgeQuestionPageState({
    List<KnowledgeQuestionModel> questions = const [],
    bool isLoading = false,
  }) {
    _questions = questions;
    _isLoading = isLoading;
  }

  List<KnowledgeQuestionModel> get questions => _questions;
  bool get isLoading => _isLoading;

  @override
  KnowledgeQuestionPageState copyWith(Map<String, dynamic> value) {
    return KnowledgeQuestionPageState(
      questions:
          value[KnowledgeQuestionPageStateFields.questions] ?? _questions,
      isLoading:
          value[KnowledgeQuestionPageStateFields.isLoading] ?? _isLoading,
    );
  }
}

class KnowledgeQuestionPageStateFields {
  KnowledgeQuestionPageStateFields._();

  static const String questions = 'questions';
  static const String isLoading = 'isLoading';
}

class KnowledgeQuestionFormState
    implements IPageState<KnowledgeQuestionFormState> {
  List<UserChoiceModel> _userChoices = [];
  int _score = 0;

  KnowledgeQuestionFormState({
    List<UserChoiceModel> userChoices = const [],
    int score = 0,
  }) {
    _userChoices = userChoices;
    _score = score;
  }

  List<UserChoiceModel> get userChoices => _userChoices;
  int get score => _score;

  @override
  KnowledgeQuestionFormState copyWith(Map<String, dynamic> value) {
    return KnowledgeQuestionFormState(
      userChoices:
          value[KnowledgeQuestionFormStateFields.userChoices] ?? _userChoices,
      score: value[KnowledgeQuestionFormStateFields.score] ?? _score,
    );
  }
}

class KnowledgeQuestionFormStateFields {
  KnowledgeQuestionFormStateFields._();
  static const String userChoices = 'user_choices';
  static const String score = 'score';
}

class KnowledgeQuestionFormStatePersistence
    implements ModelJson<KnowledgeQuestionFormState> {
  @override
  List<KnowledgeQuestionFormState> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  KnowledgeQuestionFormState fromJson(Map<String, dynamic> json) {
    return KnowledgeQuestionFormState(
        userChoices: UserChoiceModelPersistence()
            .fromArrayJson(json[KnowledgeQuestionFormStateFields.userChoices])
            .toList(),
        score: json[KnowledgeQuestionFormStateFields.score] ?? 0);
  }

  @override
  Map<String, dynamic> toJson(KnowledgeQuestionFormState json) {
    return {
      KnowledgeQuestionFormStateFields.userChoices: json.userChoices
          .map((e) => UserChoiceModelPersistence().toJson(e))
          .toList(),
      KnowledgeQuestionFormStateFields.score: json.score
    };
  }
}
