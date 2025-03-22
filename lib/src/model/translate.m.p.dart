import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/translate.m.dart';

class TranslateModelPersistence implements ModelJson<TranslateModel> {
  @override
  List<TranslateModel> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  TranslateModel fromJson(Map<String, dynamic> json) {
    return TranslateModel(
      en: json[TranslateModelFields.en],
      th: json[TranslateModelFields.th],
    );
  }

  @override
  Map<String, dynamic> toJson(TranslateModel json) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
