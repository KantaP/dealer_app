import 'package:flutter/widgets.dart';

class LocaleModel extends ChangeNotifier {
  Locale? _locale = const Locale('th');

  Locale? get locale => _locale;

  void set(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
