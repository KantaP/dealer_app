import 'package:aconnec_1109_x/src/model/knowledge_question.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class KnowledgeModel implements Model<KnowledgeModel> {
  List<KnowledgeQuestionModel> _basicCrypto = [];
  List<KnowledgeQuestionModel> _investment = [];
  List<KnowledgeQuestionModel> _intervention = [];
  List<KnowledgeQuestionModel> _law = [];
  List<KnowledgeQuestionModel> _service = [];

  KnowledgeModel({
    List<KnowledgeQuestionModel> basicCrypto = const [],
    List<KnowledgeQuestionModel> investment = const [],
    List<KnowledgeQuestionModel> intervention = const [],
    List<KnowledgeQuestionModel> law = const [],
    List<KnowledgeQuestionModel> service = const [],
  }) {
    _basicCrypto = basicCrypto;
    _investment = investment;
    _intervention = intervention;
    _law = law;
    _service = service;
  }

  List<KnowledgeQuestionModel> get basicCrypto => _basicCrypto;
  List<KnowledgeQuestionModel> get investment => _investment;
  List<KnowledgeQuestionModel> get intervention => _intervention;
  List<KnowledgeQuestionModel> get law => _law;
  List<KnowledgeQuestionModel> get service => _service;

  @override
  KnowledgeModel copyWith(Map<String, dynamic> value) {
    return KnowledgeModel(
      basicCrypto: value[KnowledgeModelFields.basicCrypto] ?? _basicCrypto,
      investment: value[KnowledgeModelFields.investment] ?? _investment,
      intervention: value[KnowledgeModelFields.intervention] ?? _intervention,
      law: value[KnowledgeModelFields.law] ?? _law,
      service: value[KnowledgeModelFields.service] ?? _service,
    );
  }
}

class KnowledgeModelFields {
  KnowledgeModelFields._();

  static const String basicCrypto = "basic_crypto";
  static const String investment = "investment";
  static const String intervention = "intervention";
  static const String law = "law";
  static const String service = "service";
}
