// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_value.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankAccountValueModel _$BankAccountValueModelFromJson(
    Map<String, dynamic> json) {
  return _BankAccountValueModel.fromJson(json);
}

/// @nodoc
mixin _$BankAccountValueModel {
  @JsonKey(name: 'bank_name')
  String get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_number')
  String get bankAccountNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_name')
  String get bankAccountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_branch')
  String get bankAccountBranch => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_code')
  String get bankCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountValueModelCopyWith<BankAccountValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountValueModelCopyWith<$Res> {
  factory $BankAccountValueModelCopyWith(BankAccountValueModel value,
          $Res Function(BankAccountValueModel) then) =
      _$BankAccountValueModelCopyWithImpl<$Res, BankAccountValueModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bank_name') String bankName,
      @JsonKey(name: 'bank_account_number') String bankAccountNo,
      @JsonKey(name: 'bank_account_name') String bankAccountName,
      @JsonKey(name: 'bank_account_branch') String bankAccountBranch,
      @JsonKey(name: 'bank_code') String bankCode});
}

/// @nodoc
class _$BankAccountValueModelCopyWithImpl<$Res,
        $Val extends BankAccountValueModel>
    implements $BankAccountValueModelCopyWith<$Res> {
  _$BankAccountValueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? bankAccountNo = null,
    Object? bankAccountName = null,
    Object? bankAccountBranch = null,
    Object? bankCode = null,
  }) {
    return _then(_value.copyWith(
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountNo: null == bankAccountNo
          ? _value.bankAccountNo
          : bankAccountNo // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountName: null == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountBranch: null == bankAccountBranch
          ? _value.bankAccountBranch
          : bankAccountBranch // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankAccountValueModelImplCopyWith<$Res>
    implements $BankAccountValueModelCopyWith<$Res> {
  factory _$$BankAccountValueModelImplCopyWith(
          _$BankAccountValueModelImpl value,
          $Res Function(_$BankAccountValueModelImpl) then) =
      __$$BankAccountValueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bank_name') String bankName,
      @JsonKey(name: 'bank_account_number') String bankAccountNo,
      @JsonKey(name: 'bank_account_name') String bankAccountName,
      @JsonKey(name: 'bank_account_branch') String bankAccountBranch,
      @JsonKey(name: 'bank_code') String bankCode});
}

/// @nodoc
class __$$BankAccountValueModelImplCopyWithImpl<$Res>
    extends _$BankAccountValueModelCopyWithImpl<$Res,
        _$BankAccountValueModelImpl>
    implements _$$BankAccountValueModelImplCopyWith<$Res> {
  __$$BankAccountValueModelImplCopyWithImpl(_$BankAccountValueModelImpl _value,
      $Res Function(_$BankAccountValueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? bankAccountNo = null,
    Object? bankAccountName = null,
    Object? bankAccountBranch = null,
    Object? bankCode = null,
  }) {
    return _then(_$BankAccountValueModelImpl(
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountNo: null == bankAccountNo
          ? _value.bankAccountNo
          : bankAccountNo // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountName: null == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountBranch: null == bankAccountBranch
          ? _value.bankAccountBranch
          : bankAccountBranch // ignore: cast_nullable_to_non_nullable
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
class _$BankAccountValueModelImpl implements _BankAccountValueModel {
  const _$BankAccountValueModelImpl(
      {@JsonKey(name: 'bank_name') this.bankName = '',
      @JsonKey(name: 'bank_account_number') this.bankAccountNo = '',
      @JsonKey(name: 'bank_account_name') this.bankAccountName = '',
      @JsonKey(name: 'bank_account_branch') this.bankAccountBranch = '',
      @JsonKey(name: 'bank_code') this.bankCode = ''});

  factory _$BankAccountValueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountValueModelImplFromJson(json);

  @override
  @JsonKey(name: 'bank_name')
  final String bankName;
  @override
  @JsonKey(name: 'bank_account_number')
  final String bankAccountNo;
  @override
  @JsonKey(name: 'bank_account_name')
  final String bankAccountName;
  @override
  @JsonKey(name: 'bank_account_branch')
  final String bankAccountBranch;
  @override
  @JsonKey(name: 'bank_code')
  final String bankCode;

  @override
  String toString() {
    return 'BankAccountValueModel(bankName: $bankName, bankAccountNo: $bankAccountNo, bankAccountName: $bankAccountName, bankAccountBranch: $bankAccountBranch, bankCode: $bankCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountValueModelImpl &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankAccountNo, bankAccountNo) ||
                other.bankAccountNo == bankAccountNo) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountBranch, bankAccountBranch) ||
                other.bankAccountBranch == bankAccountBranch) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bankName, bankAccountNo,
      bankAccountName, bankAccountBranch, bankCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountValueModelImplCopyWith<_$BankAccountValueModelImpl>
      get copyWith => __$$BankAccountValueModelImplCopyWithImpl<
          _$BankAccountValueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountValueModelImplToJson(
      this,
    );
  }
}

abstract class _BankAccountValueModel implements BankAccountValueModel {
  const factory _BankAccountValueModel(
          {@JsonKey(name: 'bank_name') final String bankName,
          @JsonKey(name: 'bank_account_number') final String bankAccountNo,
          @JsonKey(name: 'bank_account_name') final String bankAccountName,
          @JsonKey(name: 'bank_account_branch') final String bankAccountBranch,
          @JsonKey(name: 'bank_code') final String bankCode}) =
      _$BankAccountValueModelImpl;

  factory _BankAccountValueModel.fromJson(Map<String, dynamic> json) =
      _$BankAccountValueModelImpl.fromJson;

  @override
  @JsonKey(name: 'bank_name')
  String get bankName;
  @override
  @JsonKey(name: 'bank_account_number')
  String get bankAccountNo;
  @override
  @JsonKey(name: 'bank_account_name')
  String get bankAccountName;
  @override
  @JsonKey(name: 'bank_account_branch')
  String get bankAccountBranch;
  @override
  @JsonKey(name: 'bank_code')
  String get bankCode;
  @override
  @JsonKey(ignore: true)
  _$$BankAccountValueModelImplCopyWith<_$BankAccountValueModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
