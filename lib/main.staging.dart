import 'dart:async';
import 'dart:isolate';

import 'package:aconnec_1109_x/src/config/staging_firebase_options.dart';
import 'package:aconnec_1109_x/src/utilities/secure.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'dart:io';

import 'package:aconnec_1109_x/src/app.dart';
// import 'package:aconnec_1109_x/src/config/production_firebase_options.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:logging/logging.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';

import 'src/core/translate/generated/l10n.dart';
import 'src/utilities/file.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: '.env');
    await Firebase.initializeApp(
      options: StagingFirebaseOptions.currentPlatform,
    );

    await SecureUtils.disableScreenshot();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      if (kDebugMode) {
        print('${record.level.name}: ${record.time}: ${record.message}');
      }
    });

    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true if you want to test crash reporting in your app.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      // Handle Crashlytics enabled status when not in Debug,
      // e.g. allow your users to opt-in to crash reporting.
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
    }

    FlavorConfig(
      name: 'staging',
      color: Colors.red,
      location: BannerLocation.bottomStart,
      variables: {
        'enable_root_detect': false,
        'app_id': dotenv.env['APP_STAGING_ID']
      },
    );

    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(statusBarColor: blueColor),
    // );

    // await FirebaseAppCheck.instance.activate(
    //   webRecaptchaSiteKey: '6LfaxHcpAAAAABdEElJACZORftVvzlR0_T7_EoGw',
    //   // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    //   // your preferred provider. Choose from:
    //   // 1. debug provider
    //   // 2. safety net provider
    //   // 3. play integrity provider
    //   androidProvider: AndroidProvider.playIntegrity,
    //   // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
    //   // your preferred provider. Choose from:
    //   // 1. Debug provider
    //   // 2. Device Check provider
    //   // 3. App Attest provider
    //   // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    //   // appleProvider: AppleProvider.debug,
    // );
    await S.load(const Locale('th'));
    configureInjection(Env.production);

    await Intercom.instance.initialize(
      dotenv.env['INTERCOM_APP_ID'] ?? '',
      androidApiKey: dotenv.env['INTERCOM_ANDROID_API_KEY'],
      iosApiKey: dotenv.env['INTERCOM_IOS_API_KEY'],
    );
    await Intercom.instance.loginUnidentifiedUser();
    final firebaseMessaging = FirebaseMessaging.instance;
    final intercomToken = Platform.isIOS
        ? await firebaseMessaging.getAPNSToken()
        : await firebaseMessaging.getToken();

    Intercom.instance.sendTokenToIntercom(intercomToken!);
    await FileUtils.deleteCacheDir();
    runApp(MyApp());
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
