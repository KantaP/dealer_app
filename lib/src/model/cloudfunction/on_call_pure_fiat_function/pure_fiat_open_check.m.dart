import 'package:freezed_annotation/freezed_annotation.dart';

part 'pure_fiat_open_check.m.freezed.dart';
part 'pure_fiat_open_check.m.g.dart';

@freezed
class PureFiatOpenCheckRequest with _$PureFiatOpenCheckRequest {
  const factory PureFiatOpenCheckRequest({
    @Default('') @JsonKey(name: 'id_user') String idUser,
    @Default('') @JsonKey(name: 'payment_type') String paymentType,
  }) = _PureFiatOpenCheckRequest;

  factory PureFiatOpenCheckRequest.fromJson(Map<String, dynamic> json) =>
      _$PureFiatOpenCheckRequestFromJson(json);
}

@freezed
class PureFiatOpenCheckResponse with _$PureFiatOpenCheckResponse {
  const factory PureFiatOpenCheckResponse({
    @Default(0) @JsonKey(name: 'id_purefiat') int idPureFiat,
    @Default('') @JsonKey(name: 'order_status') String orderStatus,
    @Default('') @JsonKey(name: 'payment_type') String paymentType,
    @Default('') @JsonKey(name: 'refcode') String refcode,
    @Default('') @JsonKey(name: 'payment_qrdata') String paymentQrData,
    @Default(0)
    @JsonKey(name: 'payment_value_actual')
    double paymentValueActual,
  }) = _PureFiatOpenCheckResponse;

  factory PureFiatOpenCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$PureFiatOpenCheckResponseFromJson(json);
}
