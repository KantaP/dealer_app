import 'dart:async';
import 'dart:io';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/data/repositories/agentAsDatasource.repo.dart';
import 'package:aconnec_1109_x/src/data/repositories/agentIdpDatasource.repo.dart';
import 'package:aconnec_1109_x/src/data/repositories/idpAsDatasource.repo.dart';
import 'package:aconnec_1109_x/src/data/repositories/idpDatasource.repo.dart';
import 'package:aconnec_1109_x/src/data/repositories/utilityPublicIdpDatasource.repo.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/introduction/model/splash_screen.st.dart';
import 'package:aconnec_1109_x/src/features/introduction/service/di/splash_screen.firebase.dart';
import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/model/idp_as.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

@lazySingleton
@injectable
class SplashScreenViewModel extends ViewModel {
  final SharedPreferencesHelper _preferencesHelper;
  final SplashScreenFirebaseService _firebaseService;
  final IdpDatasouceRepository _idpDatasouceRepository;
  final IdpAsDatasouceRepository _idpAsDatasouceRepository;
  final UtilityPublicIdpDatasourceRepository
      _utilityPublicIdpDatasourceRepository;
  final AuthenticationFirebaseService _authenticationFirebaseService;
  SplashScreenViewModel(
    this._preferencesHelper,
    this._firebaseService,
    this._idpDatasouceRepository,
    this._idpAsDatasouceRepository,
    this._utilityPublicIdpDatasourceRepository,
    this._authenticationFirebaseService,
  );

  final _stateSubject =
      BehaviorSubject<SplashScreenState>.seeded(SplashScreenState());

  Stream<SplashScreenState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final logger = Logger('splash_viewmodel');
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

  Future<void> checkAuth() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      await _authenticationFirebaseService.requestNotificationPermission();
      final passFirstTime = await _preferencesHelper.getPassFirstTime();
      if (passFirstTime == null || passFirstTime == false) {
        showGettingStarted();
        return;
      }

