import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';

class Translate {
  Translate._();
  static String getBankName(String code) {
    switch (code) {
      case 'scb':
        return S.current.scb;
      case 'ktb':
        return S.current.ktb;
      case 'ktc':
        return S.current.ktc;
      default:
        return '';
    }
  }
}
