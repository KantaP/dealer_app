import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class CreateCompleteState implements IPageState<CreateCompleteState> {
  bool _isLoading = false;

  CreateCompleteState({bool isLoading = false}) {
    _isLoading = isLoading;
  }

  @override
  CreateCompleteState copyWith(Map<String, dynamic> value) {
    return CreateCompleteState(
      isLoading: value[CreateCompleteFields.isLoading] ?? _isLoading,
    );
  }
}

class CreateCompleteFields {
  CreateCompleteFields._();

  static const String isLoading = 'isLoading';
}
