// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_get.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOrderGetModelImpl _$$RequestOrderGetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOrderGetModelImpl(
      idOrder: json['id_order'] as int,
      ref: json['refcode'] as String,
    );

Map<String, dynamic> _$$RequestOrderGetModelImplToJson(
        _$RequestOrderGetModelImpl instance) =>
    <String, dynamic>{
      'id_order': instance.idOrder,
      'refcode': instance.ref,
    };

_$ResponseOrderGetModelImpl _$$ResponseOrderGetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseOrderGetModelImpl(
      idOrder: json['id_order'] as int? ?? 0,
      idUser: json['id_user'] as String? ?? '',
      digitalassetPrice: (json['digitalasset_price'] as num?)?.toDouble() ?? 0,
      digitalassetPriceActual:
          (json['digitalasset_price_actual'] as num?)?.toDouble() ?? 0,
      listedPair: json['listed_pair'] as String? ?? '',
      topayExpireTime: json['topay_expire_time'] as int? ?? 0,
      datetimeCreate: json['datetime_create'] as String? ?? '',
      datetimePayment: json['datetime_payment'] as String? ?? '',
      datetimeComplete: json['datetime_complete'] as String? ?? '',
      orderSide: json['order_side'] as String? ?? '',
      orderValueFiatSet:
          (json['order_value_fiat_set'] as num?)?.toDouble() ?? 0,
      orderValueCryptoSet:
          (json['order_value_crypto_set'] as num?)?.toDouble() ?? 0,
      bankAccountNo: json['bankaccount_no'] as String? ?? '',
      walletAddress: json['wallet_address'] as String? ?? '',
      status: json['status'] as String? ?? '',
      cancelReason: json['cancel_reason'] as String? ?? '',
      refCode: json['refcode'] as String? ?? '',
      datetimeRefcode: json['datetime_refcode'] as String? ?? '',
      digitalassetType: json['digitalasset_type'] as String? ?? '',
      digitalAssetPriceSet:
          (json['digitalasset_price_set'] as num?)?.toDouble() ?? 0,
      digitalAssetFeeSet:
          (json['digitalasset_fee_set'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$ResponseOrderGetModelImplToJson(
        _$ResponseOrderGetModelImpl instance) =>
    <String, dynamic>{
      'id_order': instance.idOrder,
      'id_user': instance.idUser,
      'digitalasset_price': instance.digitalassetPrice,
      'digitalasset_price_actual': instance.digitalassetPriceActual,
      'listed_pair': instance.listedPair,
      'topay_expire_time': instance.topayExpireTime,
      'datetime_create': instance.datetimeCreate,
      'datetime_payment': instance.datetimePayment,
      'datetime_complete': instance.datetimeComplete,
      'order_side': instance.orderSide,
      'order_value_fiat_set': instance.orderValueFiatSet,
      'order_value_crypto_set': instance.orderValueCryptoSet,
      'bankaccount_no': instance.bankAccountNo,
      'wallet_address': instance.walletAddress,
      'status': instance.status,
      'cancel_reason': instance.cancelReason,
      'refcode': instance.refCode,
      'datetime_refcode': instance.datetimeRefcode,
      'digitalasset_type': instance.digitalassetType,
      'digitalasset_price_set': instance.digitalAssetPriceSet,
      'digitalasset_fee_set': instance.digitalAssetFeeSet,
    };
