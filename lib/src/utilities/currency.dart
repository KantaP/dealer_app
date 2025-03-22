import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:intl/intl.dart';

class CurrencyUtils {
  CurrencyUtils._();

  static final oCcy = NumberFormat('#,###');

  static String toTHB(double number) {
    return number.toThb();
  }

  static String toThbWithoutCurrencyCode(double number) {
    final f = oCcy.format(number);
    return '$f ${S.current.thb}';
  }

  static String toCurrencyNumber(double number) {
    final numberFormat = NumberFormat('#,###.##');
    final f = numberFormat.format(number);
    return f;
  }

  static String toGasth(double number) {
    final f = oCcy.format(number);

    return '$f ${S.current.gasth}';
  }

  static String toCoinWithUOM(double number, String uom) {
    return number.toUom(uom);
  }
}
