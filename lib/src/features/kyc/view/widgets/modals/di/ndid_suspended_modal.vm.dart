import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class NdidSuspendedModalViewModel extends CustomViewModel<void> {
  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  @override
  void dispose() {
    _routesSubject.close();
  }

  void onBackToHome() {
    NavigationService.toRoot();
    // NavigationService.toReplacementAllNamed(RoutesConstant.home);
  }

  @override
  void updateState(void updateValue) {
    // TODO: implement updateState
  }
}
