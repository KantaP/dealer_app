import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_general_data.m.freezed.dart';
part 'kyc_general_data.m.g.dart';

@freezed
class KycGeneralDataModel with _$KycGeneralDataModel {
  const factory KycGeneralDataModel({
    @Default('') @JsonKey(name: 'user_type') String userType,
    @Default(true) @JsonKey(name: 'is_thai_nationality') bool isThaiNationality,
    @Default('') @JsonKey(name: 'user_risk_type') String userRiskType,
    @Default(0) @JsonKey(name: 'user_risk_score') int userRiskScore,
  }) = _KycGeneralDataModel;

  factory KycGeneralDataModel.fromJson(Map<String, Object?> json) =>
      _$KycGeneralDataModelFromJson(json);
}
