// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_bay_qr.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BayQrResponseModelImpl _$$BayQrResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BayQrResponseModelImpl(
      amount: json['amount'] as String? ?? '',
      content: json['content'] as String? ?? '',
      channel: json['channel'] as String? ?? '',
      bizMchId: json['bizMchId'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      success: json['success'] as bool? ?? false,
      ref1: json['ref1'] as String? ?? '',
      ref2: json['ref2'] as String? ?? '',
      billerId: json['billerId'] as String? ?? '',
      terminalId: json['terminalId'] as String? ?? '',
    );

Map<String, dynamic> _$$BayQrResponseModelImplToJson(
        _$BayQrResponseModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'content': instance.content,
      'channel': instance.channel,
      'bizMchId': instance.bizMchId,
      'remark': instance.remark,
      'success': instance.success,
      'ref1': instance.ref1,
      'ref2': instance.ref2,
      'billerId': instance.billerId,
      'terminalId': instance.terminalId,
    };
