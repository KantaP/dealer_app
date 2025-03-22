import 'package:aconnec_1109_x/src/model/model.abs.dart';

class SubDistrictModel implements Model<SubDistrictModel> {
  int _subDistrictId = 0;
  int _districtId = 0;
  int _provinceId = 0;
  String _subDistrictCode = '';
  String _subDistrictName = '';
  String _subDistrictNameEng = '';
  int _zipCode = 0;

  SubDistrictModel({
    int subDistrictId = 0,
    int districtId = 0,
    int provinceId = 0,
    String subDistrictCode = '',
    String subDistrictName = '',
    String subDistrictNameEng = '',
    int zipCode = 0,
  }) {
    _subDistrictCode = subDistrictCode;
    _subDistrictName = subDistrictName;
    _districtId = districtId;
    _provinceId = provinceId;
    _subDistrictId = subDistrictId;
    _subDistrictNameEng = subDistrictNameEng;
    _zipCode = zipCode;
  }

  int get districtId => _districtId;
  int get subDistrictId => _subDistrictId;
  int get provinceId => _provinceId;
  String get subDistrictName => _subDistrictName;
  String get subDistrictCode => _subDistrictCode;
  String get subDistrictNameEng => _subDistrictNameEng;
  int get zipCode => _zipCode;

  @override
  SubDistrictModel copyWith(Map<String, dynamic> value) {
    return SubDistrictModel(
      subDistrictId:
          value[SubDistrictModelFields.subDistrictId] ?? _subDistrictId,
      subDistrictCode:
          value[SubDistrictModelFields.subDistrictCode] ?? _subDistrictCode,
      subDistrictName:
          value[SubDistrictModelFields.subDistrictName] ?? _subDistrictName,
      districtId: value[SubDistrictModelFields.districtId] ?? _districtId,
      provinceId: value[SubDistrictModelFields.provinceId] ?? _provinceId,
      zipCode: value[SubDistrictModelFields.zipCode] ?? _zipCode,
      subDistrictNameEng: value[SubDistrictModelFields.subDistrictNameEng] ??
          _subDistrictNameEng,
    );
  }
}

class SubDistrictModelFields {
  SubDistrictModelFields._();

  static const String subDistrictId = 'id';
  static const String subDistrictCode = 'SUB_DISTRICT_CODE';
  static const String subDistrictName = 'name_th';
  static const String districtId = 'amphure_id';
  static const String provinceId = 'PROVINCE_ID';
  static const String subDistrictNameEng = 'name_en';
  static const String zipCode = 'zip_code';
}
