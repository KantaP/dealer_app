import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_check_pin.m.freezed.dart';
part 'response_check_pin.m.g.dart';

@freezed
class ResponseCheckPinModel with _$ResponseCheckPinModel {
  const factory ResponseCheckPinModel(
      {@JsonKey(name: 'status') required bool status}) = _ResponseCheckPinModel;

  factory ResponseCheckPinModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseCheckPinModelFromJson(json);
}
