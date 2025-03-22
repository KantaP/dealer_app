import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_user_bank_account.m.freezed.dart';
part 'request_user_bank_account.m.g.dart';

@freezed
class UserBankAccountModel with _$UserBankAccountModel {
  const factory UserBankAccountModel({
    @JsonKey(name: 'bank_account_name') @Default('') String bankAccountName,
    @JsonKey(name: 'bank_account_number') @Default('') String bankAccountNumber,
    @JsonKey(name: 'branch_code') @Default('') String branchCode,
    @JsonKey(name: 'bank_name') @Default('') String bankName,
    @JsonKey(name: 'bank_status') @Default('') String bankStatus,
    @JsonKey(name: 'remark') @Default('') String remark,
    @JsonKey(name: 'verified_date') @Default('') String verifiedDate,
    @JsonKey(name: 'verified_by') @Default('') String verifiedBy,
    @JsonKey(name: 'book_bank_storage_path')
    @Default('')
    String bookBankStoragePath,
    @JsonKey(name: 'bank_code') @Default('') String bankCode,
  }) = _UserBankAccountModel;

  factory UserBankAccountModel.fromJson(Map<String, Object?> json) =>
      _$UserBankAccountModelFromJson(json);
}
