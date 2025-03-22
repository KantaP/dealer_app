import 'package:aconnec_1109_x/src/model/model.abs.dart';

class KycGeneralDataModel implements Model<KycGeneralDataModel> {
  String _userType = '';
  bool _isThaiNationality = true;
  String _userRiskType = '';

  KycGeneralDataModel({
    String userType = '',
    bool isThaiNationality = true,
    String userRiskType = '',
  }) {
    _userType = userType;
    _isThaiNationality = isThaiNationality;
    _userRiskType = userRiskType;
  }

  bool get isThaiNationality => _isThaiNationality;
  String get userType => _userType;
  String get userRiskType => _userRiskType;

  @override
  KycGeneralDataModel copyWith(Map<String, dynamic> value) {
    return KycGeneralDataModel(
      userType: value[KycGeneralDataModelFields.userType] ?? _userType,
      isThaiNationality: value[KycGeneralDataModelFields.isThaiNationality] ??
          _isThaiNationality,
      userRiskType:
          value[KycGeneralDataModelFields.userRiskType] ?? _userRiskType,
    );
  }
}

class KycGeneralDataModelFields {
  KycGeneralDataModelFields._();

  static const String userType = 'user_type';
  static const String isThaiNationality = 'is_thai_nationality';
  static const String userRiskType = 'user_risk_type';
}

class KycGeneralDataModelPersistence implements ModelJson<KycGeneralDataModel> {
  @override
  List<KycGeneralDataModel> fromArrayJson(List arrJson) {
    return [];
  }

  @override
  KycGeneralDataModel fromJson(Map<String, dynamic> json) {
    return KycGeneralDataModel(
      userType: json[KycGeneralDataModelFields.userType] ?? '',
      isThaiNationality:
          json[KycGeneralDataModelFields.isThaiNationality] ?? true,
      userRiskType: json[KycGeneralDataModelFields.userRiskType] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(KycGeneralDataModel json) {
    return {
      KycGeneralDataModelFields.userType: json.userType,
      KycGeneralDataModelFields.isThaiNationality: json.isThaiNationality,
      KycGeneralDataModelFields.userRiskType: json.userRiskType,
    };
  }
}
