// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_spend_limit.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSpendLimitModel _$UserSpendLimitModelFromJson(Map<String, dynamic> json) {
  return _UserSpendLimitModel.fromJson(json);
}

/// @nodoc
mixin _$UserSpendLimitModel {
  @JsonKey(name: 'spend_limit_buy')
  double get spendLimitBuy => throw _privateConstructorUsedError;
  @JsonKey(name: 'spend_limit_sell')
  double get spendLimitSell => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSpendLimitModelCopyWith<UserSpendLimitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSpendLimitModelCopyWith<$Res> {
  factory $UserSpendLimitModelCopyWith(
          UserSpendLimitModel value, $Res Function(UserSpendLimitModel) then) =
      _$UserSpendLimitModelCopyWithImpl<$Res, UserSpendLimitModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'spend_limit_buy') double spendLimitBuy,
      @JsonKey(name: 'spend_limit_sell') double spendLimitSell});
}

/// @nodoc
class _$UserSpendLimitModelCopyWithImpl<$Res, $Val extends UserSpendLimitModel>
    implements $UserSpendLimitModelCopyWith<$Res> {
  _$UserSpendLimitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendLimitBuy = null,
    Object? spendLimitSell = null,
  }) {
    return _then(_value.copyWith(
      spendLimitBuy: null == spendLimitBuy
          ? _value.spendLimitBuy
          : spendLimitBuy // ignore: cast_nullable_to_non_nullable
              as double,
      spendLimitSell: null == spendLimitSell
          ? _value.spendLimitSell
          : spendLimitSell // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSpendLimitModelImplCopyWith<$Res>
    implements $UserSpendLimitModelCopyWith<$Res> {
  factory _$$UserSpendLimitModelImplCopyWith(_$UserSpendLimitModelImpl value,
          $Res Function(_$UserSpendLimitModelImpl) then) =
      __$$UserSpendLimitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'spend_limit_buy') double spendLimitBuy,
      @JsonKey(name: 'spend_limit_sell') double spendLimitSell});
}

/// @nodoc
class __$$UserSpendLimitModelImplCopyWithImpl<$Res>
    extends _$UserSpendLimitModelCopyWithImpl<$Res, _$UserSpendLimitModelImpl>
    implements _$$UserSpendLimitModelImplCopyWith<$Res> {
  __$$UserSpendLimitModelImplCopyWithImpl(_$UserSpendLimitModelImpl _value,
      $Res Function(_$UserSpendLimitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendLimitBuy = null,
    Object? spendLimitSell = null,
  }) {
    return _then(_$UserSpendLimitModelImpl(
      spendLimitBuy: null == spendLimitBuy
          ? _value.spendLimitBuy
          : spendLimitBuy // ignore: cast_nullable_to_non_nullable
              as double,
      spendLimitSell: null == spendLimitSell
          ? _value.spendLimitSell
          : spendLimitSell // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSpendLimitModelImpl implements _UserSpendLimitModel {
  const _$UserSpendLimitModelImpl(
      {@JsonKey(name: 'spend_limit_buy') this.spendLimitBuy = 0,
      @JsonKey(name: 'spend_limit_sell') this.spendLimitSell = 0});

  factory _$UserSpendLimitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSpendLimitModelImplFromJson(json);

  @override
  @JsonKey(name: 'spend_limit_buy')
  final double spendLimitBuy;
  @override
  @JsonKey(name: 'spend_limit_sell')
  final double spendLimitSell;

  @override
  String toString() {
    return 'UserSpendLimitModel(spendLimitBuy: $spendLimitBuy, spendLimitSell: $spendLimitSell)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSpendLimitModelImpl &&
            (identical(other.spendLimitBuy, spendLimitBuy) ||
                other.spendLimitBuy == spendLimitBuy) &&
            (identical(other.spendLimitSell, spendLimitSell) ||
                other.spendLimitSell == spendLimitSell));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, spendLimitBuy, spendLimitSell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSpendLimitModelImplCopyWith<_$UserSpendLimitModelImpl> get copyWith =>
      __$$UserSpendLimitModelImplCopyWithImpl<_$UserSpendLimitModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSpendLimitModelImplToJson(
      this,
    );
  }
}

abstract class _UserSpendLimitModel implements UserSpendLimitModel {
  const factory _UserSpendLimitModel(
          {@JsonKey(name: 'spend_limit_buy') final double spendLimitBuy,
          @JsonKey(name: 'spend_limit_sell') final double spendLimitSell}) =
      _$UserSpendLimitModelImpl;

  factory _UserSpendLimitModel.fromJson(Map<String, dynamic> json) =
      _$UserSpendLimitModelImpl.fromJson;

  @override
  @JsonKey(name: 'spend_limit_buy')
  double get spendLimitBuy;
  @override
  @JsonKey(name: 'spend_limit_sell')
  double get spendLimitSell;
  @override
  @JsonKey(ignore: true)
  _$$UserSpendLimitModelImplCopyWith<_$UserSpendLimitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
