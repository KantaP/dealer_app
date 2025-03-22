import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_level_1.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class KycLevel1ViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycLevel1ViewModel(this._firebaseService);

  final logger = Logger();

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject =
      BehaviorSubject<KycLevel1PageState>.seeded(KycLevel1PageState());
  Stream<KycLevel1PageState> get state => _stateSubject;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
  late StreamSubscription<DatabaseEvent> _databaseSubscriber;

  @override
  void dispose() {
    _databaseSubscriber.cancel();
    _routesSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void onBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  void listenPageState() {
    state.listen((event) {
      if (event.shouldUpdateProgress) {
        final state = _stateSubject.value;
        _firebaseService.setKycLevel1Progress(state)?.then((value) {
          logger.i('Update progress kyc');
        }).catchError((e) {
          logger.e(e);
        });
        updateState({KycLevel1PageStateFields.shouldUpdateProgress: false});
      }
    });
  }

  Future<void> getCurrentProgress() async {
    updateState({KycLevel1PageStateFields.isLoading: true});
    try {
      final pageState = await _firebaseService.getKycLevel1Progress();
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          updateState({KycLevel1PageStateFields.isLoading: false});
          if (pageState.currentStepIndex == 0) {
            _pageController.jumpToPage(0);
          }
          if (pageState.currentStepIndex == 1) {
            _pageController.jumpToPage(1);
          }
        },
      );
    } catch (e) {
      print(e);
      updateState({KycLevel1PageStateFields.isLoading: false});
    }
  }

  void firebaseListener() {
    _databaseSubscriber = _firebaseService.onKycLevel1Value().listen((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
        final kycProgress = KycLevel1PageStatePersistence().fromJson(data);
        updateState(KycLevel1PageStatePersistence().toJson(kycProgress));
      }
    });
  }

  double getCurrentProgressPercent() {
    final state = _stateSubject.value;
    if (state.currentStepIndex == 0) {
      return state.firstStepProgress.toDouble();
    }
    if (state.currentStepIndex == 1) {
      return state.secondStepProgress.toDouble();
    }
    return 0;
  }
}
