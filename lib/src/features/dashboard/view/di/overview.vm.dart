import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/widgets/dialogs/kyc_warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/overview.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class OverViewViewModel extends ViewModel {
  final AuthenticationFirebaseService _service;
  final SharedPreferencesHelper _preferencesHelper;
  final OrderFunctionService _orderService;
  OverViewViewModel(this._service, this._preferencesHelper, this._orderService);

  final _stateSubject =
      BehaviorSubject<OverviewPageState>.seeded(OverviewPageState());
  Stream<OverviewPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final logger = Logger();

  late BuildContext _context;

  @override
  void dispose() {
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> signOut() async {
    await _service.signOut();
    await _preferencesHelper.setLoggedIn(false);
    // print('loggout');
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.welcomBack,
        action: AppRouteAction.replaceAllWith));
  }

  void gotoKycLevel1() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.kycLevel1));
  }

  void gotoKycLevel2() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.kyc));
  }

  void gotoSetFullName() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.setFullname));
  }

  void alert(BuildContext context) {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return CustomDialogAlert(
    //       title: 'test',
    //       descriptions: 'descirption',
    //       submitButton: ElevatedButton(
    //         onPressed: () {},
    //         child: const Text('button'),
    //       ),
    //     );
    //   },
    // );
  }

  void gotoCaptureFace() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.kycSelfieIntro));
  }

  void gotoSideMenu() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.sideMenu));
  }

  Future<void> getCurrentUser() async {
    final user = await _service.getCurrentUser();
    updateState({
      OverviewPageStateFields.user: user,
    });

    if (user.uid.isEmpty) return;
    if (user.kycLevel == 2) return;
    kycWarningDialog();
  }

  Future<void> kycWarningDialog() async {
    final isExpiredKycWarning =
        await _preferencesHelper.oneTimeKycWarningIsExpired();
    if (isExpiredKycWarning) {
      Future.delayed(const Duration(milliseconds: 1000)).then((_) {
        _preferencesHelper.updateOneTimeKycWarningExpired();
        openKycWarningDialog();
      });
    }
  }
}
