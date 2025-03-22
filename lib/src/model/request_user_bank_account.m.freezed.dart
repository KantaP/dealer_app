// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_user_bank_account.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBankAccountModel _$UserBankAccountModelFromJson(Map<String, dynamic> json) {
  return _UserBankAccountModel.fromJson(json);
}

/// @nodoc
mixin _$UserBankAccountModel {
  @JsonKey(name: 'bank_account_name')
  String get bankAccountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_number')
  String get bankAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_code')
  String get branchCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_status')
  String get bankStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'remark')
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_date')
  String get verifiedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_by')
  String get verifiedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_bank_storage_path')
  String get bookBankStoragePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_code')
  String get bankCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBankAccountModelCopyWith<UserBankAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBankAccountModelCopyWith<$Res> {
  factory $UserBankAccountModelCopyWith(UserBankAccountModel value,
          $Res Function(UserBankAccountModel) then) =
      _$UserBankAccountModelCopyWithImpl<$Res, UserBankAccountModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bank_account_name') String bankAccountName,
      @JsonKey(name: 'bank_account_number') String bankAccountNumber,
      @JsonKey(name: 'branch_code') String branchCode,
      @JsonKey(name: 'bank_name') String bankName,
      @JsonKey(name: 'bank_status') String bankStatus,
      @JsonKey(name: 'remark') String remark,
      @JsonKey(name: 'verified_date') String verifiedDate,
      @JsonKey(name: 'verified_by') String verifiedBy,
      @JsonKey(name: 'book_bank_storage_path') String bookBankStoragePath,
      @JsonKey(name: 'bank_code') String bankCode});
}

