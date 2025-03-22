import 'package:aconnec_1109_x/src/model/knowledge.m.dart';
import 'package:aconnec_1109_x/src/model/knowledge_question.m.p.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class KnowledgeModelPersistence implements ModelJson<KnowledgeModel> {
  @override
  List<KnowledgeModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  KnowledgeModel fromJson(Map<String, dynamic> json) {
    return KnowledgeModel(
      basicCrypto: KnowledgeQuestionModelPersistence()
          .fromArrayJson(json[KnowledgeModelFields.basicCrypto]),
      intervention: KnowledgeQuestionModelPersistence()
          .fromArrayJson(json[KnowledgeModelFields.intervention]),
      investment: KnowledgeQuestionModelPersistence()
          .fromArrayJson(json[KnowledgeModelFields.investment]),
      law: KnowledgeQuestionModelPersistence()
          .fromArrayJson(json[KnowledgeModelFields.law]),
      service: KnowledgeQuestionModelPersistence()
          .fromArrayJson(json[KnowledgeModelFields.service]),
    );
  }

  @override
  Map<String, dynamic> toJson(KnowledgeModel json) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
