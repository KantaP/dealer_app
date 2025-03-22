import 'package:encrypt/encrypt.dart';
import 'package:aconnec_1109_x/src/constants/key.dart';

class EncryptedUtils {
  EncryptedUtils._();
  static String encrypt(String text) {
    final key = Key.fromUtf8(AppKey.aesKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  static String decrypt(String base64String) {
    final key = Key.fromUtf8(AppKey.aesKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt(Encrypted.from64(base64String), iv: iv);
    // print(decrypted);
    return decrypted;
  }
}
