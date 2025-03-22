import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_statement.m.freezed.dart';
part 'request_statement.m.g.dart';

@freezed
class RequestStatementModel with _$RequestStatementModel {
  const factory RequestStatementModel({
    @Default('') @JsonKey(name: 'channel') String channel,
    @Default('') @JsonKey(name: 'fromDate') String fromDate,
    @Default('') @JsonKey(name: 'toDate') String toDate,
    @Default('') @JsonKey(name: 'userid') String userId,
    @Default('') @JsonKey(name: 'request_date') String requestDate,
    @Default('') @JsonKey(name: 'email') String email,
  }) = _RequestStatementModel;

  factory RequestStatementModel.fromJson(Map<String, dynamic> json) =>
      _$RequestStatementModelFromJson(json);
}
