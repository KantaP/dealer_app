// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_statement.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestStatementModelImpl _$$RequestStatementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestStatementModelImpl(
      channel: json['channel'] as String? ?? '',
      fromDate: json['fromDate'] as String? ?? '',
      toDate: json['toDate'] as String? ?? '',
      userId: json['userid'] as String? ?? '',
      requestDate: json['request_date'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$RequestStatementModelImplToJson(
        _$RequestStatementModelImpl instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'userid': instance.userId,
      'request_date': instance.requestDate,
      'email': instance.email,
    };
