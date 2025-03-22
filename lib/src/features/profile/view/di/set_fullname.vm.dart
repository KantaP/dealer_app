import 'dart:async';

import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/profile/model/set_fullname.st.dart';
import 'package:aconnec_1109_x/src/features/profile/service/di/user.firebase.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class SetFullnameViewModel extends ViewModel {
  final UserFirebaseService _service;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  SetFullnameViewModel(this._service, this._sharedPreferencesHelper);

  final _stateSubject =
      BehaviorSubject<SetFullnameState>.seeded(SetFullnameState());
  Stream<SetFullnameState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final logger = Logger('set_fullname_logger');

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

  // Future<void> setProfile() async {
  //   updateState(<String, dynamic>{
  //     SetFullnameFields.submit: true,
  //     SetFullnameFields.inputFirstNameError: null,
  //     SetFullnameFields.inputLastNameError: null,
  //   });
  //   Future.delayed(const Duration(milliseconds: 1000));
  //   if (!validate()) return;
  //   final state = _stateSubject.value;
  //   try {
  //     await _service.setProfile(
  //       firstName: state.firstName,
  //       lastName: state.lastName,
  //     );
  //   } catch (e) {
  //     logger.warning(e);
  //     return;
  //   }

  //   _routesSubject.add(const AppRouteSpec(
  //     name: RoutesConstant.createComplete,
  //     action: AppRouteAction.replaceAllWith,
  //   ));
  // }

  bool validate() {
    final state = _stateSubject.value;
    if (state.firstName.trim().isEmpty) {
      updateState(<String, dynamic>{
        SetFullnameFields.inputFirstNameError:
            S.current.setFullnameFirstNameEmptyError,
      });
      return false;
    }
    if (state.lastName.trim().isEmpty) {
      updateState(<String, dynamic>{
        SetFullnameFields.inputLastNameError:
            S.current.setFullnameLastNameEmptyError,
      });
      return false;
    }
    return true;
  }
}
