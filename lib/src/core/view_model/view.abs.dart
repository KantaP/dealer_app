import 'dart:async';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_new.abs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';

import 'view_model.abs.dart';

abstract class CustomView<VM extends ViewModel> extends StatefulWidget {
  final VM viewModel;

  const CustomView.model(this.viewModel, {Key? key}) : super(key: key);
}

abstract class ViewState<V extends CustomView, VM extends ViewModel>
    extends State<V> with RouteAware {
  late final VM _viewModel;
  late final Logger logger;

  VM get viewModel => _viewModel;

  String get _sanitisedRoutePageName {
    return '$runtimeType'.replaceAll('_', '').replaceAll('State', '');
  }

  @mustCallSuper
  ViewState(this._viewModel) {
    logger = Logger(runtimeType.toString());
    logger.fine('Created $runtimeType.');
  }

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    viewModel.initData();
  }

  @mustCallSuper
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // subscribe for the change of route
    if (ModalRoute.of(context).runtimeType == PageRoute) {
      modalRouteObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    }
    if (ModalRoute.of(context).runtimeType == CupertinoModalPopupRoute) {
      modalRouteObserver.subscribe(
          this, ModalRoute.of(context) as CupertinoModalPopupRoute);
    }
    if (ModalRoute.of(context).runtimeType == MaterialPageRoute) {
      modalRouteObserver.subscribe(
          this, ModalRoute.of(context) as MaterialPageRoute);
    }
    if (ModalRoute.of(context).runtimeType == ModalBottomSheetRoute) {
      modalRouteObserver.subscribe(
          this, ModalRoute.of(context) as ModalBottomSheetRoute);
    }
    if (ModalRoute.of(context).runtimeType == SlideFadeRoute) {
      modalRouteObserver.subscribe(
          this, ModalRoute.of(context) as SlideFadeRoute);
    }
    if (ModalRoute.of(context).runtimeType == LeftToRightRoute) {
      modalRouteObserver.subscribe(
          this, ModalRoute.of(context) as LeftToRightRoute);
    }
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  @mustCallSuper
  @override
  void didPopNext() {
    logger.finer('🚚 $_sanitisedRoutePageName didPopNext');
    viewModel.routingDidPopNext();
  }

  /// Called when the current route has been pushed.
  @mustCallSuper
  @override
  void didPush() {
    logger.finer('🚚 $_sanitisedRoutePageName didPush');
    viewModel.routingDidPush();
  }

  /// Called when the current route has been popped off.
  @mustCallSuper
  @override
  void didPop() {
    logger.finer('🚚 $_sanitisedRoutePageName didPop');
    viewModel.routingDidPop();
  }

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  @mustCallSuper
  @override
  void didPushNext() {
    logger.finer('🚚 $_sanitisedRoutePageName didPushNext');
    viewModel.routingDidPushNext();
  }

  @mustCallSuper
  @override
  void dispose() {
    modalRouteObserver.unsubscribe(this);
    logger.fine('Disposing $runtimeType.');
    viewModel.dispose();
    super.dispose();
  }

  /// Listens to the stream and automatically routes users according to the
  /// route spec.
  StreamSubscription<AppRouteSpec> listenToRoutesSpecs(
      Stream<AppRouteSpec> routes) {
    return routes.listen((spec) async {
      switch (spec.action) {
        case AppRouteAction.pushTo:
          await NavigationService.navigatorKey.currentState!.pushNamed(
            spec.name,
            arguments: spec.arguments,
          );
          break;
        case AppRouteAction.replaceWith:
          await NavigationService.navigatorKey.currentState!
              .pushReplacementNamed(
            spec.name,
            arguments: spec.arguments,
          );
          break;
        case AppRouteAction.replaceAllWith:
          await NavigationService.navigatorKey.currentState!
              .pushNamedAndRemoveUntil(
            spec.name,
            (route) => false,
            arguments: spec.arguments,
          );
          break;
        case AppRouteAction.pop:
          NavigationService.navigatorKey.currentState!.pop(spec.arguments);
          break;
        case AppRouteAction.popUntil:
          NavigationService.navigatorKey.currentState!
              .popUntil((route) => route.settings.name == spec.name);
          break;
        case AppRouteAction.popUntilRoot:
          NavigationService.navigatorKey.currentState!
              .popUntil((route) => route.isFirst);
          break;
      }
    });
  }
}
