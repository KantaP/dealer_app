import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/suiteable_question.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class SuiteableQuestionPageState
    implements IPageState<SuiteableQuestionPageState> {
  List<SuiteableQuestionModel> _questions = [];
  Function(List<UserChoiceModel>)? _callback;

  bool _isLoading = false;

  SuiteableQuestionPageState({
    List<SuiteableQuestionModel> questions = const [],
    Function(List<UserChoiceModel>)? callback,
    bool isLoading = false,
  }) {
    _questions = questions;
    _callback = callback;
    _isLoading = isLoading;
  }

  List<SuiteableQuestionModel> get questions => _questions;
  Function(List<UserChoiceModel>)? get callback => _callback;
  bool get isLoading => _isLoading;

  @override
  SuiteableQuestionPageState copyWith(Map<String, dynamic> value) {
    return SuiteableQuestionPageState(
      questions:
          value[SuiteableQuestionPageStateFields.questions] ?? _questions,
      callback: value[SuiteableQuestionPageStateFields.callback] ?? _callback,
      isLoading:
          value[SuiteableQuestionPageStateFields.isLoading] ?? _isLoading,
    );
  }
}

class SuiteableQuestionPageStateFields {
  SuiteableQuestionPageStateFields._();

  static const String questions = 'questions';
  static const String callback = 'callback';
  static const String isLoading = 'isLoading';
}

class UserChoiceModel implements Model<UserChoiceModel> {
  String _questionId = '';
  List<String> _answerId = [];
  int _point = 0;

  UserChoiceModel({
    String questionId = '',
    List<String> answerId = const [],
    int point = 0,
  }) {
    _questionId = questionId;
    _answerId = answerId;
    _point = point;
  }

  String get questionId => _questionId;
  List<String> get answerId => _answerId;
  int get point => _point;

  @override
  UserChoiceModel copyWith(Map<String, dynamic> value) {
    return UserChoiceModel(
      questionId: value[UserChoiceModelFields.questionId] ?? _questionId,
      answerId: value[UserChoiceModelFields.answerId] ?? _answerId,
      point: value[UserChoiceModelFields.point] ?? _point,
    );
  }
}

class UserChoiceModelFields {
  UserChoiceModelFields._();

  static const String questionId = 'question_id';
  static const String answerId = 'answer_id';
  static const String point = 'point';
}

class UserChoiceModelPersistence implements ModelJson<UserChoiceModel> {
  @override
  List<UserChoiceModel> fromArrayJson(List<dynamic> arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  UserChoiceModel fromJson(Map<String, dynamic> json) {
    return UserChoiceModel(
      questionId: json[UserChoiceModelFields.questionId],
      point: json[UserChoiceModelFields.point],
      answerId: List<String>.from(json[UserChoiceModelFields.answerId]),
    );
  }

  @override
  Map<String, dynamic> toJson(UserChoiceModel json) {
    return {
      UserChoiceModelFields.questionId: json.questionId,
      UserChoiceModelFields.point: json.point,
      UserChoiceModelFields.answerId: json.answerId,
    };
  }

  List<Map<String, dynamic>> toArrayJson(List<UserChoiceModel> arrJson) {
    return arrJson.map((e) => toJson(e)).toList();
  }
}

class SuiteableQuestionFormState
    implements IPageState<SuiteableQuestionFormState> {
  List<UserChoiceModel> _userChoices = [];

  SuiteableQuestionFormState({
    List<UserChoiceModel> userChoices = const [],
  }) {
    _userChoices = userChoices;
  }

  List<UserChoiceModel> get userChoices => _userChoices;

  @override
  SuiteableQuestionFormState copyWith(Map<String, dynamic> value) {
    return SuiteableQuestionFormState(
      userChoices:
          value[SuiteableQuestionFormeStateFields.userChoices] ?? _userChoices,
    );
  }
}

class SuiteableQuestionFormeStateFields {
  SuiteableQuestionFormeStateFields._();
  static const String userChoices = 'user_choices';
}

class SuiteableQuestionFormStatePersistence
    implements ModelJson<SuiteableQuestionFormState> {
  @override
  List<SuiteableQuestionFormState> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  SuiteableQuestionFormState fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(SuiteableQuestionFormState json) {
    return {
      SuiteableQuestionFormeStateFields.userChoices:
          json.userChoices.map((e) => UserChoiceModelPersistence().toJson(e)),
    };
  }
}
