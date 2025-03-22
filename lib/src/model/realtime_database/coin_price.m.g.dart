// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_price.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoinPriceModelImpl _$$CoinPriceModelImplFromJson(Map<String, dynamic> json) =>
    _$CoinPriceModelImpl(
      buy: (json['buy'] as num?)?.toDouble() ?? 0,
      sell: (json['sell'] as num?)?.toDouble() ?? 0,
      symbol: json['symbol'] as String? ?? '',
      fee: (json['fee'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CoinPriceModelImplToJson(
        _$CoinPriceModelImpl instance) =>
    <String, dynamic>{
      'buy': instance.buy,
      'sell': instance.sell,
      'symbol': instance.symbol,
      'fee': instance.fee,
    };
