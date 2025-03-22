import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/sub_district.m.dart';

class SubDistrictModelPersistence implements ModelJson<SubDistrictModel> {
  @override
  List<SubDistrictModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  SubDistrictModel fromJson(Map<String, dynamic> json) {
    return SubDistrictModel(
      subDistrictId: json[SubDistrictModelFields.subDistrictId] ?? 0,
      subDistrictCode: json[SubDistrictModelFields.subDistrictCode] ?? '',
      subDistrictName: json[SubDistrictModelFields.subDistrictName] ?? '',
      districtId: json[SubDistrictModelFields.districtId] ?? 0,
      provinceId: json[SubDistrictModelFields.provinceId] ?? 0,
      zipCode: json[SubDistrictModelFields.zipCode] ?? 0,
      subDistrictNameEng: json[SubDistrictModelFields.subDistrictNameEng] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(SubDistrictModel json) {
    return <String, dynamic>{
      SubDistrictModelFields.subDistrictId: json.subDistrictId,
      SubDistrictModelFields.subDistrictCode: json.subDistrictCode,
      SubDistrictModelFields.subDistrictName: json.subDistrictName,
      SubDistrictModelFields.districtId: json.districtId,
      SubDistrictModelFields.provinceId: json.provinceId,
      SubDistrictModelFields.zipCode: json.zipCode,
      SubDistrictModelFields.subDistrictNameEng: json.subDistrictNameEng,
    };
  }
}
