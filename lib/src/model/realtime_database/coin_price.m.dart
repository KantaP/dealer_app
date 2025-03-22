import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_price.m.freezed.dart';
part 'coin_price.m.g.dart';

@freezed
class CoinPriceModel with _$CoinPriceModel {
  const CoinPriceModel._();

  const factory CoinPriceModel({
    @JsonKey(name: 'buy') @Default(0) double buy,
    @JsonKey(name: 'sell') @Default(0) double sell,
    @JsonKey(name: 'symbol') @Default('') String symbol,
    @JsonKey(name: 'fee') @Default(0) double fee,
  }) = _CoinPriceModel;

  factory CoinPriceModel.fromJson(Map<String, dynamic> json) =>
      _$CoinPriceModelFromJson(json);

  double getBuyValue() => Decimal.parse(buy.toString()).toDouble();

  double getSellValue() => Decimal.parse(sell.toString()).toDouble();

  double getFeeValue() => Decimal.parse(fee.toString()).toDouble();
}
