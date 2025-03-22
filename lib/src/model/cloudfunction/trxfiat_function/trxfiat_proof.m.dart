import 'package:freezed_annotation/freezed_annotation.dart';

part 'trxfiat_proof.m.freezed.dart';
part 'trxfiat_proof.m.g.dart';

@freezed
class RequestTrxFiatProofModel with _$RequestTrxFiatProofModel {
  const factory RequestTrxFiatProofModel({
    @JsonKey(name: 'id_trxfiat') required int idTrxFiat,
    @JsonKey(name: 'payment_value_actual') required int paymentValueActual,
    @JsonKey(name: 'payment_proof') required String paymentProof,
  }) = _RequestTrxFiatProofModel;

  factory RequestTrxFiatProofModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTrxFiatProofModelFromJson(json);
}

@freezed
class ResponseTrxFiatProofModel with _$ResponseTrxFiatProofModel {
  const factory ResponseTrxFiatProofModel({
    @JsonKey(name: 'id_trxfiat') required int idTrxFiat,
  }) = _ResponseTrxFiatProofModel;

  factory ResponseTrxFiatProofModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseTrxFiatProofModelFromJson(json);
}
