import 'dart:developer';

import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:flutter/material.dart';

import '../features/authenticate/bindings/authenticate.binding.dart';
import '../features/dashboard/model/request_form.arguments.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

NavigatorMiddleware<Route> middleware = NavigatorMiddleware<Route>(
  onPush: (route, Route? previousRoute) async {
    log('we have push event');
    // print('push to page ${route.settings.name}');
    final auth = AuthenticateBinding.authenticationFirebaseService;
    //auth guard
    // print('auth guard');
    if (route.settings.name == RoutesConstant.buyGToken ||
        route.settings.name == RoutesConstant.notification) {
      final logged = await auth.isLoggedIn();
      if (!logged) {
        NavigationService.toReplacementWithNamed(RoutesConstant.phoneAuth);
      }
    }

    //kyc guard
    // print('kyc_guard');
    // print(route.settings);
    if (route.settings.name == RoutesConstant.userBankAccount ||
        route.settings.name == RoutesConstant.buyGToken) {
      final user = await auth.getCurrentUser();
      if (user.kycLevel != 2) {
        NavigationService.toReplacementWithNamed(
            RoutesConstant.kycRequiredWarning);
      }
    }

    if (route.settings.name == RoutesConstant.requestForm) {
      final RequestFormArgumentsScreen arguments =
          route.settings.arguments as RequestFormArgumentsScreen;
      // print('kyc required');
      // print(arguments.kycRequired);
      if (arguments.kycRequired) {
        final user = await auth.getCurrentUser();
        if (user.kycLevel != 2) {
          NavigationService.toReplacementWithNamed(
              RoutesConstant.kycRequiredWarning);
        }
      }
    }
  },
  onPop: (route, Route? previousRoute) {
    log('we have pop event');
  },
  onReplace: (route, Route? previousRoute) {
    log('we have replace event');
  },
  onRemove: (route, Route? previousRoute) {
    log('we have remove event');
  },
);

// class NavigatorObserver {
//   NavigatorState get navigator => _navigator;
//   late NavigatorState _navigator;

//   void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {}

//   void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {}

//   void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {}

//   void didReplace(
//       {required Route<dynamic> newRoute, required Route<dynamic> oldRoute}) {}

//   void didStartUserGesture(
//       Route<dynamic> route, Route<dynamic> previousRoute) {}

//   void didStopUserGesture() {}
// }

typedef OnRouteChange<R extends Route<dynamic>> = void Function(
    R route, R previousRoute);

class NavigatorMiddleware<R extends Route<dynamic>> extends RouteObserver<R> {
  NavigatorMiddleware({
    this.enableLogger = true,
    required this.onPush,
    required this.onPop,
    required this.onReplace,
    required this.onRemove,
  }) : _stack = [];

  final List<Route> _stack;
  final bool enableLogger;

  final OnRouteChange<Route> onPush;
  final OnRouteChange<Route> onPop;
  final OnRouteChange<Route> onReplace;
  final OnRouteChange<Route> onRemove;

  //create clone list from stack
  List<Route> get stack => List<Route>.from(_stack);

  @override
  void didPush(Route route, Route? previousRoute) {
    _logget('{didPush} \n route: $route \n previousRoute: $previousRoute');
    _stack.add(route);
    _logStack();
    if (onPush != null) {
      onPush(route, previousRoute ?? route);
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _logget('{didPop} \n route: $route \n previousRoute: $previousRoute');
    _stack.remove(route);
    _logStack();
    if (onPop != null) {
      onPop(route, previousRoute ?? route);
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _logget('{didReplace} \n newRoute: $newRoute \n oldRoute: $oldRoute');
    if (oldRoute != null) {
      if (_stack.contains(oldRoute)) {
        final oldItemIndex = _stack.indexOf(oldRoute);
        _stack[oldItemIndex] = newRoute!;
      }
    }

    _logStack();
    if (newRoute != null && oldRoute != null) {
      onReplace(newRoute!, oldRoute!);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _logget('{didRemove} \n route: $route \n previousRoute: $previousRoute');
    stack.remove(route);
    _logStack();
    if (onRemove != null) {
      onRemove(route, previousRoute ?? route);
    }
    super.didRemove(route, previousRoute);
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    _logget(
        '{didStartUserGesture} \n route: $route \n previousRoute: $previousRoute');
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    _logget('{didStopUserGesture}');
    super.didStopUserGesture();
  }

  void _logStack() {
    final mappedStack =
        _stack.map((Route route) => route.settings.name).toList();

    _logget('Navigator stack: $mappedStack');
  }

  void _logget(String content) {
    if (enableLogger) {
      log(content);
    }
  }
}
