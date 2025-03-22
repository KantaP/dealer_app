import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_spend_limit.m.freezed.dart';
part 'order_spend_limit.m.g.dart';

@freezed
class ResponseOrderSpendLimitModel with _$ResponseOrderSpendLimitModel {
  const factory ResponseOrderSpendLimitModel({
    @Default(0) @JsonKey(name: 'spend_buy_completed') double spendBuyCompleted,
    @Default(0)
    @JsonKey(name: 'spend_sell_completed')
    double spendSellCompleted,
    @Default(0)
    @JsonKey(name: 'spend_buy_incompleted')
    double spendBuyInCompleted,
    @Default(0)
    @JsonKey(name: 'spend_sell_incompleted')
    double spendSellInCompleted,
  }) = _ResponseOrderSpendLimitModel;

  factory ResponseOrderSpendLimitModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseOrderSpendLimitModelFromJson(json);
}

@freezed
class RequestOrderSpendLimitModel with _$RequestOrderSpendLimitModel {
  const factory RequestOrderSpendLimitModel({
    @Default('') @JsonKey(name: 'id_user') String idUser,
    @Default(0) @JsonKey(name: 'timezone') int timezone,
  }) = _RequestOrderSpendLimitModel;

  factory RequestOrderSpendLimitModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderSpendLimitModelFromJson(json);
}
