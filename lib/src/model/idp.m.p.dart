import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class IdpModelPersistence implements ModelJson<IdpModel> {
  @override
  List<IdpModel> fromArrayJson(List<dynamic> arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  IdpModel fromJson(Map<String, dynamic> json) {
    return IdpModel(
      code: json[IdpModelFields.code] ?? '',
      name: json[IdpModelFields.name] ?? '',
      id: json[IdpModelFields.id] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(IdpModel json) {
    return <String, dynamic>{
      IdpModelFields.code: json.code,
      IdpModelFields.name: json.name,
      IdpModelFields.id: json.id,
    };
  }
}
