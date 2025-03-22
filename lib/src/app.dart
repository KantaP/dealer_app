import 'package:aconnec_1109_x/src/core/navigator_middleware.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_new.abs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/model/locale.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:provider/provider.dart';
import 'core/routes.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _router = AppRouter();

  // final platform = const MethodChannel('com.gaffverse.channel/secureScreen');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.paused) {
    //   // App is inactive; call Android to add blur
    //   platform.invokeMethod('applyBlur');
    // } else if (state == AppLifecycleState.resumed) {
    //   // App is active; call Android to remove blur
    //   platform.invokeMethod('removeBlur');
    // }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleModel(),
      child: Consumer<LocaleModel>(
        builder: (context, localeModel, child) => MaterialApp(
          title: '1109x',
          theme: CustomTheme.normalTheme,
          navigatorKey: NavigationService.navigatorKey,
          navigatorObservers: [routeObserver, middleware, modalRouteObserver],
          initialRoute: RoutesConstant.splashScreen,
          onGenerateRoute: _router.route,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: localeModel.locale,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
