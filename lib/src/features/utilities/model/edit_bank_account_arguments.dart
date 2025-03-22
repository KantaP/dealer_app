import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/model/request_user_bank_account.m.dart';

class EditBankAccountArguments {
  final int index;
  final UserBankAccountModel bankData;

  EditBankAccountArguments({required this.index, required this.bankData});
}
