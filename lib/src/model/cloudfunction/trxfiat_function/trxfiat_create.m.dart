import 'package:freezed_annotation/freezed_annotation.dart';

part 'trxfiat_create.m.freezed.dart';
part 'trxfiat_create.m.g.dart';

@freezed
class RequestTrxFiatCreateModel with _$RequestTrxFiatCreateModel {
  const factory RequestTrxFiatCreateModel({
    @JsonKey(name: 'id_order') required int idOrder,
    @JsonKey(name: 'payment_channel') required String paymentChannel,
    @JsonKey(name: 'payment_autosettle') required bool paymentAutoSettle,
    @JsonKey(name: 'payment_value_set') required double paymentValueSet,
    @JsonKey(name: 'payment_value_actual') required double paymentValueAcutal,
    @JsonKey(name: 'payment_value_fee') required double paymentValueFee,
    @JsonKey(name: 'payment_currency') required String paymentCurrency,
    @JsonKey(name: 'payment_account_src_actual')
    required String paymentAccountSrcActual,
    @JsonKey(name: 'payment_account_des_actual')
    @Default('')
    String paymentAccountDesActual,
    @JsonKey(name: 'is_needaudit') required bool isNeedAudit,
    @JsonKey(name: 'is_needapprove') required bool isNeedApprove,
    @JsonKey(name: 'refcode') required String refcode,
  }) = _RequestTrxFiatCreateModel;

  factory RequestTrxFiatCreateModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTrxFiatCreateModelFromJson(json);
}

@freezed
class ResponseTrxFiatCreateModel with _$ResponseTrxFiatCreateModel {
  const factory ResponseTrxFiatCreateModel({
    @JsonKey(name: 'id_trxfiat') required int idTrxFiat,
  }) = _ResponseTrxFiatCreateModel;

  factory ResponseTrxFiatCreateModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseTrxFiatCreateModelFromJson(json);
}
