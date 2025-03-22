import 'package:intl/intl.dart';

extension DoubleExt on double {
  String toThb() {
    return NumberFormat.simpleCurrency(name: 'THB', decimalDigits: 2)
        .format(this);
  }

  String toApproxThb() {
    return '≈ ${NumberFormat.simpleCurrency(name: 'THB', decimalDigits: 2).format(this)}';
  }

  String toUsd() {
    return NumberFormat.simpleCurrency(name: 'USD', decimalDigits: 2)
        .format(this);
  }

  String toUom(String uom) {
    try {
      String pattern = '#,##0.';
      int fixedDecimal = 0;
      String text = toString();
      if (toString().contains('-')) {
        //ถูกแปลงเป็นข้อความเลขฐาน 10
        final split = toString().split('-');
        fixedDecimal = int.parse(split[1]);
        // print(fixedDecimal);
        text = toStringAsFixed(fixedDecimal);
      }
      // int dotIndex = text.indexOf('.');
      // String splitText = text.substring(dotIndex + 1);

      // int finalDecimal = splitText.length;
      // for (var e in List.generate(finalDecimal, (index) => index)) {
      //   pattern = '${pattern}0';
      // }
      return '$text $uom';
    } catch (e) {
      print(toString());
      return '';
    }
  }

  String toApproxUom(String uom) {
    try {
      String pattern = '#,##0.';
      int fixedDecimal = 0;
      String text = toString();
      if (toString().contains('-')) {
        //ถูกแปลงเป็นข้อความเลขฐาน 10
        final split = toString().split('-');
        fixedDecimal = int.parse(split[1]);
        // print(fixedDecimal);
        text = toStringAsFixed(fixedDecimal);
      }

      // int dotIndex = text.indexOf('.');
      // String splitText = text.substring(dotIndex + 1);

      // int finalDecimal = splitText.length;
      // for (var e in List.generate(finalDecimal, (index) => index)) {
      //   pattern = '${pattern}0';
      // }
      return '≈ $text $uom';
    } catch (e) {
      print(toString());
      return '';
    }
  }

  double toPrecision(int n) => double.parse(toStringAsFixed(n));

  String toCurrency() {
    return NumberFormat('#,##0.00').format(this);
  }

  String toApprox() {
    return '≈ ${NumberFormat('#,##0.00').format(this)}';
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
