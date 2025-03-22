import 'package:aconnec_1109_x/src/model/model.abs.dart';

class SuiteableSelectListModel implements Model<SuiteableSelectListModel> {
  String _id = '';
  String _en = '';
  String _th = '';
  int _score = 0;

  SuiteableSelectListModel({
    String id = '',
    String en = '',
    String th = '',
    int score = 0,
  }) {
    _id = id;
    _en = en;
    _th = th;
    _score = score;
  }

  String get id => _id;
  String get en => _en;
  String get th => _th;
  int get score => _score;

  @override
  SuiteableSelectListModel copyWith(Map<String, dynamic> value) {
    return SuiteableSelectListModel(
      id: value[SuiteableSelectListModelFields.id] ?? _id,
      en: value[SuiteableSelectListModelFields.en] ?? _en,
      th: value[SuiteableSelectListModelFields.th] ?? _th,
      score: value[SuiteableSelectListModelFields.score] ?? _score,
    );
  }
}

class SuiteableSelectListModelFields {
  SuiteableSelectListModelFields._();

  static const String id = 'id';
  static const String en = 'en';
  static const String th = 'th';
  static const String score = 'point';
}

class SuiteableSelectListModelPersistence
    implements ModelJson<SuiteableSelectListModel> {
  @override
  List<SuiteableSelectListModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  SuiteableSelectListModel fromJson(Map<String, dynamic> json) {
    final item = SuiteableSelectListModel(
      id: json[SuiteableSelectListModelFields.id] ?? '',
      en: json[SuiteableSelectListModelFields.en] ?? '',
      th: json[SuiteableSelectListModelFields.th] ?? '',
      score: json[SuiteableSelectListModelFields.score] ?? 0,
    );
    return item;
  }

  @override
  Map<String, dynamic> toJson(SuiteableSelectListModel json) {
    return {
      SuiteableSelectListModelFields.id: json.id,
      SuiteableSelectListModelFields.en: json.en,
      SuiteableSelectListModelFields.th: json.th,
      SuiteableSelectListModelFields.score: json.score,
    };
  }
}
