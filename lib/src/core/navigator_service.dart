import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:flutter/material.dart';

class NavigationResult {
  final dynamic result;

  NavigationResult(this.result);
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?> toNamed<T>(String route, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed<T>(route, arguments: arguments);
  }

  static Future<T?> toReplacementWithNamed<T>(String route,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(route, arguments: arguments);
  }

  static Future<T?> toReplacementAllNamed<T>(String route,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
  }

  static void back(NavigationResult result) {
    return navigatorKey.currentState!.pop(result);
  }

  static void toRoot() {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  static double paddingBottom() =>
      (MediaQuery.of(navigatorKey.currentContext!).padding.bottom > 0)
          ? MediaQuery.of(navigatorKey.currentContext!).padding.bottom
          : Spacing.spacing24;
}
