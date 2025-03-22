import 'package:aconnec_1109_x/src/model/answer.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/suiteable_select_list.m.dart';
import 'package:aconnec_1109_x/src/model/translate.m.dart';

class SuiteableQuestionModel implements Model<SuiteableQuestionModel> {
  String _id = '';
  bool _multiple = false;
  TranslateModel? _question;
  List<SuiteableAnswerModel> _answers = [];
  bool _selectItem = false;
  List<SuiteableSelectListModel> _selectList = [];
  bool _isIWT = false;

  SuiteableQuestionModel(
      {String id = '',
      bool multiple = false,
      TranslateModel? question,
      List<SuiteableAnswerModel> answers = const [],
      bool selectItem = false,
      List<SuiteableSelectListModel> selectList = const [],
      bool isIWT = false}) {
    _id = id;
    _multiple = multiple;
    _question = question;
    _answers = answers;
    _selectItem = selectItem;
    _selectList = selectList;
    _isIWT = isIWT;
  }

  String get id => _id;
  bool get multiple => _multiple;
  TranslateModel? get question => _question;
  List<SuiteableAnswerModel> get answers => _answers;
  bool get selectedItem => _selectItem;
  List<SuiteableSelectListModel> get selectList => _selectList;
  bool get isIWT => _isIWT;

  @override
  SuiteableQuestionModel copyWith(Map<String, dynamic> value) {
    return SuiteableQuestionModel(
      id: value[SuiteableQuestionModelFields.id] ?? _id,
      multiple: value[SuiteableQuestionModelFields.multiple] ?? _multiple,
      question: value[SuiteableQuestionModelFields.question] ?? _question,
      answers: value[SuiteableQuestionModelFields.answers] ?? _answers,
      selectItem: value[SuiteableQuestionModelFields.selectItem] ?? _selectItem,
      selectList: value[SuiteableQuestionModelFields.selectList] ?? _selectList,
      isIWT: value[SuiteableQuestionModelFields.isIWT] ?? _isIWT,
    );
  }
}

class SuiteableQuestionModelFields {
  SuiteableQuestionModelFields._();

  static const String id = 'id';
  static const String multiple = 'multiple';
  static const String question = 'question';
  static const String answers = 'answers';
  static const String selectItem = 'select_item';
  static const String selectList = 'select_list';
  static const String isIWT = 'is_iwt';
}
