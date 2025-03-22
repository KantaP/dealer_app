// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trxfiat_proof.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestTrxFiatProofModelImpl _$$RequestTrxFiatProofModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestTrxFiatProofModelImpl(
      idTrxFiat: json['id_trxfiat'] as int,
      paymentValueActual: json['payment_value_actual'] as int,
      paymentProof: json['payment_proof'] as String,
    );

Map<String, dynamic> _$$RequestTrxFiatProofModelImplToJson(
        _$RequestTrxFiatProofModelImpl instance) =>
    <String, dynamic>{
      'id_trxfiat': instance.idTrxFiat,
      'payment_value_actual': instance.paymentValueActual,
      'payment_proof': instance.paymentProof,
    };

_$ResponseTrxFiatProofModelImpl _$$ResponseTrxFiatProofModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseTrxFiatProofModelImpl(
      idTrxFiat: json['id_trxfiat'] as int,
    );

Map<String, dynamic> _$$ResponseTrxFiatProofModelImplToJson(
        _$ResponseTrxFiatProofModelImpl instance) =>
    <String, dynamic>{
      'id_trxfiat': instance.idTrxFiat,
    };
