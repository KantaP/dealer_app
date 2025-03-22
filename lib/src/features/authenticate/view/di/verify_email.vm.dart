import 'dart:async';

import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/custom_stream_subject.dart';
import '../../../../data/local/shared_preferences.dart';
import '../../../../di/components/injection.dart';

@singleton
class VerifyEmailViewModel {
  Timer? timer;
  Timer? countdownTimer;
  final countdownSubject = CustomStreamSubject(60);
  final authService = AuthenticateBinding.authenticationFirebaseService;

  final _sharedPreferencesHelper = getIt<SharedPreferencesHelper>();

  void checkEmailVerified() async {
    final user = await authService.getUserAuthData();
    user!.reload();
    final verifined = user.emailVerified;
    if (verifined) {
      timer?.cancel();
      DialogUtils.showToast(
          msg: S
              .of(NavigationService.navigatorKey.currentContext!)
              .emailVerifiedSuccess);
      final result =
          await NavigationService.toReplacementWithNamed(RoutesConstant.setPin);
      await Future.delayed(const Duration(milliseconds: 500));
      _sharedPreferencesHelper.setLoggedIn(true);
      NavigationService.toReplacementAllNamed(RoutesConstant.home);
    }
  }

  void initCheckEmailVerify() {
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        countdownSubject.setValue(countdownSubject.subject.value - 1);
        if (countdownSubject.subject.value == 0) {
          countdownTimer?.cancel();
        }
      },
    );
  }

  void dispose() {
    timer?.cancel();
    countdownTimer?.cancel();
    countdownSubject.setValue(0);
  }

  void resendVerifyEmail() async {
    final user = await authService.getUserAuthData();
    if (user != null) {
      user.sendEmailVerification();
      countdownSubject.setValue(60);
      countdownTimer = Timer.periodic(
        const Duration(seconds: 1),
        (_) {
          countdownSubject.setValue(countdownSubject.subject.value - 1);
          if (countdownSubject.subject.value == 0) {
            countdownTimer?.cancel();
          }
        },
      );
    }
  }

  Future<String> getEmail() async {
    final user = await authService.getUserAuthData();
    if (user != null) {
      if (user.email != null) return user.email!;
    }
    return '';
  }
}
