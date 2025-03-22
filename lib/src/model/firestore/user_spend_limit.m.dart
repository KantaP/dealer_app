import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_spend_limit.m.freezed.dart';
part 'user_spend_limit.m.g.dart';

@freezed
class UserSpendLimitModel with _$UserSpendLimitModel {
  const factory UserSpendLimitModel({
    @Default(0) @JsonKey(name: 'spend_limit_buy') double spendLimitBuy,
    @Default(0) @JsonKey(name: 'spend_limit_sell') double spendLimitSell,
  }) = _UserSpendLimitModel;

  factory UserSpendLimitModel.fromJson(Map<String, dynamic> json) =>
      _$UserSpendLimitModelFromJson(json);
}