/// @nodoc
class _$UserBankAccountModelCopyWithImpl<$Res,
        $Val extends UserBankAccountModel>
    implements $UserBankAccountModelCopyWith<$Res> {
  _$UserBankAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccountName = null,
    Object? bankAccountNumber = null,
    Object? branchCode = null,
    Object? bankName = null,
    Object? bankStatus = null,
    Object? remark = null,
    Object? verifiedDate = null,
    Object? verifiedBy = null,
    Object? bookBankStoragePath = null,
    Object? bankCode = null,
  }) {
    return _then(_value.copyWith(
      bankAccountName: null == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountNumber: null == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      branchCode: null == branchCode
          ? _value.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankStatus: null == bankStatus
          ? _value.bankStatus
          : bankStatus // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedDate: null == verifiedDate
          ? _value.verifiedDate
          : verifiedDate // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedBy: null == verifiedBy
          ? _value.verifiedBy
          : verifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
      bookBankStoragePath: null == bookBankStoragePath
          ? _value.bookBankStoragePath
          : bookBankStoragePath // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBankAccountModelImplCopyWith<$Res>
    implements $UserBankAccountModelCopyWith<$Res> {
  factory _$$UserBankAccountModelImplCopyWith(_$UserBankAccountModelImpl value,
          $Res Function(_$UserBankAccountModelImpl) then) =
      __$$UserBankAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bank_account_name') String bankAccountName,
      @JsonKey(name: 'bank_account_number') String bankAccountNumber,
      @JsonKey(name: 'branch_code') String branchCode,
      @JsonKey(name: 'bank_name') String bankName,
      @JsonKey(name: 'bank_status') String bankStatus,
      @JsonKey(name: 'remark') String remark,
      @JsonKey(name: 'verified_date') String verifiedDate,
      @JsonKey(name: 'verified_by') String verifiedBy,
      @JsonKey(name: 'book_bank_storage_path') String bookBankStoragePath,
      @JsonKey(name: 'bank_code') String bankCode});
}

/// @nodoc
class __$$UserBankAccountModelImplCopyWithImpl<$Res>
    extends _$UserBankAccountModelCopyWithImpl<$Res, _$UserBankAccountModelImpl>
    implements _$$UserBankAccountModelImplCopyWith<$Res> {
  __$$UserBankAccountModelImplCopyWithImpl(_$UserBankAccountModelImpl _value,
      $Res Function(_$UserBankAccountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccountName = null,
    Object? bankAccountNumber = null,
    Object? branchCode = null,
    Object? bankName = null,
    Object? bankStatus = null,
    Object? remark = null,
    Object? verifiedDate = null,
    Object? verifiedBy = null,
    Object? bookBankStoragePath = null,
    Object? bankCode = null,
  }) {
    return _then(_$UserBankAccountModelImpl(
      bankAccountName: null == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountNumber: null == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      branchCode: null == branchCode
          ? _value.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankStatus: null == bankStatus
          ? _value.bankStatus
          : bankStatus // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedDate: null == verifiedDate
          ? _value.verifiedDate
          : verifiedDate // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedBy: null == verifiedBy
          ? _value.verifiedBy
          : verifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
      bookBankStoragePath: null == bookBankStoragePath
          ? _value.bookBankStoragePath
          : bookBankStoragePath // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBankAccountModelImpl implements _UserBankAccountModel {
  const _$UserBankAccountModelImpl(
      {@JsonKey(name: 'bank_account_name') this.bankAccountName = '',
      @JsonKey(name: 'bank_account_number') this.bankAccountNumber = '',
      @JsonKey(name: 'branch_code') this.branchCode = '',
      @JsonKey(name: 'bank_name') this.bankName = '',
      @JsonKey(name: 'bank_status') this.bankStatus = '',
      @JsonKey(name: 'remark') this.remark = '',
      @JsonKey(name: 'verified_date') this.verifiedDate = '',
      @JsonKey(name: 'verified_by') this.verifiedBy = '',
      @JsonKey(name: 'book_bank_storage_path') this.bookBankStoragePath = '',
      @JsonKey(name: 'bank_code') this.bankCode = ''});

  factory _$UserBankAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBankAccountModelImplFromJson(json);

  @override
  @JsonKey(name: 'bank_account_name')
  final String bankAccountName;
  @override
  @JsonKey(name: 'bank_account_number')
  final String bankAccountNumber;
  @override
  @JsonKey(name: 'branch_code')
  final String branchCode;
  @override
  @JsonKey(name: 'bank_name')
  final String bankName;
  @override
  @JsonKey(name: 'bank_status')
  final String bankStatus;
  @override
  @JsonKey(name: 'remark')
  final String remark;
  @override
  @JsonKey(name: 'verified_date')
  final String verifiedDate;
  @override
  @JsonKey(name: 'verified_by')
  final String verifiedBy;
  @override
  @JsonKey(name: 'book_bank_storage_path')
  final String bookBankStoragePath;
  @override
  @JsonKey(name: 'bank_code')
  final String bankCode;

  @override
  String toString() {
    return 'UserBankAccountModel(bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, branchCode: $branchCode, bankName: $bankName, bankStatus: $bankStatus, remark: $remark, verifiedDate: $verifiedDate, verifiedBy: $verifiedBy, bookBankStoragePath: $bookBankStoragePath, bankCode: $bankCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBankAccountModelImpl &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankStatus, bankStatus) ||
                other.bankStatus == bankStatus) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.verifiedDate, verifiedDate) ||
                other.verifiedDate == verifiedDate) &&
            (identical(other.verifiedBy, verifiedBy) ||
                other.verifiedBy == verifiedBy) &&
            (identical(other.bookBankStoragePath, bookBankStoragePath) ||
                other.bookBankStoragePath == bookBankStoragePath) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bankAccountName,
      bankAccountNumber,
      branchCode,
      bankName,
      bankStatus,
      remark,
      verifiedDate,
      verifiedBy,
      bookBankStoragePath,
      bankCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBankAccountModelImplCopyWith<_$UserBankAccountModelImpl>
      get copyWith =>
          __$$UserBankAccountModelImplCopyWithImpl<_$UserBankAccountModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBankAccountModelImplToJson(
      this,
    );
  }
}

abstract class _UserBankAccountModel implements UserBankAccountModel {
  const factory _UserBankAccountModel(
      {@JsonKey(name: 'bank_account_name') final String bankAccountName,
      @JsonKey(name: 'bank_account_number') final String bankAccountNumber,
      @JsonKey(name: 'branch_code') final String branchCode,
      @JsonKey(name: 'bank_name') final String bankName,
      @JsonKey(name: 'bank_status') final String bankStatus,
      @JsonKey(name: 'remark') final String remark,
      @JsonKey(name: 'verified_date') final String verifiedDate,
      @JsonKey(name: 'verified_by') final String verifiedBy,
      @JsonKey(name: 'book_bank_storage_path') final String bookBankStoragePath,
      @JsonKey(name: 'bank_code')
      final String bankCode}) = _$UserBankAccountModelImpl;

  factory _UserBankAccountModel.fromJson(Map<String, dynamic> json) =
      _$UserBankAccountModelImpl.fromJson;

  @override
  @JsonKey(name: 'bank_account_name')
  String get bankAccountName;
  @override
  @JsonKey(name: 'bank_account_number')
  String get bankAccountNumber;
  @override
  @JsonKey(name: 'branch_code')
  String get branchCode;
  @override
  @JsonKey(name: 'bank_name')
  String get bankName;
  @override
  @JsonKey(name: 'bank_status')
  String get bankStatus;
  @override
  @JsonKey(name: 'remark')
  String get remark;
  @override
  @JsonKey(name: 'verified_date')
  String get verifiedDate;
  @override
  @JsonKey(name: 'verified_by')
  String get verifiedBy;
  @override
  @JsonKey(name: 'book_bank_storage_path')
  String get bookBankStoragePath;
  @override
  @JsonKey(name: 'bank_code')
  String get bankCode;
  @override
  @JsonKey(ignore: true)
  _$$UserBankAccountModelImplCopyWith<_$UserBankAccountModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
