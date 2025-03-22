import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_term_sensitive.st.freezed.dart';

@freezed
class KycTermSensitivePageState with _$KycTermSensitivePageState {
  const factory KycTermSensitivePageState({@Default(false) bool isLoading}) =
      _KycTermSensitivePageState;
}
