import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_set_pin.m.freezed.dart';
part 'response_set_pin.m.g.dart';

@freezed
class ResponseSetPinModel with _$ResponseSetPinModel {
  const factory ResponseSetPinModel({
    @JsonKey(name: 'status') required bool status,
  }) = _ResponseSetPinModel;

  factory ResponseSetPinModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseSetPinModelFromJson(json);
}
