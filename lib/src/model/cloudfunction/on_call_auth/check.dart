import 'package:freezed_annotation/freezed_annotation.dart';

part 'check.freezed.dart';
part 'check.g.dart';

@freezed
class AuthCheckRequest with _$AuthCheckRequest {
  const factory AuthCheckRequest({
    @Default('') @JsonKey(name: 'phone_number') String phoneNumber,
  }) = _AuthCheckRequest;

  factory AuthCheckRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthCheckRequestFromJson(json);
}
