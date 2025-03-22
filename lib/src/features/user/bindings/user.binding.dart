import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/user/services/user_data.service.dart';
import 'package:aconnec_1109_x/src/features/user/view/di/user_bank_account.vm.dart';
import 'package:aconnec_1109_x/src/features/user/view/di/user_profile.vm.dart';

class UserBinding {
  static UserProfileViewModel get userProfileViewModel =>
      getIt<UserProfileViewModel>();

  static UserBankAccountVieWModel get userBankAccountViewModel =>
      getIt<UserBankAccountVieWModel>();

  static UserDataService get userDataService => getIt<UserDataService>();
}
