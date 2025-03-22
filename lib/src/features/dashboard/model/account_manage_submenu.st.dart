import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_manage_submenu.st.freezed.dart';
part 'account_manage_submenu.st.g.dart';

@freezed
class AccountManageSubmenuPageState with _$AccountManageSubmenuPageState {
  const factory AccountManageSubmenuPageState({
    @Default(false) bool isLoading,
  }) = _AccountManageSubmenuPageState;

  factory AccountManageSubmenuPageState.fromJson(Map<String, dynamic> json) =>
      _$AccountManageSubmenuPageStateFromJson(json);
}
