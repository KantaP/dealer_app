// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_update_amlo_status.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseUpdateAmloStatusModelImpl
    _$$ResponseUpdateAmloStatusModelImplFromJson(Map<String, dynamic> json) =>
        _$ResponseUpdateAmloStatusModelImpl(
          status: json['amlo_status'] as bool? ?? false,
          message: json['message'] as String? ?? '',
          code: json['code'] as int? ?? 0,
        );

Map<String, dynamic> _$$ResponseUpdateAmloStatusModelImplToJson(
        _$ResponseUpdateAmloStatusModelImpl instance) =>
    <String, dynamic>{
      'amlo_status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
