// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_user_bank_account.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBankAccountModelImpl _$$UserBankAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserBankAccountModelImpl(
      bankAccountName: json['bank_account_name'] as String? ?? '',
      bankAccountNumber: json['bank_account_number'] as String? ?? '',
      branchCode: json['branch_code'] as String? ?? '',
      bankName: json['bank_name'] as String? ?? '',
      bankStatus: json['bank_status'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      verifiedDate: json['verified_date'] as String? ?? '',
      verifiedBy: json['verified_by'] as String? ?? '',
      bookBankStoragePath: json['book_bank_storage_path'] as String? ?? '',
      bankCode: json['bank_code'] as String? ?? '',
    );

Map<String, dynamic> _$$UserBankAccountModelImplToJson(
        _$UserBankAccountModelImpl instance) =>
    <String, dynamic>{
      'bank_account_name': instance.bankAccountName,
      'bank_account_number': instance.bankAccountNumber,
      'branch_code': instance.branchCode,
      'bank_name': instance.bankName,
      'bank_status': instance.bankStatus,
      'remark': instance.remark,
      'verified_date': instance.verifiedDate,
      'verified_by': instance.verifiedBy,
      'book_bank_storage_path': instance.bookBankStoragePath,
      'bank_code': instance.bankCode,
    };
