import 'package:freezed_annotation/freezed_annotation.dart';

part 'trxdigitalasset_create.m.freezed.dart';
part 'trxdigitalasset_create.m.g.dart';

@freezed
class RequestTrxDigitalAssetCreateModel
    with _$RequestTrxDigitalAssetCreateModel {
  const factory RequestTrxDigitalAssetCreateModel({
    @JsonKey(name: 'id_order') required int idOrder,
    @JsonKey(name: 'payment_channel') required String paymentChannel,
    @JsonKey(name: 'payment_autosettle') required bool paymentAutoSettle,
    @JsonKey(name: 'payment_value_set') required double paymentValueSet,
    @JsonKey(name: 'payment_value_actual') required double paymentValueAcutal,
    @JsonKey(name: 'payment_value_fee') required double paymentValueFee,
    @JsonKey(name: 'payment_currency') required String paymentCurrency,
    @JsonKey(name: 'payment_wallet_des_actual')
    required String paymentAccountDesActual,
    @JsonKey(name: 'is_needaudit') required bool isNeedAudit,
    @JsonKey(name: 'is_needapprove') required bool isNeedApprove,
    @JsonKey(name: 'refcode') required String refcode,
  }) = _RequestTrxDigitalAssetCreateModel;

  factory RequestTrxDigitalAssetCreateModel.fromJson(
          Map<String, dynamic> json) =>
      _$RequestTrxDigitalAssetCreateModelFromJson(json);
}

@freezed
class ResponseTrxDigitalAssetCreateModel
    with _$ResponseTrxDigitalAssetCreateModel {
  const factory ResponseTrxDigitalAssetCreateModel({
    @JsonKey(name: 'id_trxdigitalasset') required int idTrxDigitalAsset,
  }) = _ResponseTrxDigitalAssetCreateModel;

  factory ResponseTrxDigitalAssetCreateModel.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseTrxDigitalAssetCreateModelFromJson(json);
}
