// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_usage_spend_today.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserUsageSpendTodayModelImpl _$$UserUsageSpendTodayModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserUsageSpendTodayModelImpl(
      limitBuy: (json['limitBuy'] as num?)?.toDouble() ?? 0,
      limitSell: (json['limitSell'] as num?)?.toDouble() ?? 0,
      usageBuy: (json['usageBuy'] as num?)?.toDouble() ?? 0,
      usageSell: (json['usageSell'] as num?)?.toDouble() ?? 0,
      usageBuyPercent: (json['usageBuyPercent'] as num?)?.toDouble() ?? 0,
      usageSellPercent: (json['usageSellPercent'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$UserUsageSpendTodayModelImplToJson(
        _$UserUsageSpendTodayModelImpl instance) =>
    <String, dynamic>{
      'limitBuy': instance.limitBuy,
      'limitSell': instance.limitSell,
      'usageBuy': instance.usageBuy,
      'usageSell': instance.usageSell,
      'usageBuyPercent': instance.usageBuyPercent,
      'usageSellPercent': instance.usageSellPercent,
    };
