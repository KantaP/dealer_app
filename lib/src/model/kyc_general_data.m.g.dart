// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_general_data.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KycGeneralDataModelImpl _$$KycGeneralDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KycGeneralDataModelImpl(
      userType: json['user_type'] as String? ?? '',
      isThaiNationality: json['is_thai_nationality'] as bool? ?? true,
      userRiskType: json['user_risk_type'] as String? ?? '',
      userRiskScore: json['user_risk_score'] as int? ?? 0,
    );

Map<String, dynamic> _$$KycGeneralDataModelImplToJson(
        _$KycGeneralDataModelImpl instance) =>
    <String, dynamic>{
      'user_type': instance.userType,
      'is_thai_nationality': instance.isThaiNationality,
      'user_risk_type': instance.userRiskType,
      'user_risk_score': instance.userRiskScore,
    };
