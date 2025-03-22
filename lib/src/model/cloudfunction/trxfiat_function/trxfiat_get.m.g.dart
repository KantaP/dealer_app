// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trxfiat_get.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseTrxFiatGetModelImpl _$$ResponseTrxFiatGetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseTrxFiatGetModelImpl(
      idTrxFiat: json['id_trxfiat'] as int? ?? 0,
      idOrder: json['id_order'] as int? ?? 0,
      digitalAssetPriceSet:
          (json['digitalasset_price_set'] as num?)?.toDouble() ?? 0,
      digitalAssetPriceActual:
          (json['digitalasset_price_actual'] as num?)?.toDouble() ?? 0,
      datetimeCreate: json['datetime_create'] as String? ?? '',
      datetimePayment: json['datetime_payment'] as String? ?? '',
      datetimeComplete: json['datetime_complete'] as String? ?? '',
      orderSide: json['order_side'] as String? ?? '',
      paymentChannel: json['payment_channel'] as String? ?? '',
      paymentAutoSettle: json['payment_autosettle'] as bool? ?? true,
      paymentCallbackLog: json['payment_callbacklog'] as String? ?? '',
      paymentValueSet: (json['payment_value_set'] as num?)?.toDouble() ?? 0,
      paymentValueActual:
          (json['payment_value_actual'] as num?)?.toDouble() ?? 0,
      paymentValueFee: (json['payment_value_fee'] as num?)?.toDouble() ?? 0,
      paymentAccountSrcActual:
          json['payment_account_src_actual'] as String? ?? '',
      paymentAccountDesActual:
          json['payment_account_des_actual'] as String? ?? '',
      paymentCurrency: json['payment_currency'] as String? ?? '',
      paymentProof: json['payment_proof'] as String? ?? '',
      status: json['status'] as String? ?? '',
      flagMessage: json['flag_message'] as String? ?? '',
      isNeedAudit: json['is_needaudit'] as bool? ?? true,
      isNeedApprove: json['is_needapprove'] as bool? ?? true,
      isAudited: json['is_audited'] as bool? ?? true,
      auditor: json['auditor'] as String? ?? '',
      auditDatetime: json['audit_datetime'] as String? ?? '',
      isApprove: json['is_approved'] as bool? ?? false,
      approver: json['approver'] as String? ?? '',
      approveDatetime: json['approve_datetime'] as String? ?? '',
      payer: json['payer'] as String? ?? '',
      cancelReason: json['cancel_reason'] as String? ?? '',
    );

Map<String, dynamic> _$$ResponseTrxFiatGetModelImplToJson(
        _$ResponseTrxFiatGetModelImpl instance) =>
    <String, dynamic>{
      'id_trxfiat': instance.idTrxFiat,
      'id_order': instance.idOrder,
      'digitalasset_price_set': instance.digitalAssetPriceSet,
      'digitalasset_price_actual': instance.digitalAssetPriceActual,
      'datetime_create': instance.datetimeCreate,
      'datetime_payment': instance.datetimePayment,
      'datetime_complete': instance.datetimeComplete,
      'order_side': instance.orderSide,
      'payment_channel': instance.paymentChannel,
      'payment_autosettle': instance.paymentAutoSettle,
      'payment_callbacklog': instance.paymentCallbackLog,
      'payment_value_set': instance.paymentValueSet,
      'payment_value_actual': instance.paymentValueActual,
      'payment_value_fee': instance.paymentValueFee,
      'payment_account_src_actual': instance.paymentAccountSrcActual,
      'payment_account_des_actual': instance.paymentAccountDesActual,
      'payment_currency': instance.paymentCurrency,
      'payment_proof': instance.paymentProof,
      'status': instance.status,
      'flag_message': instance.flagMessage,
      'is_needaudit': instance.isNeedAudit,
      'is_needapprove': instance.isNeedApprove,
      'is_audited': instance.isAudited,
      'auditor': instance.auditor,
      'audit_datetime': instance.auditDatetime,
      'is_approved': instance.isApprove,
      'approver': instance.approver,
      'approve_datetime': instance.approveDatetime,
      'payer': instance.payer,
      'cancel_reason': instance.cancelReason,
    };
