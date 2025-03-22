class ConvertUtils {
  ConvertUtils._();

  static convertToDouble(dynamic value) {
    if (value == null) return 0;
    if (value.runtimeType == String) {
      return double.parse(value);
    }
    if (value.runtimeType == int) {
      return double.parse(value.toString());
    }
    if (value.runtimeType == double) {
      return value;
    }
  }
}
