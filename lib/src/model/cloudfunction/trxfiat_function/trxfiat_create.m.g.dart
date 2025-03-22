// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trxfiat_create.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestTrxFiatCreateModelImpl _$$RequestTrxFiatCreateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestTrxFiatCreateModelImpl(
      idOrder: json['id_order'] as int,
      paymentChannel: json['payment_channel'] as String,
      paymentAutoSettle: json['payment_autosettle'] as bool,
      paymentValueSet: (json['payment_value_set'] as num).toDouble(),
      paymentValueAcutal: (json['payment_value_actual'] as num).toDouble(),
      paymentValueFee: (json['payment_value_fee'] as num).toDouble(),
      paymentCurrency: json['payment_currency'] as String,
      paymentAccountSrcActual: json['payment_account_src_actual'] as String,
      paymentAccountDesActual:
          json['payment_account_des_actual'] as String? ?? '',
      isNeedAudit: json['is_needaudit'] as bool,
      isNeedApprove: json['is_needapprove'] as bool,
      refcode: json['refcode'] as String,
    );

Map<String, dynamic> _$$RequestTrxFiatCreateModelImplToJson(
        _$RequestTrxFiatCreateModelImpl instance) =>
    <String, dynamic>{
      'id_order': instance.idOrder,
      'payment_channel': instance.paymentChannel,
      'payment_autosettle': instance.paymentAutoSettle,
      'payment_value_set': instance.paymentValueSet,
      'payment_value_actual': instance.paymentValueAcutal,
      'payment_value_fee': instance.paymentValueFee,
      'payment_currency': instance.paymentCurrency,
      'payment_account_src_actual': instance.paymentAccountSrcActual,
      'payment_account_des_actual': instance.paymentAccountDesActual,
      'is_needaudit': instance.isNeedAudit,
      'is_needapprove': instance.isNeedApprove,
      'refcode': instance.refcode,
    };

_$ResponseTrxFiatCreateModelImpl _$$ResponseTrxFiatCreateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseTrxFiatCreateModelImpl(
      idTrxFiat: json['id_trxfiat'] as int,
    );

Map<String, dynamic> _$$ResponseTrxFiatCreateModelImplToJson(
        _$ResponseTrxFiatCreateModelImpl instance) =>
    <String, dynamic>{
      'id_trxfiat': instance.idTrxFiat,
    };
