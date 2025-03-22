// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_deposit_wallet.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestGetDepositWalletModelImpl _$$RequestGetDepositWalletModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestGetDepositWalletModelImpl(
      digitalAssetSymbol: json['digitalasset_symbol'] as String,
    );

Map<String, dynamic> _$$RequestGetDepositWalletModelImplToJson(
        _$RequestGetDepositWalletModelImpl instance) =>
    <String, dynamic>{
      'digitalasset_symbol': instance.digitalAssetSymbol,
    };

_$ResponseGetDepositWalletModelImpl
    _$$ResponseGetDepositWalletModelImplFromJson(Map<String, dynamic> json) =>
        _$ResponseGetDepositWalletModelImpl(
          depositAddress: json['deposit_address'] as String? ?? '',
          paymentChannel: json['payment_channel'] as String? ?? '',
        );

Map<String, dynamic> _$$ResponseGetDepositWalletModelImplToJson(
        _$ResponseGetDepositWalletModelImpl instance) =>
    <String, dynamic>{
      'deposit_address': instance.depositAddress,
      'payment_channel': instance.paymentChannel,
    };
