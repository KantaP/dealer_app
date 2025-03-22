// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trxdigitalasset_create.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestTrxDigitalAssetCreateModelImpl
    _$$RequestTrxDigitalAssetCreateModelImplFromJson(
            Map<String, dynamic> json) =>
        _$RequestTrxDigitalAssetCreateModelImpl(
          idOrder: json['id_order'] as int,
          paymentChannel: json['payment_channel'] as String,
          paymentAutoSettle: json['payment_autosettle'] as bool,
          paymentValueSet: (json['payment_value_set'] as num).toDouble(),
          paymentValueAcutal: (json['payment_value_actual'] as num).toDouble(),
          paymentValueFee: (json['payment_value_fee'] as num).toDouble(),
          paymentCurrency: json['payment_currency'] as String,
          paymentAccountDesActual: json['payment_wallet_des_actual'] as String,
          isNeedAudit: json['is_needaudit'] as bool,
          isNeedApprove: json['is_needapprove'] as bool,
          refcode: json['refcode'] as String,
        );

Map<String, dynamic> _$$RequestTrxDigitalAssetCreateModelImplToJson(
        _$RequestTrxDigitalAssetCreateModelImpl instance) =>
    <String, dynamic>{
      'id_order': instance.idOrder,
      'payment_channel': instance.paymentChannel,
      'payment_autosettle': instance.paymentAutoSettle,
      'payment_value_set': instance.paymentValueSet,
      'payment_value_actual': instance.paymentValueAcutal,
      'payment_value_fee': instance.paymentValueFee,
      'payment_currency': instance.paymentCurrency,
      'payment_wallet_des_actual': instance.paymentAccountDesActual,
      'is_needaudit': instance.isNeedAudit,
      'is_needapprove': instance.isNeedApprove,
      'refcode': instance.refcode,
    };

_$ResponseTrxDigitalAssetCreateModelImpl
    _$$ResponseTrxDigitalAssetCreateModelImplFromJson(
            Map<String, dynamic> json) =>
        _$ResponseTrxDigitalAssetCreateModelImpl(
          idTrxDigitalAsset: json['id_trxdigitalasset'] as int,
        );

Map<String, dynamic> _$$ResponseTrxDigitalAssetCreateModelImplToJson(
        _$ResponseTrxDigitalAssetCreateModelImpl instance) =>
    <String, dynamic>{
      'id_trxdigitalasset': instance.idTrxDigitalAsset,
    };
