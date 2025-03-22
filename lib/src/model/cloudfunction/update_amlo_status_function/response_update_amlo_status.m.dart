import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_update_amlo_status.m.freezed.dart';
part 'response_update_amlo_status.m.g.dart';

@freezed
class ResponseUpdateAmloStatusModel with _$ResponseUpdateAmloStatusModel {
  const factory ResponseUpdateAmloStatusModel({
    @JsonKey(name: 'amlo_status') @Default(false) bool status,
    @JsonKey(name: 'message') @Default('') String message,
    @Default(0) int code,
  }) = _ResponseUpdateAmloStatusModel;

  factory ResponseUpdateAmloStatusModel.fromJson(Map<String, Object?> json) =>
      _$ResponseUpdateAmloStatusModelFromJson(json);
}
