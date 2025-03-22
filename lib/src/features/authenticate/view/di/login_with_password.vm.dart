import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/widgets/popup/wrong_password.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/custom_stream_subject.dart';
import '../../../../di/components/injection.dart';
import '../../../../utilities/validate.dart';
import '../../../../widgets/layouts/di/default_layout_with_loading.vm.dart';
import '../../bindings/authenticate.binding.dart';

@singleton
class LoginWithPasswordViewModel {
  final emailSubject = CustomStreamSubject('');
  final passwordSubject = CustomStreamSubject('');

  final hidePasswordSubject = CustomStreamSubject(true);

  final authService = AuthenticateBinding.authenticationFirebaseService;

  final _sharedPreferencesHelper = getIt<SharedPreferencesHelper>();

  final loadingVm = getIt<DefaultLayoutWithLoadingViewModel>();

  late UserCredential? userCredential;

  void resetForm() {
    emailSubject.setValue('');
    passwordSubject.setValue('');
    hidePasswordSubject.setValue(true);
  }

  bool canSubmit() {
    if (FieldValidate.isEmail(emailSubject.subject.value) == false) {
      return false;
    }
    if (passwordSubject.subject.value.isEmpty) {
      return false;
    }
    return true;
  }

  Future<void> login() async {
    // print('test');
    try {
      loadingVm.showLoading(true);
      await authService.signOut();
      await authService.offAnonymously();
      userCredential = await authService.signInWithEmailAndPassword(
        emailSubject.subject.value,
        passwordSubject.subject.value,
      );
      // print('login success');
      final user = await authService.getUserAuthData();
      if (user != null) {
        if (user.emailVerified == false) {
          try {
            await authService.sendVerifyEmail();
            loadingVm.showLoading(false);
            NavigationService.toReplacementWithNamed(
                RoutesConstant.verifyEmail);
          } on FirebaseAuthException catch (e) {
            DialogUtils.showToast(msg: e.message!, type: 'error');
            loadingVm.showLoading(false);
          }
        } else {
          loadingVm.showLoading(false);
          final result = await NavigationService.toReplacementWithNamed(
              RoutesConstant.setPin);
          await Future.delayed(const Duration(milliseconds: 500));
          _sharedPreferencesHelper.setLoggedIn(true);
          NavigationService.toReplacementAllNamed(RoutesConstant.home);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        showWrongPasswordPopup();
      } else if (e.code == 'too-many-requests') {
        DialogUtils.showToast(
            msg: 'Too many request, Please try again later.', type: 'error');
      } else if (e.code == 'user-not-found') {
        showWrongPasswordPopup();
      }
      loadingVm.showLoading(false);
    }
  }

  void goToSignUp() {
    NavigationService.toNamed(RoutesConstant.signUpWithPassword);
  }
}
