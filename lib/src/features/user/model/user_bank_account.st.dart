import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/request_user_bank_account.m.dart';

part 'user_bank_account.st.freezed.dart';

@freezed
class UserBankAccountPageState with _$UserBankAccountPageState {
  const factory UserBankAccountPageState({
    @Default([]) List<UserBankAccountModel> banks,
  }) = _UserBankAccountPageState;
}
