import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_on_call.m.freezed.dart';
part 'response_on_call.m.g.dart';

@freezed
class ResponseOnCallModel with _$ResponseOnCallModel {
  const factory ResponseOnCallModel({
    @JsonKey(name: 'status') @Default(0) int status,
    @JsonKey(name: 'result') @Default(null) Map<String, dynamic>? result,
  }) = _ResponseOnCallModel;

  factory ResponseOnCallModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseOnCallModelFromJson(json);
}
