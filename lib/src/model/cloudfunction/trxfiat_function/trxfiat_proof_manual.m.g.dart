// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trxfiat_proof_manual.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestTrxFiatProofManualModelImpl
    _$$RequestTrxFiatProofManualModelImplFromJson(Map<String, dynamic> json) =>
        _$RequestTrxFiatProofManualModelImpl(
          idTrxFiat: json['id_trxfiat'] as int,
          paymentProof: json['payment_proof'] as String,
          datetimePayment: json['datetime_payment'] as String,
          refCode: json['refcode'] as String,
          paymentValueActual: json['payment_value_actual'] as int? ?? 0,
          paymentAccountSrcActual:
              json['payment_account_src_actual'] as String? ?? '',
        );

Map<String, dynamic> _$$RequestTrxFiatProofManualModelImplToJson(
        _$RequestTrxFiatProofManualModelImpl instance) =>
    <String, dynamic>{
      'id_trxfiat': instance.idTrxFiat,
      'payment_proof': instance.paymentProof,
      'datetime_payment': instance.datetimePayment,
      'refcode': instance.refCode,
      'payment_value_actual': instance.paymentValueActual,
      'payment_account_src_actual': instance.paymentAccountSrcActual,
    };

_$ResponseTrxFiatProofManualModelImpl
    _$$ResponseTrxFiatProofManualModelImplFromJson(Map<String, dynamic> json) =>
        _$ResponseTrxFiatProofManualModelImpl(
          idTrxFiat: json['id_trxfiat'] as int,
        );

Map<String, dynamic> _$$ResponseTrxFiatProofManualModelImplToJson(
        _$ResponseTrxFiatProofManualModelImpl instance) =>
    <String, dynamic>{
      'id_trxfiat': instance.idTrxFiat,
    };
