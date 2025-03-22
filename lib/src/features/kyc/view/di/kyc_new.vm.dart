import 'dart:async';

import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/kyc_failed_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_under_review_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/ndid_suspended_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class KycFinalViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  final AuthenticationFirebaseService _authenticationFirebaseService;
  KycFinalViewModel(this._firebaseService, this._authenticationFirebaseService);

  final _pageStateSubject = BehaviorSubject.seeded(KycFinalPageState());

  Stream<KycFinalPageState> get pageState => _pageStateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  late StreamSubscription<DatabaseEvent> _databaseSubscriber;

  @override
  void dispose() {
    _pageStateSubject.close();
    _routesSubject.close();
    _pageController.dispose();
    _databaseSubscriber.cancel();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _pageStateSubject.value;
    _pageStateSubject.add(state.copyWith(updateValue));
  }

  void firebaseListener() {
    _databaseSubscriber = _firebaseService.onKycProgress().listen(
      (event) {
        if (event.snapshot.value != null) {
          final data =
              Map<String, dynamic>.from(event.snapshot.value as dynamic);
          final kycProgress = KycFinalPageStatePersistence().fromJson(data);
          updateState(KycFinalPageStatePersistence().toJson(kycProgress));
          if (kycProgress.currentStepIndex == 0) {
            _pageController.jumpToPage(
                StaticValue.kycPageIndex[kycProgress.firstStepProgress] ?? 0);
          } else if (kycProgress.currentStepIndex == 1) {
            _pageController.jumpToPage(
                StaticValue.kycPageIndex[kycProgress.secondStepProgress] ?? 0);
          } else if (kycProgress.currentStepIndex == 2) {
            _pageController.jumpToPage(
                StaticValue.kycPageIndex[kycProgress.thirdStepProgress] ?? 0);
          }
        } else {
          _pageController.jumpToPage(1);
        }
      },
    );
  }

  bool isEditMode() {
    final state = _pageStateSubject.value;
    return state.editMode;
  }

  void onBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  void openKycReject() {
    showKycFailedModalBottomSheet(
      NavigationService.navigatorKey.currentContext!,
      title: S.current.kycNotPassTitle,
      content: S.current.kycNotPassContent,
      onBack: () {
        _routesSubject.add(
          const AppRouteSpec(
              name: RoutesConstant.home, action: AppRouteAction.replaceAllWith),
        );
      },
    );
  }

  Future<void> reCheck() async {
    updateState({KycFinalPageStateFields.isLoading: true});
    final UserProfileModel userData =
        await _authenticationFirebaseService.getCurrentUser();

    if (userData.status == 'suspended') {
      openKycReject();
      updateState({KycFinalPageStateFields.isLoading: false});
      return;
    }

    if (userData.kycStatus == StaticValue.kycStep2HighRisk) {
      showUnderReviewModalBottomSheet(
          NavigationService.navigatorKey.currentContext!);
      updateState({KycFinalPageStateFields.isLoading: false});
      return;
    }

    final ndidAttempt = await _firebaseService.getNdidAttempt();
    if (ndidAttempt == 2 &&
        userData.kycStatus == StaticValue.kycStep3NDIDFail) {
      showNdidSuspendedModalBottomSheet();
      updateState({KycFinalPageStateFields.isLoading: false});
      return;
    }
    firebaseListener();
    updateState({KycFinalPageStateFields.isLoading: false});
  }
}
