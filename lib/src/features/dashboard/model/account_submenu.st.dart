import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_submenu.st.freezed.dart';
part 'account_submenu.st.g.dart';

@freezed
class AccountSubmenuPageState with _$AccountSubmenuPageState {
  const factory AccountSubmenuPageState({
    @Default(false) bool isLoading,
  }) = _AccountSubmenuPageState;

  factory AccountSubmenuPageState.fromJson(Map<String, dynamic> json) =>
      _$AccountSubmenuPageStateFromJson(json);
}

