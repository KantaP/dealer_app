import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_update_dopa_status.m.freezed.dart';
part 'request_update_dopa_status.m.g.dart';

@freezed
class RequestUpdateDopaStatusModel with _$RequestUpdateDopaStatusModel {
  const factory RequestUpdateDopaStatusModel({
    required String pid,
    required String firstName,
    required String lastName,
    required String birthDay,
    required String laser,
    String? uid,
  }) = _RequestUpdateDopaStatusModel;

  factory RequestUpdateDopaStatusModel.fromJson(Map<String, Object?> json) =>
      _$RequestUpdateDopaStatusModelFromJson(json);
}
