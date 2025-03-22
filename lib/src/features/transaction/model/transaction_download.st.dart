import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_download.st.freezed.dart';
part 'transaction_download.st.g.dart';

@freezed
class TransactionDownloadPageState with _$TransactionDownloadPageState {
  const factory TransactionDownloadPageState({
    String? docType,
    String? startDate,
    String? endDate,
    String? email,
    @Default(false) bool canSubmit,
  }) = _TransactionDownloadPageState;

  factory TransactionDownloadPageState.fromJson(Map<String, Object?> json) =>
      _$TransactionDownloadPageStateFromJson(json);
}
