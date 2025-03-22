// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bank_account.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserBankAccountPageState {
  List<UserBankAccountModel> get banks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserBankAccountPageStateCopyWith<UserBankAccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBankAccountPageStateCopyWith<$Res> {
  factory $UserBankAccountPageStateCopyWith(UserBankAccountPageState value,
          $Res Function(UserBankAccountPageState) then) =
      _$UserBankAccountPageStateCopyWithImpl<$Res, UserBankAccountPageState>;
  @useResult
  $Res call({List<UserBankAccountModel> banks});
}

/// @nodoc
class _$UserBankAccountPageStateCopyWithImpl<$Res,
        $Val extends UserBankAccountPageState>
    implements $UserBankAccountPageStateCopyWith<$Res> {
  _$UserBankAccountPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banks = null,
  }) {
    return _then(_value.copyWith(
      banks: null == banks
          ? _value.banks
          : banks // ignore: cast_nullable_to_non_nullable
              as List<UserBankAccountModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBankAccountPageStateImplCopyWith<$Res>
    implements $UserBankAccountPageStateCopyWith<$Res> {
  factory _$$UserBankAccountPageStateImplCopyWith(
          _$UserBankAccountPageStateImpl value,
          $Res Function(_$UserBankAccountPageStateImpl) then) =
      __$$UserBankAccountPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserBankAccountModel> banks});
}

/// @nodoc
class __$$UserBankAccountPageStateImplCopyWithImpl<$Res>
    extends _$UserBankAccountPageStateCopyWithImpl<$Res,
        _$UserBankAccountPageStateImpl>
    implements _$$UserBankAccountPageStateImplCopyWith<$Res> {
  __$$UserBankAccountPageStateImplCopyWithImpl(
      _$UserBankAccountPageStateImpl _value,
      $Res Function(_$UserBankAccountPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banks = null,
  }) {
    return _then(_$UserBankAccountPageStateImpl(
      banks: null == banks
          ? _value._banks
          : banks // ignore: cast_nullable_to_non_nullable
              as List<UserBankAccountModel>,
    ));
  }
}

/// @nodoc

class _$UserBankAccountPageStateImpl implements _UserBankAccountPageState {
  const _$UserBankAccountPageStateImpl(
      {final List<UserBankAccountModel> banks = const []})
      : _banks = banks;

  final List<UserBankAccountModel> _banks;
  @override
  @JsonKey()
  List<UserBankAccountModel> get banks {
    if (_banks is EqualUnmodifiableListView) return _banks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banks);
  }

  @override
  String toString() {
    return 'UserBankAccountPageState(banks: $banks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBankAccountPageStateImpl &&
            const DeepCollectionEquality().equals(other._banks, _banks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_banks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBankAccountPageStateImplCopyWith<_$UserBankAccountPageStateImpl>
      get copyWith => __$$UserBankAccountPageStateImplCopyWithImpl<
          _$UserBankAccountPageStateImpl>(this, _$identity);
}

abstract class _UserBankAccountPageState implements UserBankAccountPageState {
  const factory _UserBankAccountPageState(
          {final List<UserBankAccountModel> banks}) =
      _$UserBankAccountPageStateImpl;

  @override
  List<UserBankAccountModel> get banks;
  @override
  @JsonKey(ignore: true)
  _$$UserBankAccountPageStateImplCopyWith<_$UserBankAccountPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
