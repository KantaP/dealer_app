import 'package:aconnec_1109_x/src/model/answer.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/translate.m.dart';
import 'package:aconnec_1109_x/src/model/translate.m.p.dart';

class SuiteableAnswerModelPersistence
    implements ModelJson<SuiteableAnswerModel> {
  @override
  List<SuiteableAnswerModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  SuiteableAnswerModel fromJson(Map<String, dynamic> json) {
    return SuiteableAnswerModel(
      id: json[SuiteableAnswerModelFields.id].toString(),
      point: json[SuiteableAnswerModelFields.point],
      answer: TranslateModelPersistence()
          .fromJson(json[SuiteableAnswerModelFields.answer]),
    );
  }

  @override
  Map<String, dynamic> toJson(SuiteableAnswerModel json) {
    return {
      SuiteableAnswerModelFields.id: json.id.toString(),
      SuiteableAnswerModelFields.point: json.point,
      SuiteableAnswerModelFields.answer:
          TranslateModelPersistence().toJson(json.answer ?? TranslateModel())
    };
  }
}
