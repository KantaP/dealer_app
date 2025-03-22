// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_value.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountValueModelImpl _$$BankAccountValueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankAccountValueModelImpl(
      bankName: json['bank_name'] as String? ?? '',
      bankAccountNo: json['bank_account_number'] as String? ?? '',
      bankAccountName: json['bank_account_name'] as String? ?? '',
      bankAccountBranch: json['bank_account_branch'] as String? ?? '',
      bankCode: json['bank_code'] as String? ?? '',
    );

Map<String, dynamic> _$$BankAccountValueModelImplToJson(
        _$BankAccountValueModelImpl instance) =>
    <String, dynamic>{
      'bank_name': instance.bankName,
      'bank_account_number': instance.bankAccountNo,
      'bank_account_name': instance.bankAccountName,
      'bank_account_branch': instance.bankAccountBranch,
      'bank_code': instance.bankCode,
    };
