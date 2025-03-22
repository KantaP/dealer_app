import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/app_privacy_policy.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/app_term.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/check_id_card.vm.dart';

import '../view/di/edit_bank_account.vm.dart';
import '../view/di/risk_condition.vm.dart';

class UtilitiesBinding {
  static AppTermViewModel get appTermViewModel => getIt<AppTermViewModel>();
  static AppPrivacyPolicyViewModel get appPrivacyViewModel =>
      getIt<AppPrivacyPolicyViewModel>();

  static CheckIdCardViewModel get checkIdCardViewModel =>
      getIt<CheckIdCardViewModel>();
  static RiskConditionViewModel get riskConditionViewModel =>
      getIt<RiskConditionViewModel>();

  static EditBankAccount get editBankAccount => getIt<EditBankAccount>();
}
