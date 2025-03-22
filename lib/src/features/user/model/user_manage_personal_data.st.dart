import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_manage_personal_data.st.freezed.dart';
part 'user_manage_personal_data.st.g.dart';

@freezed
class UserManagePersonalDataPageState with _$UserManagePersonalDataPageState {
  const factory UserManagePersonalDataPageState({
    @Default(false) bool isLoading,
    @Default(false) bool acceptMarketing,
    @Default(false) bool acceptFinance,
    @Default(false) bool acceptProductDevelop,
  }) = _UserManagePersonalDataPageState;

  factory UserManagePersonalDataPageState.fromJson(Map<String, dynamic> json) =>
      _$UserManagePersonalDataPageStateFromJson(json);
}
