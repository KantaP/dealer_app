// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bay_qr_request.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BayQrRequestModelImpl _$$BayQrRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BayQrRequestModelImpl(
      ref1: json['ref1'] as String? ?? '',
      ref2: json['ref2'] as String? ?? '',
      amount: json['amount'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      type: json['type'] as String? ?? '',
      terminalId: json['terminalId'] as String? ?? '',
    );

Map<String, dynamic> _$$BayQrRequestModelImplToJson(
        _$BayQrRequestModelImpl instance) =>
    <String, dynamic>{
      'ref1': instance.ref1,
      'ref2': instance.ref2,
      'amount': instance.amount,
      'remark': instance.remark,
      'type': instance.type,
      'terminalId': instance.terminalId,
    };
