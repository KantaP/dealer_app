import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_auth_countdown.st.freezed.dart';

@freezed
class PhoneAuthCountdownState with _$PhoneAuthCountdownState {
  const factory PhoneAuthCountdownState({
    @Default(0) int retryCountdown,
  }) = _PhoneAuthCountdownState;
}