      User? currentUser = _firebaseService.currentUser();
      final bool? loggedIn = await _preferencesHelper.getLoggedIn();
      if (currentUser != null && loggedIn == true && loggedIn != null) {
        final user = await _authenticationFirebaseService.getCurrentUser();
        if (user.uid.isEmpty) {
          _preferencesHelper.setLoggedIn(false);
          Future.delayed(
            const Duration(milliseconds: 1000),
            () {
              NavigationService.toReplacementAllNamed(
                  RoutesConstant.welcomBack);
              return;
            },
          );
          return;
        }
        if (user.actionSetPin == 1) {
          final result = await confirmPin();
          if (result) {
            NavigationService.toReplacementAllNamed(RoutesConstant.home);
            return;
          } else {
            _preferencesHelper.setLoggedIn(false);
            NavigationService.toReplacementAllNamed(RoutesConstant.welcomBack);
            return;
          }
        } else {
          final result = await NavigationService.toNamed(RoutesConstant.setPin);
          await Future.delayed(const Duration(milliseconds: 500));
          NavigationService.toReplacementAllNamed(RoutesConstant.home);
        }
      } else {
        NavigationService.toReplacementAllNamed(RoutesConstant.welcomBack);
        return;
      }
    } catch (e) {
      // print(e.toString());
      NavigationService.toReplacementAllNamed(RoutesConstant.welcomBack);
      return;
    }
  }

  void showGettingStarted() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      _routesSubject.add(const AppRouteSpec(
          name: RoutesConstant.gettingStarted,
          action: AppRouteAction.replaceAllWith));
    });
  }

  Future<void> initStaticData() async {
    await Future.delayed(const Duration(seconds: 2));
    await _preferencesHelper.setPublicIdpLoaded(false);
    await _preferencesHelper.setAgentIdpLoaded(false);
    await _preferencesHelper.setIdpAsLoaded(false);
    await _preferencesHelper.setAgentAsLoaded(false);
    await _preferencesHelper.setUtilityPublicIdpLoaded(false);

    try {
      // public idp
      bool checked = await _preferencesHelper.getPublicIdpLoaded() ?? false;
      // bool checked = false;
      if (checked == false) {
        await _idpDatasouceRepository.deleteAll();
        List<IdpModel> data = await _firebaseService.onCallRPPublicIdp();
        // print(data.length);
        for (final item in data) {
          await _idpDatasouceRepository.insert(item);
        }
        await _preferencesHelper.setPublicIdpLoaded(true);
      }
    } catch (e) {}

    // try {
    //   //agent idp
    //   bool checked = await _preferencesHelper.getAgentIdpLoaded() ?? false;
    //   // bool checked = false;
    //   if (checked == false) {
    //     await _agentIdpDatasourceRepository.deleteAll();
    //     List<IdpModel> data = await _firebaseService.onCallRPAgentdp();

    //     for (final item in data) {
    //       await _agentIdpDatasourceRepository.insert(item);
    //     }
    //     await _preferencesHelper.setAgentIdpLoaded(true);
    //   }
    // } catch (e) {}

    try {
      //idp as
      bool checked = await _preferencesHelper.getIdpAsLoaded() ?? false;
      // bool checked = false;
      if (checked == false) {
        await _idpAsDatasouceRepository.deleteAll();
        List<IdpAsModel> data = await _firebaseService.onCallRpIdpAs();
        for (final item in data) {
          await _idpAsDatasouceRepository.insert(item);
        }
        await _preferencesHelper.setIdpAsLoaded(true);
      }
    } catch (e) {}

    // try {
    //   //agent as
    //   bool checked = await _preferencesHelper.getAgentAsLoaded() ?? false;

    //   // bool checked = false;
    //   if (checked == false) {
    //     await _idpAsDatasouceRepository.deleteAll();
    //     List<IdpAsModel> data = await _firebaseService.onCallRpAgentAs();
    //     for (final item in data) {
    //       await _idpAsDatasouceRepository.insert(item);
    //     }
    //     await _preferencesHelper.setAgentAsLoaded(true);
    //   }
    // } catch (e) {}

    try {
      //utility public idp without identifier
      // await _utilityPublicIdpDatasourceRepository.deleteAll();
      bool checked =
          await _preferencesHelper.getUtilityPublicIdpLoaded() ?? false;
      // bool checked = false;
      if (checked == false) {
        await _utilityPublicIdpDatasourceRepository.deleteAll();
        List<UtilityIdpIdentifierModel> data =
            await _firebaseService.onCallRpUtilityPublicIdp();

        for (final item in data) {
          // print(UtilityIdpIdentifierModelPersistence().toJson(item));
          await _utilityPublicIdpDatasourceRepository.insert(item);
        }
        await _preferencesHelper.setUtilityPublicIdpLoaded(true);
      }
    } catch (e) {}

    return;
  }

  Future<bool> confirmPin() async {
    final callback = await NavigationService.toNamed(RoutesConstant.enterPin);
    await Future.delayed(const Duration(milliseconds: 500));
    final mappedCallback = callback as Map<String, dynamic>;
    if (mappedCallback['result']) {
      return true;
    }
    return false;
  }

  Future<bool> checkRoot() async {
    final bool enableRootDetect =
        FlavorConfig.instance.variables['enable_root_detect'];
    if (enableRootDetect) {
      if (Platform.isAndroid) {
        bool developerMode = await FlutterJailbreakDetection.developerMode;
        if (developerMode) {
          DialogUtils.showToast(
              msg: 'Don\'t allow developer mode.', type: 'error');
          return false;
        }
      } else if (Platform.isIOS) {
        bool jailbroken = await FlutterJailbreakDetection.jailbroken;
        if (jailbroken) {
          DialogUtils.showToast(
              msg: 'Don\'t allow jailbreak device.', type: 'error');
          return false;
        }
      }
    }

    return true;
  }
}
