// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pure_fiat_open_check.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PureFiatOpenCheckRequestImpl _$$PureFiatOpenCheckRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PureFiatOpenCheckRequestImpl(
      idUser: json['id_user'] as String? ?? '',
      paymentType: json['payment_type'] as String? ?? '',
    );

Map<String, dynamic> _$$PureFiatOpenCheckRequestImplToJson(
        _$PureFiatOpenCheckRequestImpl instance) =>
    <String, dynamic>{
      'id_user': instance.idUser,
      'payment_type': instance.paymentType,
    };

_$PureFiatOpenCheckResponseImpl _$$PureFiatOpenCheckResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PureFiatOpenCheckResponseImpl(
      idPureFiat: json['id_purefiat'] as int? ?? 0,
      orderStatus: json['order_status'] as String? ?? '',
      paymentType: json['payment_type'] as String? ?? '',
      refcode: json['refcode'] as String? ?? '',
      paymentQrData: json['payment_qrdata'] as String? ?? '',
      paymentValueActual:
          (json['payment_value_actual'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$PureFiatOpenCheckResponseImplToJson(
        _$PureFiatOpenCheckResponseImpl instance) =>
    <String, dynamic>{
      'id_purefiat': instance.idPureFiat,
      'order_status': instance.orderStatus,
      'payment_type': instance.paymentType,
      'refcode': instance.refcode,
      'payment_qrdata': instance.paymentQrData,
      'payment_value_actual': instance.paymentValueActual,
    };
