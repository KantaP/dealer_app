import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_problem.st.freezed.dart';
part 'report_problem.st.g.dart';

@freezed
class ReportProblemPageState with _$ReportProblemPageState {
  const factory ReportProblemPageState({
    @Default(false) bool isLoading,
  }) = _ReportProblemPageState;

  factory ReportProblemPageState.fromJson(Map<String, dynamic> json) =>
      _$ReportProblemPageStateFromJson(json);
}
