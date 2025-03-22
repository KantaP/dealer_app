import 'package:aconnec_1109_x/src/model/district.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class DistrictsModelPersistence implements ModelJson<DistrictModel> {
  @override
  List<DistrictModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  DistrictModel fromJson(Map<String, dynamic> json) {
    return DistrictModel(
      districtId: json[DistrictModelFields.districtId] ?? 0,
      provinceId: json[DistrictModelFields.provinceId] ?? 0,
      districtCode: json[DistrictModelFields.districtCode] ?? '',
      districtName: json[DistrictModelFields.districtName] ?? '',
      districtNameEng: json[DistrictModelFields.districtNameEng] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(DistrictModel json) {
    return <String, dynamic>{
      DistrictModelFields.districtId: json.districtId,
      DistrictModelFields.provinceId: json.provinceId,
      DistrictModelFields.districtCode: json.districtCode,
      DistrictModelFields.districtName: json.districtName,
      DistrictModelFields.districtNameEng: json.districtNameEng,
    };
  }
}
