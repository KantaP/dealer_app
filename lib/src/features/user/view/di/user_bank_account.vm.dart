import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/user/model/user_bank_account.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/model/request_user_bank_account.m.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
@Injectable()
class UserBankAccountVieWModel extends CustomViewModel {
  final AuthenticationFirebaseService _authenticationFirebaseService;
  UserBankAccountVieWModel(this._authenticationFirebaseService);

  final _stateSubject =
      BehaviorSubject.seeded(const UserBankAccountPageState());
  Stream<UserBankAccountPageState> get state => _stateSubject;

  @override
  void dispose() {
    // TODO: implement dispose
    _stateSubject.close();
  }

  @override
  void updateState(updateValue) {
    final state = _stateSubject.value;
  }

  Future<List<UserBankAccountModel>> getMyBanks() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final user = await _authenticationFirebaseService.getCurrentUser();
    final bankList = user.bankAccount;

    final newBankList = [...bankList];
    return newBankList;
  }

  Future<void> gotoAddBank() async {
    final result =
        await NavigationService.toNamed(RoutesConstant.addBankAccount);
    return;
  }
}
