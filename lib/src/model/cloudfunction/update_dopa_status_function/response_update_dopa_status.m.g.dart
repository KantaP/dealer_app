// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_update_dopa_status.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseUpdateDopaStatusModelImpl
    _$$ResponseUpdateDopaStatusModelImplFromJson(Map<String, dynamic> json) =>
        _$ResponseUpdateDopaStatusModelImpl(
          result: ResponseUpdateDopaStatusResult.fromJson(
              json['result'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ResponseUpdateDopaStatusModelImplToJson(
        _$ResponseUpdateDopaStatusModelImpl instance) =>
    <String, dynamic>{
      'result': instance.result.toJson(),
    };

_$ResponseUpdateDopaStatusResultImpl
    _$$ResponseUpdateDopaStatusResultImplFromJson(Map<String, dynamic> json) =>
        _$ResponseUpdateDopaStatusResultImpl(
          dopaCheckStatus: json['dopa_check_status'] as bool? ?? false,
        );

Map<String, dynamic> _$$ResponseUpdateDopaStatusResultImplToJson(
        _$ResponseUpdateDopaStatusResultImpl instance) =>
    <String, dynamic>{
      'dopa_check_status': instance.dopaCheckStatus,
    };
