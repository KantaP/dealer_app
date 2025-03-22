import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/model/request_user_bank_account.m.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../constants/banks.dart';

@singleton
class EditBankAccount extends CustomViewModel {
  //controller
  final TextEditingController bankAccountNameController =
      TextEditingController();
  final TextEditingController bankAccountBranchController =
      TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController bankAccountNumberController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void updateState(updateValue) {
    // TODO: implement updateState
  }

  Future<void> setFormValue(UserBankAccountModel item) async {
    bankAccountNameController.value =
        TextEditingValue(text: item.bankAccountName);
    bankAccountBranchController.value = TextEditingValue(text: item.branchCode);
    bankNameController.value = TextEditingValue(text: item.bankName);
    bankAccountNumberController.value =
        TextEditingValue(text: item.bankAccountNumber);
    return;
  }

  BankItemModel getBankData(String bankCode) {
    final bank = BankData.bankList.where((e) => e.code == bankCode).toList();
    if (bank.isEmpty) {
      return BankItemModel();
    }
    return bank[0];
  }

  String getStoragePath(String fullStoragePath) {
    final splits = fullStoragePath.split('/');
    return '${splits[0]}/${splits[1]}';
  }

  String getFileName(String fullStoragePath) {
    final splits = fullStoragePath.split('/');
    return splits[2];
  }
}
