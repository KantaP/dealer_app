import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';

import '../../../model/request_user_bank_account.m.dart';

class SelectPaymentCallbackArgument {
  final int index;
  final UserBankAccountModel bankData;

  SelectPaymentCallbackArgument({required this.index, required this.bankData});
}
