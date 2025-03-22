import 'package:aconnec_1109_x/src/model/knowledge_question.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class KnowledgeQuestionModelPersistence
    implements ModelJson<KnowledgeQuestionModel> {
  @override
  List<KnowledgeQuestionModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  KnowledgeQuestionModel fromJson(Map<String, dynamic> json) {
    return KnowledgeQuestionModel(
      id: json[KnowledgeQuestionModelFields.id],
      answer: json[KnowledgeQuestionModelFields.answer],
      question: json[KnowledgeQuestionModelFields.question],
      choice1: json[KnowledgeQuestionModelFields.choice1],
      choice2: json[KnowledgeQuestionModelFields.choice2],
      choice3: json[KnowledgeQuestionModelFields.choice3],
    );
  }

  @override
  Map<String, dynamic> toJson(KnowledgeQuestionModel json) {
    return {
      KnowledgeQuestionModelFields.id: json.id,
      KnowledgeQuestionModelFields.answer: json.answer,
      KnowledgeQuestionModelFields.question: json.question,
      KnowledgeQuestionModelFields.choice1: json.choice1,
      KnowledgeQuestionModelFields.choice2: json.choice2,
      KnowledgeQuestionModelFields.choice3: json.choice3,
    };
  }
}
