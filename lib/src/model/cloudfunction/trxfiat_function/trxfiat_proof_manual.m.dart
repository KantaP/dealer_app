import 'package:freezed_annotation/freezed_annotation.dart';

part 'trxfiat_proof_manual.m.freezed.dart';
part 'trxfiat_proof_manual.m.g.dart';

@freezed
class RequestTrxFiatProofManualModel with _$RequestTrxFiatProofManualModel {
  const factory RequestTrxFiatProofManualModel({
    @JsonKey(name: 'id_trxfiat') required int idTrxFiat,
    @JsonKey(name: 'payment_proof') required String paymentProof,
    @JsonKey(name: 'datetime_payment') required String datetimePayment,
    @JsonKey(name: 'refcode') required String refCode,
    @JsonKey(name: 'payment_value_actual') @Default(0) int paymentValueActual,
    @JsonKey(name: 'payment_account_src_actual')
    @Default('')
    String paymentAccountSrcActual,
  }) = _RequestTrxFiatProofManualModel;

  factory RequestTrxFiatProofManualModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTrxFiatProofManualModelFromJson(json);
}

@freezed
class ResponseTrxFiatProofManualModel with _$ResponseTrxFiatProofManualModel {
  const factory ResponseTrxFiatProofManualModel({
    @JsonKey(name: 'id_trxfiat') required int idTrxFiat,
  }) = _ResponseTrxFiatProofManualModel;

  factory ResponseTrxFiatProofManualModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseTrxFiatProofManualModelFromJson(json);
}
