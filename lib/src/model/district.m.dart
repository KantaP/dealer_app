import 'package:aconnec_1109_x/src/model/model.abs.dart';

class DistrictModel implements Model<DistrictModel> {
  int _districtId = 0;
  int _provinceId = 0;
  String _districtCode = '';
  String _districtName = '';
  String _districtNameEng = '';

  DistrictModel({
    int districtId = 0,
    int provinceId = 0,
    String districtCode = '',
    String districtName = '',
    String districtNameEng = '',
  }) {
    _districtId = districtId;
    _provinceId = provinceId;
    _districtCode = districtCode;
    _districtName = districtName;
    _districtNameEng = districtNameEng;
  }

  int get districtId => _districtId;
  int get provinceId => _provinceId;
  String get districtCode => _districtCode;
  String get districtName => _districtName;
  String get districtNameEng => _districtNameEng;

  @override
  DistrictModel copyWith(Map<String, dynamic> value) {
    return DistrictModel(
      districtId: value[DistrictModelFields.districtId] ?? _districtId,
      provinceId: value[DistrictModelFields.provinceId] ?? _provinceId,
      districtCode: value[DistrictModelFields.districtCode] ?? _districtCode,
      districtName: value[DistrictModelFields.districtName] ?? _districtName,
      districtNameEng:
          value[DistrictModelFields.districtNameEng] ?? _districtNameEng,
    );
  }
}

class DistrictModelFields {
  DistrictModelFields._();

  static const String districtId = 'id';
  static const String provinceId = 'province_id';
  static const String districtName = 'name_th';
  static const String districtCode = 'DISTRICT_CODE';
  static const String districtNameEng = 'name_en';
}
