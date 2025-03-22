import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_create.m.freezed.dart';
part 'order_create.m.g.dart';

@freezed
class RequestOrderCreateModel with _$RequestOrderCreateModel {
  const factory RequestOrderCreateModel({
    @Default(0)
    @JsonKey(name: 'digitalasset_price_set')
    double digitalAssetPrice,
    @Default('') @JsonKey(name: 'listed_pair') String listedPair,
    // @Default(0) @JsonKey(name: 'topay_expire_time') int todayExpireTime,
    @Default('') @JsonKey(name: 'order_side') String orderSide,
    @Default(0) @JsonKey(name: 'order_value_fiat_set') double orderValueFiatSet,
    @Default(0)
    @JsonKey(name: 'order_value_crypto_set')
    double orderValueCryptoSet,
    @Default('') @JsonKey(name: 'bankaccount_no') String bankAccountNo,
    @Default('') @JsonKey(name: 'wallet_address') String walletAdress,
    @Default('') @JsonKey(name: 'digitalasset_type') String digitalAssetType,
    @Default(0)
    @JsonKey(name: 'digitalasset_fee_set')
    double digitalAssetFeeSet,
  }) = _RequestOrderCreateModel;

  factory RequestOrderCreateModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderCreateModelFromJson(json);
}

@freezed
class ResponseOrderCreateModel with _$ResponseOrderCreateModel {
  const factory ResponseOrderCreateModel({
    @Default(0) @JsonKey(name: 'id_order') int idOrder,
    @Default('') @JsonKey(name: 'refcode') String refcode,
  }) = _ResponseOrderCreateModel;

  factory ResponseOrderCreateModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseOrderCreateModelFromJson(json);
}
