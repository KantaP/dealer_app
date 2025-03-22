import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_term.st.freezed.dart';
part 'app_term.st.g.dart';

@freezed
class AppTermPageState with _$AppTermPageState {
  const factory AppTermPageState({
    @Default(false) bool isLoading,
  }) = _AppTermPageState;

  factory AppTermPageState.fromJson(Map<String, dynamic> json) =>
      _$AppTermPageStateFromJson(json);
}
