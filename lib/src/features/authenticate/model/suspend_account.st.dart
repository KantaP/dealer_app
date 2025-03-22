import 'package:freezed_annotation/freezed_annotation.dart';

part 'suspend_account.st.freezed.dart';
part 'suspend_account.st.g.dart';

@freezed
class SuspendAccountPageState with _$SuspendAccountPageState {
  const factory SuspendAccountPageState({
    @Default(false) bool isLoading,
    @Default(false) bool isAccept,
  }) = _SuspendAccountPageState;

  factory SuspendAccountPageState.fromJson(Map<String, dynamic> json) =>
      _$SuspendAccountPageStateFromJson(json);
}
