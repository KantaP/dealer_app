import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_id_card.st.freezed.dart';
part 'check_id_card.st.g.dart';

@freezed
class CheckIdCardPageState with _$CheckIdCardPageState {
  const factory CheckIdCardPageState({
    @Default('') String idCard,
  }) = _CheckIdCardPageState;

  factory CheckIdCardPageState.fromJson(Map<String, dynamic> json) =>
      _$CheckIdCardPageStateFromJson(json);
}
