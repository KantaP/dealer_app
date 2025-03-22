import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_get.m.freezed.dart';
part 'order_get.m.g.dart';

@freezed
class RequestOrderGetModel with _$RequestOrderGetModel {
  const factory RequestOrderGetModel({
    @JsonKey(name: 'id_order') required int idOrder,
    @JsonKey(name: 'refcode') required String ref,
  }) = _RequestOrderGetModel;

  factory RequestOrderGetModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderGetModelFromJson(json);
}

@freezed
class ResponseOrderGetModel with _$ResponseOrderGetModel {
  @JsonSerializable(explicitToJson: true)
  const factory ResponseOrderGetModel({
    @JsonKey(name: 'id_order') @Default(0) int? idOrder,
    @JsonKey(name: 'id_user') @Default('') String? idUser,
    @JsonKey(name: 'digitalasset_price') @Default(0) double? digitalassetPrice,
    @JsonKey(name: 'digitalasset_price_actual')
    @Default(0)
    double? digitalassetPriceActual,
    @JsonKey(name: 'listed_pair') @Default('') String? listedPair,
    @JsonKey(name: 'topay_expire_time') @Default(0) int? topayExpireTime,
    @JsonKey(name: 'datetime_create') @Default('') String datetimeCreate,
    @JsonKey(name: 'datetime_payment') @Default('') String datetimePayment,
    @JsonKey(name: 'datetime_complete') @Default('') String datetimeComplete,
    @JsonKey(name: 'order_side') @Default('') String? orderSide,
    @JsonKey(name: 'order_value_fiat_set')
    @Default(0)
    double? orderValueFiatSet,
    @JsonKey(name: 'order_value_crypto_set')
    @Default(0)
    double? orderValueCryptoSet,
    @JsonKey(name: 'bankaccount_no') @Default('') String? bankAccountNo,
    @JsonKey(name: 'wallet_address') @Default('') String? walletAddress,
    @JsonKey(name: 'status') @Default('') String? status,
    @JsonKey(name: 'cancel_reason') @Default('') String? cancelReason,
    @JsonKey(name: 'refcode') @Default('') String? refCode,
    @JsonKey(name: 'datetime_refcode') @Default('') String datetimeRefcode,
    @JsonKey(name: 'digitalasset_type') @Default('') String? digitalassetType,
    @JsonKey(name: 'digitalasset_price_set')
    @Default(0)
    double? digitalAssetPriceSet,
    @Default(0)
    @JsonKey(name: 'digitalasset_fee_set')
    double digitalAssetFeeSet,
  }) = _ResponseOrderGetModel;

  factory ResponseOrderGetModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseOrderGetModelFromJson(json);
}
