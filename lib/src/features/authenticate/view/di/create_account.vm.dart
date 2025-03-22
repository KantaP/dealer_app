import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/features/authenticate/data/repositories/authentication.repo.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/create_account.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class CreateAccountViewModel extends ViewModel {
  final AuthenticationRepository _repository;
  final AuthenticationFirebaseService _service;
  final SharedPreferencesHelper _preferencesHelper;
  CreateAccountViewModel(
      this._repository, this._service, this._preferencesHelper);

  final _stateSubject =
      BehaviorSubject<CreateAccountState>.seeded(CreateAccountState());
  Stream<CreateAccountState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

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

  void _setLoading(bool loading) {
    updateState(<String, dynamic>{CreateAccountFields.isLoading: loading});
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  Future<void> verifyPhoneNumber() async {
    updateState(<String, dynamic>{CreateAccountFields.submit: true});
    if (!_validateForm()) return;
    final state = _stateSubject.value;
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.otpVerification,
        arguments: <String, dynamic>{
          "phoneNumber": "+66${state.mobileNumber}",
          "mode": "createAccount"
        },
      ),
    );
  }

  bool _validateForm() {
    final state = _stateSubject.value;
    if (state.mobileNumber.isEmpty) {
      updateState(<String, dynamic>{
        CreateAccountFields.mobileNumberErrorText:
            S.current.createAccountErrorInputEmpty
      });
      return false;
    }
    if (state.acceptTerm == false) return false;
    return true;
  }
}
