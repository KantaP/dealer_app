import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/user/bindings/user.binding.dart';
import 'package:aconnec_1109_x/src/features/user/services/user_data.service.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/check_id_card.st.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
@Injectable()
class CheckIdCardViewModel extends CustomViewModel<CheckIdCardPageState> {
  final UserDataService userDataService = UserBinding.userDataService;
  final KycFirebaseService _kycFirebaseService;

  CheckIdCardViewModel(this._kycFirebaseService);

  final stateSubject =
      CustomStreamSubject<CheckIdCardPageState>(const CheckIdCardPageState());

  @override
  void dispose() {
    stateSubject.dispose();
  }

  @override
  void updateState(CheckIdCardPageState updateValue) {
    stateSubject.subject.add(updateValue);
  }

  Future<void> checkIdCard() async {
    try {
      final personalInformation =
          await _kycFirebaseService.getIdCardInformation();
      final state = stateSubject.subject.value;
      final encryptedIdCard = EncryptedUtils.encrypt(state.idCard);
      if (personalInformation!.idCard == encryptedIdCard) {
        NavigationService.back(NavigationResult(true));
      } else {
        DialogUtils.showToast(msg: 'เลขบัตรประชาชนไม่ถูกต้อง', type: 'error');
      }
    } on Exception catch (e) {
      DialogUtils.showToast(msg: e.toString(), type: 'error');
    }
  }

  Future<bool> onWillPop() async {
    FocusScope.of(NavigationService.navigatorKey.currentContext!).unfocus();
    NavigationService.back(NavigationResult(false));
    return false;
  }
}
