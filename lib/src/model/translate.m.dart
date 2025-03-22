import 'package:aconnec_1109_x/src/model/model.abs.dart';

class TranslateModel implements Model<TranslateModel> {
  String _th = "";
  String _en = "";

  TranslateModel({
    String th = "",
    String en = "",
  }) {
    _th = th;
    _en = en;
  }

  String get th => _th;
  String get en => _en;

  @override
  TranslateModel copyWith(Map<String, dynamic> value) {
    return TranslateModel(
      th: value[TranslateModelFields.th] ?? _th,
      en: value[TranslateModelFields.en] ?? _en,
    );
  }
}

class TranslateModelFields {
  TranslateModelFields._();

  static const String th = "th";
  static const String en = "en";
}
