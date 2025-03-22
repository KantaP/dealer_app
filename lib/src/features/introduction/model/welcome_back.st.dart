import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class WelcomeBackState implements IPageState<WelcomeBackState> {
  bool _isLoading = false;

  WelcomeBackState({
    bool isLoading = false,
  }) {
    _isLoading = isLoading;
  }

  bool get isLoading => _isLoading;

  @override
  WelcomeBackState copyWith(Map<String, dynamic> value) {
    return WelcomeBackState(
      isLoading: value[WelcomBackFields.isLoading] ?? _isLoading,
    );
  }
}

class WelcomBackFields {
  WelcomBackFields._();
  static const String isLoading = 'isLoading';
}
