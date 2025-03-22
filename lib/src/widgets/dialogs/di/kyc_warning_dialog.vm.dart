import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class KycWarningDialogViewModel extends ViewModel {
  final SharedPreferencesHelper _preferencesHelper;
  KycWarningDialogViewModel(this._preferencesHelper);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  late BuildContext _context;

  @override
  void dispose() {
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  void onLater() {
    NavigationService.back(NavigationResult(null));
    // Navigator.pop(_context);
  }

  void gotoKyc() {
    Future.delayed(const Duration(milliseconds: 500), () {
      NavigationService.toNamed(RoutesConstant.kycAll);
    }).then((value) {
      NavigationService.back(NavigationResult(null));
    });
  }
}
