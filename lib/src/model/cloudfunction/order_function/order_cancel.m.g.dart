// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cancel.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOrderCancelModelImpl _$$RequestOrderCancelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOrderCancelModelImpl(
      idOrder: json['id_order'] as int,
      cancelReason: json['cancel_reason'] as String,
      ref: json['refcode'] as String,
    );

Map<String, dynamic> _$$RequestOrderCancelModelImplToJson(
        _$RequestOrderCancelModelImpl instance) =>
    <String, dynamic>{
      'id_order': instance.idOrder,
      'cancel_reason': instance.cancelReason,
      'refcode': instance.ref,
    };

_$ResponseOrderCancelModelImpl _$$ResponseOrderCancelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseOrderCancelModelImpl(
      idOrder: json['id_order'] as int,
    );

Map<String, dynamic> _$$ResponseOrderCancelModelImplToJson(
        _$ResponseOrderCancelModelImpl instance) =>
    <String, dynamic>{
      'id_order': instance.idOrder,
    };
