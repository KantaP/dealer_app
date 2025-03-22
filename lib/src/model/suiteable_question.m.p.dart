import 'package:aconnec_1109_x/src/model/answer.m.p.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/suiteable_question.m.dart';
import 'package:aconnec_1109_x/src/model/suiteable_select_list.m.dart';
import 'package:aconnec_1109_x/src/model/translate.m.p.dart';

class SuiteableQuestionModelPersistence
    implements ModelJson<SuiteableQuestionModel> {
  @override
  List<SuiteableQuestionModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  SuiteableQuestionModel fromJson(Map<String, dynamic> json) {
    return SuiteableQuestionModel(
      id: json[SuiteableQuestionModelFields.id].toString(),
      multiple: json[SuiteableQuestionModelFields.multiple],
      answers: SuiteableAnswerModelPersistence()
          .fromArrayJson(json[SuiteableQuestionModelFields.answers]),
      question: TranslateModelPersistence()
          .fromJson(json[SuiteableQuestionModelFields.question]),
      selectItem: json[SuiteableQuestionModelFields.selectItem] ?? false,
      selectList: SuiteableSelectListModelPersistence().fromArrayJson(
        json[SuiteableQuestionModelFields.selectList],
      ),
      isIWT: json[SuiteableQuestionModelFields.isIWT],
    );
  }

  @override
  Map<String, dynamic> toJson(SuiteableQuestionModel json) {
    return <String, dynamic>{
      SuiteableQuestionModelFields.id: json.id,
      SuiteableQuestionModelFields.answers: json.answers,
      SuiteableQuestionModelFields.multiple: json.multiple,
      SuiteableQuestionModelFields.question: json.question,
      SuiteableQuestionModelFields.selectItem: json.selectedItem,
      SuiteableQuestionModelFields.selectList: json.selectList,
      SuiteableQuestionModelFields.isIWT: json.isIWT
    };
  }
}
