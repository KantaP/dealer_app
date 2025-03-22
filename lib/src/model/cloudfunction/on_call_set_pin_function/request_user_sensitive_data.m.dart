import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_user_sensitive_data.m.freezed.dart';
part 'request_user_sensitive_data.m.g.dart';

@freezed
class RequestUserSensitiveDataModel with _$RequestUserSensitiveDataModel {
  const factory RequestUserSensitiveDataModel(
          {@JsonKey(name: 'pin') required String pin}) =
      _RequestUserSensitiveDataModel;

  factory RequestUserSensitiveDataModel.fromJson(Map<String, Object?> json) =>
      _$RequestUserSensitiveDataModelFromJson(json);
}
