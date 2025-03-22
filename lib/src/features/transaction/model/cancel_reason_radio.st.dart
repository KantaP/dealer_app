import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_reason_radio.st.freezed.dart';
part 'cancel_reason_radio.st.g.dart';

@freezed
class CancelReasonRadio with _$CancelReasonRadio {
  const factory CancelReasonRadio({
    @Default('') String? selectedChoice,
  }) = _CancelReasonRadio;

  factory CancelReasonRadio.fromJson(Map<String, Object?> json) =>
      _$CancelReasonRadioFromJson(json);
}
