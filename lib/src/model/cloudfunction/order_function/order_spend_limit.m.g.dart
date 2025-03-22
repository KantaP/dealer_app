// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_spend_limit.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseOrderSpendLimitModelImpl _$$ResponseOrderSpendLimitModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseOrderSpendLimitModelImpl(
      spendBuyCompleted: (json['spend_buy_completed'] as num?)?.toDouble() ?? 0,
      spendSellCompleted:
          (json['spend_sell_completed'] as num?)?.toDouble() ?? 0,
      spendBuyInCompleted:
          (json['spend_buy_incompleted'] as num?)?.toDouble() ?? 0,
      spendSellInCompleted:
          (json['spend_sell_incompleted'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$ResponseOrderSpendLimitModelImplToJson(
        _$ResponseOrderSpendLimitModelImpl instance) =>
    <String, dynamic>{
      'spend_buy_completed': instance.spendBuyCompleted,
      'spend_sell_completed': instance.spendSellCompleted,
      'spend_buy_incompleted': instance.spendBuyInCompleted,
      'spend_sell_incompleted': instance.spendSellInCompleted,
    };

_$RequestOrderSpendLimitModelImpl _$$RequestOrderSpendLimitModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOrderSpendLimitModelImpl(
      idUser: json['id_user'] as String? ?? '',
      timezone: json['timezone'] as int? ?? 0,
    );

Map<String, dynamic> _$$RequestOrderSpendLimitModelImplToJson(
        _$RequestOrderSpendLimitModelImpl instance) =>
    <String, dynamic>{
      'id_user': instance.idUser,
      'timezone': instance.timezone,
    };
