import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.st.freezed.dart';
part 'user_profile.st.g.dart';

@freezed
class UserProfilePageState with _$UserProfilePageState {
  const factory UserProfilePageState({
    @Default(false) bool isLoading,
  }) = _UserProfilePageState;

  factory UserProfilePageState.fromJson(Map<String, dynamic> json) =>
      _$UserProfilePageStateFromJson(json);
}
