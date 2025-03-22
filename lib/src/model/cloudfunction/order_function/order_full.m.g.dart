// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_full.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOrderFullModelImpl _$$RequestOrderFullModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOrderFullModelImpl(
      idOrder: json['id_order'] as int,
      ref: json['refcode'] as String,
    );

Map<String, dynamic> _$$RequestOrderFullModelImplToJson(
        _$RequestOrderFullModelImpl instance) =>
    <String, dynamic>{
      'id_order': instance.idOrder,
      'refcode': instance.ref,
    };

_$ResponseOrderFullModelImpl _$$ResponseOrderFullModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseOrderFullModelImpl(
      order: json['order'] == null
          ? null
          : ResponseOrderGetModel.fromJson(
              json['order'] as Map<String, dynamic>),
      trxfiat: json['trxfiat'] == null
          ? null
          : ResponseTrxFiatGetModel.fromJson(
              json['trxfiat'] as Map<String, dynamic>),
      trxdigitalasset: json['trxdigitalasset'] == null
          ? null
          : ResponseTrxDigitalAssetGetModel.fromJson(
              json['trxdigitalasset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseOrderFullModelImplToJson(
        _$ResponseOrderFullModelImpl instance) =>
    <String, dynamic>{
      'order': instance.order?.toJson(),
      'trxfiat': instance.trxfiat?.toJson(),
      'trxdigitalasset': instance.trxdigitalasset?.toJson(),
    };
