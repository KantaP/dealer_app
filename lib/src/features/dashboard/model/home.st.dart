import 'package:freezed_annotation/freezed_annotation.dart';

part 'home.st.freezed.dart';
part 'home.st.g.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(false) bool isLoading,
  }) = _HomePageState;

  factory HomePageState.fromJson(Map<String, dynamic> json) =>
      _$HomePageStateFromJson(json);
}
