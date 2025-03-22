import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_list_screen.st.freezed.dart';

@freezed
class CoinListScreenPageState with _$CoinListScreenPageState {
  const factory CoinListScreenPageState({
    @Default(false) bool isLoading,
  }) = _CoinListScreenPageState;
}
