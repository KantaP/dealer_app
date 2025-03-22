import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account_value.m.freezed.dart';
part 'bank_account_value.m.g.dart';

@freezed
class BankAccountValueModel with _$BankAccountValueModel {
  const factory BankAccountValueModel({
    @JsonKey(name: 'bank_name') @Default('') String bankName,
    @JsonKey(name: 'bank_account_number') @Default('') String bankAccountNo,
    @JsonKey(name: 'bank_account_name') @Default('') String bankAccountName,
    @JsonKey(name: 'bank_account_branch') @Default('') String bankAccountBranch,
    @JsonKey(name: 'bank_code') @Default('') String bankCode,
  }) = _BankAccountValueModel;

  factory BankAccountValueModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountValueModelFromJson(json);
}
