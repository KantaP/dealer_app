// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_spend_limit.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSpendLimitModelImpl _$$UserSpendLimitModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSpendLimitModelImpl(
      spendLimitBuy: (json['spend_limit_buy'] as num?)?.toDouble() ?? 0,
      spendLimitSell: (json['spend_limit_sell'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$UserSpendLimitModelImplToJson(
        _$UserSpendLimitModelImpl instance) =>
    <String, dynamic>{
      'spend_limit_buy': instance.spendLimitBuy,
      'spend_limit_sell': instance.spendLimitSell,
    };
