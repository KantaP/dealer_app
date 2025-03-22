import 'package:aconnec_1109_x/src/core/routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_new.abs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

abstract class CustomViewRoute extends StatefulWidget {
  const CustomViewRoute.model({Key? key}) : super(key: key);
}

abstract class CustomViewRouteState<V extends CustomViewRoute> extends State<V>
    with RouteAware {
  late final Logger logger;
  String get _sanitisedRoutePageName {
    return '$runtimeType'.replaceAll('_', '').replaceAll('State', '');
  }

  @mustCallSuper
  CustomViewRouteState() {
    logger = Logger(runtimeType.toString());
    logger.fine('Created $runtimeType.');
  }

  @mustCallSuper
  @override
  void initState() {
    super.initState();
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
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  @mustCallSuper
  @override
  void didPopNext() {
    logger.finer('🚚 $_sanitisedRoutePageName didPopNext');
  }

  /// Called when the current route has been pushed.
  @mustCallSuper
  @override
  void didPush() {
    logger.finer('🚚 $_sanitisedRoutePageName didPush');
  }

  /// Called when the current route has been popped off.
  @mustCallSuper
  @override
  void didPop() {
    logger.finer('🚚 $_sanitisedRoutePageName didPop');
  }

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  @mustCallSuper
  @override
  void didPushNext() {
    logger.finer('🚚 $_sanitisedRoutePageName didPushNext');
  }

  @mustCallSuper
  @override
  void dispose() {
    logger.fine('Disposing $runtimeType.');
    super.dispose();
  }
}
