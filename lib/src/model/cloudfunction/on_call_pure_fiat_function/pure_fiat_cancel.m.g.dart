// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pure_fiat_cancel.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PureFiatCancelRequestImpl _$$PureFiatCancelRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PureFiatCancelRequestImpl(
      idPureFiat: json['id_purefiat'] as int? ?? 0,
      cancelReason: json['cancel_reason'] as String? ?? '',
      refcode: json['refcode'] as String? ?? '',
    );

Map<String, dynamic> _$$PureFiatCancelRequestImplToJson(
        _$PureFiatCancelRequestImpl instance) =>
    <String, dynamic>{
      'id_purefiat': instance.idPureFiat,
      'cancel_reason': instance.cancelReason,
      'refcode': instance.refcode,
    };
