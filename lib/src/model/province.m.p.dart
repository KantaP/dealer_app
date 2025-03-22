import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/province.m.dart';

class ProvinceModelPersistence implements ModelJson<ProvinceModel> {
  @override
  List<ProvinceModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  ProvinceModel fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
      geoId: json[ProvinceModelFields.geoId] ?? 0,
      provinceId: json[ProvinceModelFields.provinceId] ?? 0,
      provinceName: json[ProvinceModelFields.provinceName] ?? '',
      provinceCode: json[ProvinceModelFields.provinceCode] ?? '',
      provinceNameEng: json[ProvinceModelFields.provinceNameEng] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(ProvinceModel json) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
