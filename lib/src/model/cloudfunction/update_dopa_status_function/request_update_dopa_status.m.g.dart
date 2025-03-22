// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_update_dopa_status.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestUpdateDopaStatusModelImpl _$$RequestUpdateDopaStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestUpdateDopaStatusModelImpl(
      pid: json['pid'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDay: json['birthDay'] as String,
      laser: json['laser'] as String,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$$RequestUpdateDopaStatusModelImplToJson(
        _$RequestUpdateDopaStatusModelImpl instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDay': instance.birthDay,
      'laser': instance.laser,
      'uid': instance.uid,
    };
