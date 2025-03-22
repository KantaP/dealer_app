import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_update_amlo_status.m.freezed.dart';
part 'request_update_amlo_status.m.g.dart';

@freezed
class RequestUpdateAmloStatusModel with _$RequestUpdateAmloStatusModel {
  const factory RequestUpdateAmloStatusModel({
    required String identificationId,
    String? uid,
  }) = _RequestUpdateAmloStatusModel;

  factory RequestUpdateAmloStatusModel.fromJson(Map<String, Object?> json) =>
      _$RequestUpdateAmloStatusModelFromJson(json);
}
