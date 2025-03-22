import 'package:aconnec_1109_x/src/model/model.abs.dart';

class SuiteableAnswerRequestModel
    implements Model<SuiteableAnswerRequestModel> {
  int _qid = 0;
  List<int> _answers = [];

  SuiteableAnswerRequestModel({
    int qid = 0,
    List<int> answers = const [],
  }) {
    _qid = qid;
    _answers = answers;
  }

  int get qid => _qid;
  List<int> get answers => _answers;

  @override
  SuiteableAnswerRequestModel copyWith(Map<String, dynamic> value) {
    return SuiteableAnswerRequestModel(
      qid: value[SuiteableAnswerRequestModelFields] ?? _qid,
      answers: value[SuiteableAnswerRequestModelFields.answers] ?? _answers,
    );
  }
}

class SuiteableAnswerRequestModelFields {
  SuiteableAnswerRequestModelFields._();

  static const String qid = "qid";
  static const String answers = "answers";
}
