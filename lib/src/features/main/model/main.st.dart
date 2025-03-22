import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class MainState implements IPageState<MainState> {
  int _currentIndex = 0;

  bool _openOrderMenu = false;

  MainState({int currentIndex = 0, bool openOrderMenu = false}) {
    _currentIndex = currentIndex;
    _openOrderMenu = openOrderMenu;
  }

  int get currentIndex => _currentIndex;
  bool get openOrderMenu => _openOrderMenu;

  @override
  MainState copyWith(Map<String, dynamic> value) {
    return MainState(
      currentIndex: value[MainPageFields.currentIndex] ?? _currentIndex,
      openOrderMenu: value[MainPageFields.openOrderMenu] ?? _openOrderMenu,
    );
  }
}

class MainPageFields {
  MainPageFields._();

  static const String currentIndex = 'currentIndex';
  static const String openOrderMenu = 'openOrderMenu';
}
