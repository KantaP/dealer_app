import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';

import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
// import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class KycLevel2ViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycLevel2ViewModel(this._firebaseService);

  final logger = Logger();

  final _pageStateSubject =
      BehaviorSubject<KycLevel2PageState>.seeded(KycLevel2PageState());
  Stream<KycLevel2PageState> get pageState => _pageStateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  late StreamSubscription<DatabaseEvent> _databaseSubscriber;

  @override
  void dispose() {
    _pageStateSubject.close();
    _routesSubject.close();
    _databaseSubscriber.cancel();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _pageStateSubject.value;
    _pageStateSubject.add(state.copyWith(updateValue));
  }

  void onBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  void listenPageState() {
    // pageState.listen((event) {
    //   if (event.shouldUpdateProgress) {
    //     final state = _pageStateSubject.value;
    //     _firebaseService.setKycLevel2Progress(state)?.then((value) {
    //       logger.i("Update progress kyc");
    //     }).catchError((e) {
    //       logger.e(e);
    //     });
    //     _pageStateSubject.add(state
    //         .copyWith({KycLevel2PageStateFields.shouldUpdateProgress: false}));
    //   }
    // });
  }

  Future<void> getCurrentProgress() async {
    final currentPageState = _pageStateSubject.value;
    if (currentPageState.editMode == true) return;

    updateState({KycLevel2PageStateFields.isLoading: true});
    try {
      final pageState = await _firebaseService.getKycLevel2Progress();
      Future.delayed(const Duration(milliseconds: 500), () {
        updateState({KycLevel2PageStateFields.isLoading: false});
        updateState(KycLevel2PageStatePersistence().toJson(pageState));
        logger.i(KycLevel2PageStatePersistence().toJson(pageState));
        if (pageState.currentStepIndex == 0) {
          if (pageState.firstStepProgress == 25) {
            _pageController.jumpToPage(1);
          }
          if (pageState.firstStepProgress == 50) {
            _pageController.jumpToPage(2);
          }
          if (pageState.firstStepProgress == 75) {
            _pageController.jumpToPage(3);
          }
        }
        if (pageState.currentStepIndex == 1) {
          if (pageState.secondStepProgress == 0) {
            _pageController.jumpToPage(4);
          }
          if (pageState.secondStepProgress == 33) {
            _pageController.jumpToPage(5);
          }
          if (pageState.secondStepProgress == 66) {
            _pageController.jumpToPage(6);
          }
        }

        if (pageState.currentStepIndex == 2) {
          if (pageState.thirdStepProgress == 0) {
            _pageController.jumpToPage(7);
          }
          if (pageState.thirdStepProgress == 25) {
            _pageController.jumpToPage(8);
          }
          if (pageState.thirdStepProgress == 40) {
            _pageController.jumpToPage(9);
          }
          if (pageState.thirdStepProgress == 50) {
            _pageController.jumpToPage(10);
          }
          if (pageState.thirdStepProgress == 55) {
            _pageController.jumpToPage(11);
          }
          if (pageState.thirdStepProgress == 75) {
            _pageController.jumpToPage(12);
          }
          if (pageState.thirdStepProgress == 85) {
            _pageController.jumpToPage(13);
          }
          if (pageState.thirdStepProgress == 90) {
            _pageController.jumpToPage(14);
          }
          if (pageState.thirdStepProgress == 95) {
            _pageController.jumpToPage(15);
          }
          if (pageState.thirdStepProgress == 100) {
            _routesSubject.add(const AppRouteSpec.popUntilRoot());
          }
        }
      });
    } catch (e) {
      updateState({KycLevel2PageStateFields.isLoading: false});
    }
  }

  void firebaseListener() {
    _databaseSubscriber = _firebaseService.onKycLevel2Value().listen((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
        final kycProgress = KycLevel2PageStatePersistence().fromJson(data);
        updateState(KycLevel2PageStatePersistence().toJson(kycProgress));
      }
    });
  }

  void done() {
    _routesSubject.add(const AppRouteSpec.popUntilRoot());
  }

  double getCurrentProgressPercent() {
    final state = _pageStateSubject.value;
    if (state.currentStepIndex == 0) {
      return state.firstStepProgress.toDouble();
    }
    if (state.currentStepIndex == 1) {
      return state.secondStepProgress.toDouble();
    }
    if (state.currentStepIndex == 2) {
      return state.thirdStepProgress.toDouble();
    }
    return 0;
  }

  bool isEditMode() {
    final state = _pageStateSubject.value;
    return state.editMode;
  }
}
