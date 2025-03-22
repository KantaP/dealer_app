import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_update_dopa_status.m.freezed.dart';
part 'response_update_dopa_status.m.g.dart';

@freezed
class ResponseUpdateDopaStatusModel with _$ResponseUpdateDopaStatusModel {
  @JsonSerializable(explicitToJson: true)
  const factory ResponseUpdateDopaStatusModel({
    @JsonKey(name: 'result') required ResponseUpdateDopaStatusResult result,
  }) = _ResponseUpdateDopaStatusModel;

  factory ResponseUpdateDopaStatusModel.fromJson(Map<String, Object?> json) =>
      _$ResponseUpdateDopaStatusModelFromJson(json);
}

@freezed
class ResponseUpdateDopaStatusResult with _$ResponseUpdateDopaStatusResult {
  const factory ResponseUpdateDopaStatusResult({
    @JsonKey(name: 'dopa_check_status') @Default(false) bool dopaCheckStatus,
  }) = _ResponseUpdateDopaStatusResult;

  factory ResponseUpdateDopaStatusResult.fromJson(Map<String, Object?> json) =>
      _$ResponseUpdateDopaStatusResultFromJson(json);
}
