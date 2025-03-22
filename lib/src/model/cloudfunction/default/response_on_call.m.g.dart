// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_on_call.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseOnCallModelImpl _$$ResponseOnCallModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseOnCallModelImpl(
      status: json['status'] as int? ?? 0,
      result: json['result'] as Map<String, dynamic>? ?? null,
    );

Map<String, dynamic> _$$ResponseOnCallModelImplToJson(
        _$ResponseOnCallModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
