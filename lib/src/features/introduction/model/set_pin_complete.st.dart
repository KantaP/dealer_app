import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class SetPinCompleteState implements IPageState<SetPinCompleteState> {
  bool _isLoading = false;
  SetPinCompleteState({
    bool isLoading = false,
  }) {
    _isLoading = isLoading;
  }

  bool get isLoading => _isLoading;

  @override
  SetPinCompleteState copyWith(Map<String, dynamic> value) {
    return SetPinCompleteState(
      isLoading: value[SetPinCompleteFields.isLoading] ?? _isLoading,
    );
  }
}

class SetPinCompleteFields {
  SetPinCompleteFields._();

  static const String isLoading = 'isLoading';
}
