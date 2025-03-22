import 'dart:async';

import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/widgets/pop_up_setpin_success.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/set_pin.st.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.p.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class SetPinViewModel extends ViewModel {
  final AuthenticationFirebaseService _service;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  SetPinViewModel(this._service, this._sharedPreferencesHelper);

  final _stateSubject = BehaviorSubject<SetPinState>.seeded(SetPinState());

  Stream<SetPinState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _pageStateSubject =
      BehaviorSubject<SetPinPageState>.seeded(SetPinPageState());

  Stream<SetPinPageState> get pageState => _pageStateSubject;

  late StreamSubscription<DatabaseEvent> databaseSubscriber;
  final logger = Logger('set_pin_vm');

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
    databaseSubscriber.cancel();
    _pageStateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updatePageState(Map<String, dynamic> updateValue) {
    final state = _pageStateSubject.value;
    _pageStateSubject.add(state.copyWith(updateValue));
  }

  void setPin(String value) {
    final state = _stateSubject.value;
    if (state.pin.length < 6) {
      updateState(<String, dynamic>{
        SetPinFields.pin: state.pin + value,
        SetPinFields.isNotSecurity: false,
      });
      return;
    }
    if (state.confirmPin.length < 6) {
      updateState(<String, dynamic>{
        SetPinFields.confirmPin: state.confirmPin + value,
      });
    }
  }

  void removePin() {
    final state = _stateSubject.value;
    if (state.confirmPin.isNotEmpty) {
      final removedPin =
          state.confirmPin.substring(0, state.confirmPin.length - 1);
      updateState(<String, dynamic>{
        SetPinFields.confirmPin: removedPin,
      });
      return;
    }
    if (state.pin.isNotEmpty) {
      final removedPin = state.pin.substring(0, state.pin.length - 1);
      updateState(<String, dynamic>{
        SetPinFields.pin: removedPin,
      });
    }
  }

  void listenState() {
    state.listen((event) {
      if (event.confirmPinAlready && event.pinAlready) {
        if (event.pin != event.confirmPin) {
          return;
        }

        if (isSecurityPin(event.pin) == false) {
          updateState(<String, dynamic>{
            SetPinFields.pin: '',
            SetPinFields.confirmPin: '',
            SetPinFields.isNotSecurity: true,
          });
          return;
        }
        print('test');
        updatePageState({'isLoading': true});
        // print(event.pin);
        final encrypted = EncryptedUtils.encrypt(event.pin);
        // print(encrypted);
        _service.setPin(encrypted).then(
          (value) {
            print('success');
            updatePageState({'isLoading': false});
            showPopupSetpinSuccess(
              onSubmit: () {
                NavigationService.navigatorKey.currentState!.pop();
                callback();
              },
            );
          },
        ).catchError((e) {
          print(e);
          updatePageState({'isLoading': false});
          DialogUtils.showToast(
              msg: S.current.somethingWentWrong, type: 'error');
          //Sentry.captureException(e);
        });
      }
    });
  }

  void listenFirebaseDB() {
    databaseSubscriber = _service.onUserDBValue().listen((event) {
      if (event.snapshot.value != null) {
        final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);

        final user = UserProfileModelPersistence().fromJson(data);

        // if (user.actionSetPin == 1) {
        //   _routesSubject.add(const AppRouteSpec(
        //       name: RoutesConstant.home,
        //       action: AppRouteAction.replaceAllWith));
        // }
      }
    });
  }

  bool isSecurityPin(String pin) {
    int countSameNumber = 0;
    //not same number
    final firstChar = pin[0];
    for (int i = 1; i < pin.length; i++) {
      if (firstChar == pin[i]) {
        countSameNumber++;
      }
    }
    if (countSameNumber == 5) {
      return false;
    }

    //not ascending number
    int countAscending = 0;
    for (int i = 1; i < pin.length; i++) {
      if (int.parse(firstChar) == (int.parse(pin[i]) - i)) {
        countAscending++;
      }
    }
    if (countAscending == 5) {
      return false;
    }

    //not descending number
    int countDescending = 0;
    for (int i = 1; i < pin.length; i++) {
      if (int.parse(firstChar) == (int.parse(pin[i]) + i)) {
        countDescending++;
      }
    }
    if (countDescending == 5) {
      return false;
    }

    return true;
  }

  Future<void> callback() async {
    _routesSubject.add(
      const AppRouteSpec.pop(
        arguments: {'result': true},
      ),
    );
  }
}
