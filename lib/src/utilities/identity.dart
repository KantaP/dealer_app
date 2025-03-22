class UtilsIdentity {
  UtilsIdentity._();

  static bool checkIdCardDigits(String idCard) {
    if (idCard.length < 13) return false;

    final list = idCard.split('');
    int sum = 0;
    for (int i = 0; i < list.length - 1; i++) {
      // print('===========');
      // print('id card index: $i');
      // print('id card value: ${list[i]}');
      // print('id card formular: int.parse(${list[i]}) * (${list.length - i})');
      // print('===========');
      sum = sum + int.parse(list[i]) * (list.length - i);
    }
    sum = sum % 11;
    sum = 11 - sum;
    // print('final sum: $sum');
    final str = sum.toString().split('').reversed.toList();

    final lastDigit = list[list.length - 1];
    if (str[0] != lastDigit) return false;

    return true;
  }

  static bool checkProvinceIsDangerZone(String province) {
    if (province == 'ยะลา') return true;
    if (province == 'ปัตตานี') return true;
    if (province == 'นราธิวาส') return true;
    return false;
  }
}
