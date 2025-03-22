import 'package:aconnec_1109_x/src/model/model.abs.dart';

class KnowledgeQuestionModel implements Model<KnowledgeQuestionModel> {
  int _id = 0;
  String _question = "";
  String _answer = "";
  String _choice1 = "";
  String _choice2 = "";
  String _choice3 = "";

  KnowledgeQuestionModel({
    int id = 0,
    String question = "",
    String answer = "",
    String choice1 = "",
    String choice2 = "",
    String choice3 = "",
  }) {
    _id = id;
    _question = question;
    _answer = answer;
    _choice1 = choice1;
    _choice2 = choice2;
    _choice3 = choice3;
  }

  int get id => _id;
  String get question => _question;
  String get answer => _answer;
  String get choice1 => _choice1;
  String get choice2 => _choice2;
  String get choice3 => _choice3;

  @override
  KnowledgeQuestionModel copyWith(Map<String, dynamic> value) {
    return KnowledgeQuestionModel(
      id: value[KnowledgeQuestionModelFields.id] ?? _id,
      question: value[KnowledgeQuestionModelFields.question] ?? _question,
      answer: value[KnowledgeQuestionModelFields.answer] ?? _answer,
      choice1: value[KnowledgeQuestionModelFields.choice1] ?? _choice1,
      choice2: value[KnowledgeQuestionModelFields.choice2] ?? _choice2,
      choice3: value[KnowledgeQuestionModelFields.choice3] ?? _choice3,
    );
  }
}

class KnowledgeQuestionModelFields {
  KnowledgeQuestionModelFields._();

  static const String id = "id";
  static const String question = "question";
  static const String answer = "answer";
  static const String choice1 = "choice1";
  static const String choice2 = "choice2";
  static const String choice3 = "choice3";
}
