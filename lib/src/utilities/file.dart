import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<void> deleteCacheDir() async {
    if (Platform.isAndroid) {
      final cacheDir = await getTemporaryDirectory();
      if (cacheDir.existsSync()) {
        cacheDir.deleteSync(recursive: true);
      }
    }
    return;
  }

  static Future<void> deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();

    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }
}
