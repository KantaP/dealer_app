import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.p.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/validate.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/di/default_layout_with_loading.vm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../di/components/injection.dart';
import '../widgets/popup/user_exist_already.dart';

@singleton
class SignUpWithPasswordViewModel {
  final emailSubject = CustomStreamSubject('');
  final passwordSubject = CustomStreamSubject('');
  final hidePasswordSubject = CustomStreamSubject(true);
  final inviteCodeSubject = CustomStreamSubject('');
  final acceptSubject = CustomStreamSubject(false);

  final authService = AuthenticateBinding.authenticationFirebaseService;
  final loadingVm = getIt<DefaultLayoutWithLoadingViewModel>();

  void resetForm() {
    emailSubject.setValue('');
    passwordSubject.setValue('');
    hidePasswordSubject.setValue(true);
    inviteCodeSubject.setValue('');
    acceptSubject.setValue(false);
  }

  bool canSubmit() {
    if (FieldValidate.isEmail(emailSubject.subject.value) == false) {
      return false;
    }
    if (FieldValidate.isStrongPassword(passwordSubject.subject.value) ==
        false) {
      return false;
    }
    if (acceptSubject.subject.value == false) {
      return false;
    }
    if (inviteCodeSubject.subject.value != 'MOONDANCE') {
      return false;
    }
    return true;
  }

  Future<bool> existUsers() async {
    try {
      final existUser = await authService.signInWithEmailAndPassword(
          emailSubject.subject.value, '');
      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showUserExistAlreadyPopup();
      }
      return true;
    }
  }

  Future<void> signUp() async {
    try {
      loadingVm.showLoading(true);
      final credential = await authService.createUserWithEmailAndPassword(
        emailSubject.subject.value,
        passwordSubject.subject.value,
      );
      // print(credential);
      if (credential != null) {
        final userProfile = await authService.createUserProfile(credential);
        // print(UserProfileModelPersistence().toJson(userProfile));
        try {
          authService.sendVerifyEmail();
        } catch (e) {
          // print(e);
          loadingVm.showLoading(false);
          DialogUtils.showToast(msg: e.toString(), type: 'error');
        }
        loadingVm.showLoading(false);
        NavigationService.toReplacementWithNamed(RoutesConstant.verifyEmail);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showUserExistAlreadyPopup();
      }
      loadingVm.showLoading(false);
    }
  }

  Future<void> sendVerifyEmail() async {}

  void goToTerm() {
    NavigationService.toNamed(RoutesConstant.appTerm);
  }

  void goToPrivacy() {
    NavigationService.toNamed(RoutesConstant.appPrivacy);
  }
}
