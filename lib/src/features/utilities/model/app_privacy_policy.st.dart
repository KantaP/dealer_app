import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_privacy_policy.st.freezed.dart';
part 'app_privacy_policy.st.g.dart';

@freezed
class AppPrivacyPolicyPageState with _$AppPrivacyPolicyPageState {
  const factory AppPrivacyPolicyPageState({
    @Default(false) bool isLoading,
  }) = _AppPrivacyPolicyPageState;

  factory AppPrivacyPolicyPageState.fromJson(Map<String, dynamic> json) =>
      _$AppPrivacyPolicyPageStateFromJson(json);
}
