import 'package:aconnec_1109_x/src/model/model.abs.dart';

class PostCodeModel implements Model<PostCodeModel> {
  String _provinceId = "";
  String _districtId = "";
  String _subDistrictId = "";
  String _postCode = "";

  PostCodeModel({
    String provinceId = "",
    String districtId = "",
    String subDistrictId = "",
    String postCode = "",
  }) {
    _provinceId = provinceId;
    _districtId = districtId;
    _subDistrictId = subDistrictId;
    _postCode = postCode;
  }

  String get provinceId => _provinceId;
  String get districtId => _districtId;
  String get subDistrictId => _subDistrictId;
  String get postCode => _postCode;

  @override
  PostCodeModel copyWith(Map<String, dynamic> value) {
    return PostCodeModel(
      postCode: value[PostCodeModelFields.postCode] ?? _postCode,
      districtId: value[PostCodeModelFields.districtId] ?? _districtId,
      subDistrictId: value[PostCodeModelFields.subDistrictId] ?? _subDistrictId,
      provinceId: value[PostCodeModelFields.provinceId] ?? _provinceId,
    );
  }
}

class PostCodeModelFields {
  PostCodeModelFields._();

  static const String provinceId = "PROVINCE_ID";
  static const String districtId = "DISTRICT_ID";
  static const String subDistrictId = "SUB_DISTRICT_ID";
  static const String postCode = "ZIPCODE";
}
