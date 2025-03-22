import 'dart:math';

class StringUtils {
  StringUtils._();

  static String generateRandomString(int len) {
    var r = Random();
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  static String hideSomeEmailText(String email) {
    List<String> nameuser = email.split("@");
    List<String> ipEmail = nameuser[1].split('.');
    String emailcaracter = nameuser[0]
        .replaceRange(2, nameuser[0].length, "*" * (nameuser[0].length - 2));
    String emailcaracter2 = ipEmail[0]
        .replaceRange(0, ipEmail[0].length, "*" * (ipEmail[0].length - 2));
    return '${emailcaracter}@${emailcaracter2}.${ipEmail[1]}';
  }
}
