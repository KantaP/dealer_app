import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_bay_qr.m.freezed.dart';
part 'response_bay_qr.m.g.dart';

@freezed
class BayQrResponseModel with _$BayQrResponseModel {
  const factory BayQrResponseModel({
    @Default('') @JsonKey(name: 'amount') String amount,
    @Default('') @JsonKey(name: 'content') String content,
    @Default('') @JsonKey(name: 'channel') String channel,
    @Default('') @JsonKey(name: 'bizMchId') String bizMchId,
    @Default('') @JsonKey(name: 'remark') String remark,
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default('') @JsonKey(name: 'ref1') String ref1,
    @Default('') @JsonKey(name: 'ref2') String ref2,
    @Default('') @JsonKey(name: 'billerId') String billerId,
    @Default('') @JsonKey(name: 'terminalId') String terminalId,
  }) = _BayQrResponseModel;

  factory BayQrResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BayQrResponseModelFromJson(json);
}
