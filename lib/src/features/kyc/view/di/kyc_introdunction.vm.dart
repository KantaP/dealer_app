import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_introdunction.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class KycIntrodunctionViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycIntrodunctionViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject<KycIntrodunctionPageState>.seeded(
      KycIntrodunctionPageState());
  Stream<KycIntrodunctionPageState> get state => _stateSubject;

  final pageController = PageController();

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  Future<void> next() async {
    NavigationService.toNamed(RoutesConstant.captureIdCard);
  }

  void onBack() {
    NavigationService.back(NavigationResult(null));
  }
}
