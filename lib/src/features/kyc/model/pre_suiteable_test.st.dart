import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class PreSuiteableTestPageState
    implements IPageState<PreSuiteableTestPageState> {
  List<UserChoiceModel> _prefill = [];

  PreSuiteableTestPageState({List<UserChoiceModel> prefill = const []}) {
    _prefill = prefill;
  }

  List<UserChoiceModel> get prefill => _prefill;

  @override
  PreSuiteableTestPageState copyWith(Map<String, dynamic> value) {
    return PreSuiteableTestPageState(
      prefill: value['prefill'] ?? _prefill,
    );
  }
}
