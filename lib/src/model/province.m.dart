import 'package:aconnec_1109_x/src/model/model.abs.dart';

class ProvinceModel implements Model<ProvinceModel> {
  int _geoId = 0;
  int _provinceId = 0;
  String _provinceName = '';
  String _provinceCode = '';
  String _provinceNameEng = '';

  ProvinceModel({
    int geoId = 0,
    int provinceId = 0,
    String provinceName = '',
    String provinceCode = '',
    String provinceNameEng = '',
  }) {
    _geoId = geoId;
    _provinceId = provinceId;
    _provinceName = provinceName;
    _provinceCode = provinceCode;
    _provinceNameEng = provinceNameEng;
  }

  int get geoId => _geoId;
  int get provinceId => _provinceId;
  String get provinceName => _provinceName;
  String get provinceCode => _provinceCode;
  String get provinceNameEng => _provinceNameEng;

  @override
  ProvinceModel copyWith(Map<String, dynamic> value) {
    return ProvinceModel(
      geoId: value[ProvinceModelFields.geoId] ?? _geoId,
      provinceId: value[ProvinceModelFields.provinceId] ?? _provinceId,
      provinceName: value[ProvinceModelFields.provinceName] ?? _provinceName,
      provinceCode: value[ProvinceModelFields.provinceCode] ?? _provinceCode,
      provinceNameEng:
          value[ProvinceModelFields.provinceNameEng] ?? _provinceNameEng,
    );
  }
}

class ProvinceModelFields {
  ProvinceModelFields._();

  static const String geoId = 'geography_id';
  static const String provinceId = 'id';
  static const String provinceName = 'name_th';
  static const String provinceNameEng = 'name_en';
  static const String provinceCode = 'PROVINCE_CODE';
}
