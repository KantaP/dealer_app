import 'package:freezed_annotation/freezed_annotation.dart';

part 'pure_fiat_cancel.m.freezed.dart';
part 'pure_fiat_cancel.m.g.dart';

@freezed
class PureFiatCancelRequest with _$PureFiatCancelRequest {
  const factory PureFiatCancelRequest({
    @Default(0) @JsonKey(name: 'id_purefiat') int idPureFiat,
    @Default('') @JsonKey(name: 'cancel_reason') String cancelReason,
    @Default('') @JsonKey(name: 'refcode') String refcode,
  }) = _PureFiatCancelRequest;

  factory PureFiatCancelRequest.fromJson(Map<String, dynamic> json) =>
      _$PureFiatCancelRequestFromJson(json);
}
