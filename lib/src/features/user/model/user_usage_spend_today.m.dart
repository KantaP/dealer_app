import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_usage_spend_today.m.freezed.dart';
part 'user_usage_spend_today.m.g.dart';

@freezed
class UserUsageSpendTodayModel with _$UserUsageSpendTodayModel {
  const factory UserUsageSpendTodayModel({
    @Default(0) double limitBuy,
    @Default(0) double limitSell,
    @Default(0) double usageBuy,
    @Default(0) double usageSell,
    @Default(0) double usageBuyPercent,
    @Default(0) double usageSellPercent,
  }) = _UserUsageSpendTodayModel;

  factory UserUsageSpendTodayModel.fromJson(Map<String, dynamic> json) =>
      _$UserUsageSpendTodayModelFromJson(json);
}
