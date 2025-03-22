import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';

import '../../../model/request_user_bank_account.m.dart';

class SelectBankReceiveCallbackArgument {
  final int index;
  final UserBankAccountModel bankData;

  SelectBankReceiveCallbackArgument(
      {required this.index, required this.bankData});
}
