import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_input.st.freezed.dart';

@freezed
class ExchangeInputState with _$ExchangeInputState {
  const factory ExchangeInputState({
    @Default('0') String numberOfCount,
    @Default(0.00) double equalTo,
  }) = _ExchangeInputState;
}
