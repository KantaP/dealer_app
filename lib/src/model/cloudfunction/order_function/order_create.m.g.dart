// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_create.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOrderCreateModelImpl _$$RequestOrderCreateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOrderCreateModelImpl(
      digitalAssetPrice:
          (json['digitalasset_price_set'] as num?)?.toDouble() ?? 0,
      listedPair: json['listed_pair'] as String? ?? '',
      orderSide: json['order_side'] as String? ?? '',
      orderValueFiatSet:
          (json['order_value_fiat_set'] as num?)?.toDouble() ?? 0,
      orderValueCryptoSet:
          (json['order_value_crypto_set'] as num?)?.toDouble() ?? 0,
      bankAccountNo: json['bankaccount_no'] as String? ?? '',
      walletAdress: json['wallet_address'] as String? ?? '',
      digitalAssetType: json['digitalasset_type'] as String? ?? '',
      digitalAssetFeeSet:
          (json['digitalasset_fee_set'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$RequestOrderCreateModelImplToJson(
        _$RequestOrderCreateModelImpl instance) =>
    <String, dynamic>{
      'digitalasset_price_set': instance.digitalAssetPrice,
      'listed_pair': instance.listedPair,
      'order_side': instance.orderSide,
      'order_value_fiat_set': instance.orderValueFiatSet,
      'order_value_crypto_set': instance.orderValueCryptoSet,
      'bankaccount_no': instance.bankAccountNo,
      'wallet_address': instance.walletAdress,
      'digitalasset_type': instance.digitalAssetType,
      'digitalasset_fee_set': instance.digitalAssetFeeSet,
    };

_$ResponseOrderCreateModelImpl _$$ResponseOrderCreateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseOrderCreateModelImpl(
      idOrder: json['id_order'] as int? ?? 0,
      refcode: json['refcode'] as String? ?? '',
    );

Map<String, dynamic> _$$ResponseOrderCreateModelImplToJson(
        _$ResponseOrderCreateModelImpl instance) =>
    <String, dynamic>{
      'id_order': instance.idOrder,
      'refcode': instance.refcode,
    };
