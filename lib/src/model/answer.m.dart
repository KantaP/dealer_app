import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/translate.m.dart';
import 'package:sqflite/sqlite_api.dart';

class SuiteableAnswerModel implements Model<SuiteableAnswerModel> {
  String _id = '';
  TranslateModel? _answer;
  int _point = 0;
  bool _needMoreInformation = false;

  SuiteableAnswerModel({
    String id = '',
    TranslateModel? answer,
    int point = 0,
    bool? needMoreInformation,
  }) {
    _id = id;
    _answer = answer;
    _point = point;
    _needMoreInformation = needMoreInformation ?? false;
  }

  String get id => _id;
  TranslateModel? get answer => _answer;
  int get point => _point;
  bool? get needMoreInformation => _needMoreInformation;

  @override
  SuiteableAnswerModel copyWith(Map<String, dynamic> value) {
    return SuiteableAnswerModel(
      id: value[SuiteableAnswerModelFields.id] ?? _id,
      answer: value[SuiteableAnswerModelFields.answer] ?? _answer,
      point: value[SuiteableAnswerModelFields.point] ?? _point,
      needMoreInformation:
          value[SuiteableAnswerModelFields.needMoreInformation] ??
              _needMoreInformation,
    );
  }
}

class SuiteableAnswerModelFields {
  SuiteableAnswerModelFields._();

  static const String id = 'id';
  static const String answer = 'answer';
  static const String point = 'point';
  static const String needMoreInformation = 'needMoreInformation';
}
