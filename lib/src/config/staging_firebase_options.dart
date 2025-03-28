// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class StagingFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIOlZcfW-Y8fhUBUSOMCuYz17tAkpTopQ',
    appId: '1:809989295239:android:9213df6d73d8c13aedfc22',
    messagingSenderId: '809989295239',
    projectId: 'gasta-app',
    databaseURL:
        'https://gasta-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gasta-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_xkYyto5UjBq6P_KX1UfuW16Hh0p9JXE',
    appId: '1:809989295239:ios:5caf31271e55660cedfc22',
    messagingSenderId: '809989295239',
    projectId: 'gasta-app',
    databaseURL:
        'https://gasta-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gasta-app.appspot.com',
    androidClientId:
        '809989295239-0g6egbrp7ulaes8qhpdvatlifmfco8p5.apps.googleusercontent.com',
    iosClientId:
        '809989295239-rpcegi9ig7ju5q04ga9i71lpc0aae0n7.apps.googleusercontent.com',
    iosBundleId: 'com.gaffverse.x1109.staging',
  );
}
