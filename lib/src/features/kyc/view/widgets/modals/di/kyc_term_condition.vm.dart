import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class KycTermConditionViewModel extends CustomViewModel {
  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  @override
  void dispose() {
    _routesSubject.close();
  }

  @override
  void updateState(updateValue) {
    // TODO: implement updateState
  }

  void onClose() {
    Navigator.of(NavigationService.navigatorKey.currentContext!).pop();
  }

  Future<String> loadTermCondition() async {
    final txt = await rootBundle.loadString(Assets.documents.kycTermCondition);
    return txt;
  }
}
