import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/introduction/model/welcome_back.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import '../../../../data/local/shared_preferences.dart';

@Injectable()
class WelcomeBackViewModel extends ViewModel {
  WelcomeBackViewModel();

  final _stateSubject =
      BehaviorSubject<WelcomeBackState>.seeded(WelcomeBackState());
  Stream<WelcomeBackState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

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

  void goToSignIn() {
    // NavigationService.toNamed(RoutesConstant.phoneAuth);
    NavigationService.toNamed(RoutesConstant.loginWithPassword);
  }

  void gotoSignUp() {
    NavigationService.toNamed(RoutesConstant.signUpWithPassword);
  }

  Future<void> continueAsGuest() async {
    final authService = AuthenticateBinding.authenticationFirebaseService;
    try {
      final credential = await authService.signInAnonymously();
      if (credential.user != null) {
        authService.asAnonymously();
      }
      NavigationService.toReplacementAllNamed(RoutesConstant.home);
    } on FirebaseException catch (e) {
      // print('error');
      // print(e.message);
    }
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final authService = AuthenticateBinding.authenticationFirebaseService;
    await authService.offAnonymously();
    await authService.signOut();
  }
}
