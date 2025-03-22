import 'dart:async';

import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/main/model/main.st.dart';
import 'package:aconnec_1109_x/src/features/main/view/widgets/modals/view/order_menu_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:animated_svg/animated_svg.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:rxdart/rxdart.dart';

import '../../../authenticate/view/widgets/modal/sign_in_modal_bottom_sheet.dart';

@singleton
@Injectable()
class MainViewModel extends ViewModel {
  final _stateSubject = BehaviorSubject<MainState>.seeded(MainState());
  Stream<MainState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final PageController pageController = PageController();
  final SvgController svgController = AnimatedSvgController();

  @override
  void dispose() {
    // _stateSubject.close();
    // _routesSubject.close();
    pageController.dispose();
    svgController.dispose();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  Future<void> onTapMenu(int index) async {
    if (index == 3) {
      final isAuth = await authGuard();
      if (!isAuth) {
        // showSigninModalBottomSheet();
        NavigationService.toNamed(RoutesConstant.signUpWithPassword);
        return;
      }
    }
    updateState({
      MainPageFields.currentIndex: index,
    });
    closeOrderMenu();
    pageController.jumpToPage(index);
    return;
  }

  Future<void> showOrderMenu() async {
    final authService = AuthenticateBinding.authenticationFirebaseService;
    final checked = await authService.isAnonymously();
    if (checked) {
      NavigationService.toNamed(RoutesConstant.signUpWithPassword);
      return;
    }
    final state = _stateSubject.value;
    updateState({MainPageFields.openOrderMenu: !state.openOrderMenu});
  }

  Future<bool> closeOrderMenu() async {
    final state = _stateSubject.value;
    if (state.openOrderMenu) {
      updateState({MainPageFields.openOrderMenu: false});
      svgController.reverse();
      return true;
    }
    return false;
  }

  Future<bool> authGuard() async {
    final authVM = AuthenticateBinding.authenticationFirebaseService;
    try {
      final user = await authVM.getCurrentUser();
      if (user.uid == '') return false;
      return true;
    } catch (e) {
      return false;
    }
  }
}
