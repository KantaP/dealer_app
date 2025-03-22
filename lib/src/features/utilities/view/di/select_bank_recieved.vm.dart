import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/select_bank_receive_arguments.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/select_bank_received.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class SelectBankRecievedViewModel extends ViewModel {
  final AuthenticationFirebaseService _firebaseService;
  SelectBankRecievedViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject<SelectBankReceivedPageState>.seeded(
      SelectBankReceivedPageState());
  Stream<SelectBankReceivedPageState> get state => _stateSubject;

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  Future<void> getMyBanks() async {
    updateState({
      SelectBankReceivedPageStateFields.isLoading: true,
    });
    final user = await _firebaseService.getCurrentUser();
    final bankList = user.bankAccount;
    await Future.delayed(const Duration(milliseconds: 1000));
    updateState({
      SelectBankReceivedPageStateFields.myBanks: bankList,
      SelectBankReceivedPageStateFields.initDone: true,
      SelectBankReceivedPageStateFields.isLoading: false,
    });
  }

  bool validate() {
    final formState = _stateSubject.value;
    if (formState.selectedBank.bankAccountNumber.isEmpty) return false;
    if (formState.selectedBank.bankStatus != 'verified') return false;
    return true;
  }

  void submit() {
    final formState = _stateSubject.value;

    _routesSubject.add(
      AppRouteSpec.pop(
        arguments: SelectBankReceiveCallbackArgument(
          bankData: formState.selectedBank,
          index: formState.myBanks.indexOf(formState.selectedBank),
        ),
      ),
    );
  }

  void addBank() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.addBankAccount));
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }
}
