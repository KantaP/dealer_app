import 'package:freezed_annotation/freezed_annotation.dart';

part 'trxfiat_cancel.m.freezed.dart';
part 'trxfiat_cancel.m.g.dart';

@freezed
class RequestTrxFiatCancelModel with _$RequestTrxFiatCancelModel {
  const factory RequestTrxFiatCancelModel({
    @JsonKey(name: 'id_trxfiat') required int idTrxFiat,
    @JsonKey(name: 'cancel_reason') required String cancelReason,
  }) = _RequestTrxFiatCancelModel;

  factory RequestTrxFiatCancelModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTrxFiatCancelModelFromJson(json);
}

@freezed
class ResponseTrxFiatCancelModel with _$ResponseTrxFiatCancelModel {
  const factory ResponseTrxFiatCancelModel({
    @JsonKey(name: 'id_trxfiat') required int idTrxFiat,
  }) = _ResponseTrxFiatCancelModel;

  factory ResponseTrxFiatCancelModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseTrxFiatCancelModelFromJson(json);
}
