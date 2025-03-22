// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_check.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOpenCheckModelImpl _$$RequestOpenCheckModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOpenCheckModelImpl(
      idUser: json['id_user'] as String,
    );

Map<String, dynamic> _$$RequestOpenCheckModelImplToJson(
        _$RequestOpenCheckModelImpl instance) =>
    <String, dynamic>{
      'id_user': instance.idUser,
    };

_$ResponseOpenCheckModelImpl _$$ResponseOpenCheckModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseOpenCheckModelImpl(
      idOrder: json['id_order'] as int? ?? 0,
      orderStatus: json['order_status'] as String? ?? '',
      orderSide: json['order_side'] as String? ?? '',
      refcode: json['refcode'] as String? ?? '',
    );

Map<String, dynamic> _$$ResponseOpenCheckModelImplToJson(
        _$ResponseOpenCheckModelImpl instance) =>
    <String, dynamic>{
      'id_order': instance.idOrder,
      'order_status': instance.orderStatus,
      'order_side': instance.orderSide,
      'refcode': instance.refcode,
    };
