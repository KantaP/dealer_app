import 'package:aconnec_1109_x/src/model/answer.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/suiteable_select_list.m.dart';
import 'package:aconnec_1109_x/src/model/translate.m.dart';

class PoliticQuestionModel implements Model<PoliticQuestionModel> {
  String _id = '';
  bool _multiple = false;
  TranslateModel? _question;
  List<SuiteableAnswerModel> _answers = [];
  bool _selectItem = false;
  List<SuiteableSelectListModel> _selectList = [];

  PoliticQuestionModel({
    String id = '',
    bool multiple = false,
    TranslateModel? question,
    List<SuiteableAnswerModel> answers = const [],
    bool selectItem = false,
    List<SuiteableSelectListModel> selectList = const [],
  }) {
    _id = id;
    _multiple = multiple;
    _question = question;
    _answers = answers;
    _selectItem = selectItem;
    _selectList = selectList;
  }

  String get id => _id;
  bool get multiple => _multiple;
  TranslateModel? get question => _question;
  List<SuiteableAnswerModel> get answers => _answers;
  bool get selectedItem => _selectItem;
  List<SuiteableSelectListModel> get selectList => _selectList;

  @override
  PoliticQuestionModel copyWith(Map<String, dynamic> value) {
    return PoliticQuestionModel(
      id: value[PoliticQuestionModelFields.id] ?? _id,
      multiple: value[PoliticQuestionModelFields.multiple] ?? _multiple,
      question: value[PoliticQuestionModelFields.question] ?? _question,
      answers: value[PoliticQuestionModelFields.answers] ?? _answers,
      selectItem: value[PoliticQuestionModelFields.selectItem] ?? _selectItem,
      selectList: value[PoliticQuestionModelFields.selectList] ?? _selectList,
    );
  }
}

class PoliticQuestionModelFields {
  PoliticQuestionModelFields._();

  static const String id = 'id';
  static const String multiple = 'multiple';
  static const String question = 'question';
  static const String answers = 'answers';
  static const String selectItem = 'select_item';
  static const String selectList = 'select_list';
}
