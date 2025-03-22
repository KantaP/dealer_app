import 'package:aconnec_1109_x/src/model/answer.m.p.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/politic_question.m.dart';
import 'package:aconnec_1109_x/src/model/suiteable_select_list.m.dart';
import 'package:aconnec_1109_x/src/model/translate.m.p.dart';

class PoliticQuestionModelPersistence
    implements ModelJson<PoliticQuestionModel> {
  @override
  List<PoliticQuestionModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  PoliticQuestionModel fromJson(Map<String, dynamic> json) {
    return PoliticQuestionModel(
      id: json[PoliticQuestionModelFields.id].toString(),
      multiple: json[PoliticQuestionModelFields.multiple],
      answers: SuiteableAnswerModelPersistence()
          .fromArrayJson(json[PoliticQuestionModelFields.answers]),
      question: TranslateModelPersistence()
          .fromJson(json[PoliticQuestionModelFields.question]),
      selectItem: json[PoliticQuestionModelFields.selectItem] ?? false,
      selectList: SuiteableSelectListModelPersistence().fromArrayJson(
        json[PoliticQuestionModelFields.selectList],
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(PoliticQuestionModel json) {
    return <String, dynamic>{
      PoliticQuestionModelFields.id: json.id,
      PoliticQuestionModelFields.answers: json.answers,
      PoliticQuestionModelFields.multiple: json.multiple,
      PoliticQuestionModelFields.question: json.question,
      PoliticQuestionModelFields.selectItem: json.selectedItem,
      PoliticQuestionModelFields.selectList: json.selectList,
    };
  }
}
