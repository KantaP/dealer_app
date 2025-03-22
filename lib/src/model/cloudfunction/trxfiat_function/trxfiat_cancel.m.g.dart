// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trxfiat_cancel.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestTrxFiatCancelModelImpl _$$RequestTrxFiatCancelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestTrxFiatCancelModelImpl(
      idTrxFiat: json['id_trxfiat'] as int,
      cancelReason: json['cancel_reason'] as String,
    );

Map<String, dynamic> _$$RequestTrxFiatCancelModelImplToJson(
        _$RequestTrxFiatCancelModelImpl instance) =>
    <String, dynamic>{
      'id_trxfiat': instance.idTrxFiat,
      'cancel_reason': instance.cancelReason,
    };

_$ResponseTrxFiatCancelModelImpl _$$ResponseTrxFiatCancelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseTrxFiatCancelModelImpl(
      idTrxFiat: json['id_trxfiat'] as int,
    );

Map<String, dynamic> _$$ResponseTrxFiatCancelModelImplToJson(
        _$ResponseTrxFiatCancelModelImpl instance) =>
    <String, dynamic>{
      'id_trxfiat': instance.idTrxFiat,
    };
