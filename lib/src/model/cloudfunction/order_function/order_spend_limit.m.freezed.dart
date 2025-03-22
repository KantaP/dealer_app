// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_spend_limit.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseOrderSpendLimitModel _$ResponseOrderSpendLimitModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOrderSpendLimitModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOrderSpendLimitModel {
  @JsonKey(name: 'spend_buy_completed')
  double get spendBuyCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'spend_sell_completed')
  double get spendSellCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'spend_buy_incompleted')
  double get spendBuyInCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'spend_sell_incompleted')
  double get spendSellInCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOrderSpendLimitModelCopyWith<ResponseOrderSpendLimitModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOrderSpendLimitModelCopyWith<$Res> {
  factory $ResponseOrderSpendLimitModelCopyWith(
          ResponseOrderSpendLimitModel value,
          $Res Function(ResponseOrderSpendLimitModel) then) =
      _$ResponseOrderSpendLimitModelCopyWithImpl<$Res,
          ResponseOrderSpendLimitModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'spend_buy_completed') double spendBuyCompleted,
      @JsonKey(name: 'spend_sell_completed') double spendSellCompleted,
      @JsonKey(name: 'spend_buy_incompleted') double spendBuyInCompleted,
      @JsonKey(name: 'spend_sell_incompleted') double spendSellInCompleted});
}

/// @nodoc
class _$ResponseOrderSpendLimitModelCopyWithImpl<$Res,
        $Val extends ResponseOrderSpendLimitModel>
    implements $ResponseOrderSpendLimitModelCopyWith<$Res> {
  _$ResponseOrderSpendLimitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendBuyCompleted = null,
    Object? spendSellCompleted = null,
    Object? spendBuyInCompleted = null,
    Object? spendSellInCompleted = null,
  }) {
    return _then(_value.copyWith(
      spendBuyCompleted: null == spendBuyCompleted
          ? _value.spendBuyCompleted
          : spendBuyCompleted // ignore: cast_nullable_to_non_nullable
              as double,
      spendSellCompleted: null == spendSellCompleted
          ? _value.spendSellCompleted
          : spendSellCompleted // ignore: cast_nullable_to_non_nullable
              as double,
      spendBuyInCompleted: null == spendBuyInCompleted
          ? _value.spendBuyInCompleted
          : spendBuyInCompleted // ignore: cast_nullable_to_non_nullable
              as double,
      spendSellInCompleted: null == spendSellInCompleted
          ? _value.spendSellInCompleted
          : spendSellInCompleted // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseOrderSpendLimitModelImplCopyWith<$Res>
    implements $ResponseOrderSpendLimitModelCopyWith<$Res> {
  factory _$$ResponseOrderSpendLimitModelImplCopyWith(
          _$ResponseOrderSpendLimitModelImpl value,
          $Res Function(_$ResponseOrderSpendLimitModelImpl) then) =
      __$$ResponseOrderSpendLimitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'spend_buy_completed') double spendBuyCompleted,
      @JsonKey(name: 'spend_sell_completed') double spendSellCompleted,
      @JsonKey(name: 'spend_buy_incompleted') double spendBuyInCompleted,
      @JsonKey(name: 'spend_sell_incompleted') double spendSellInCompleted});
}

/// @nodoc
class __$$ResponseOrderSpendLimitModelImplCopyWithImpl<$Res>
    extends _$ResponseOrderSpendLimitModelCopyWithImpl<$Res,
        _$ResponseOrderSpendLimitModelImpl>
    implements _$$ResponseOrderSpendLimitModelImplCopyWith<$Res> {
  __$$ResponseOrderSpendLimitModelImplCopyWithImpl(
      _$ResponseOrderSpendLimitModelImpl _value,
      $Res Function(_$ResponseOrderSpendLimitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendBuyCompleted = null,
    Object? spendSellCompleted = null,
    Object? spendBuyInCompleted = null,
    Object? spendSellInCompleted = null,
  }) {
    return _then(_$ResponseOrderSpendLimitModelImpl(
      spendBuyCompleted: null == spendBuyCompleted
          ? _value.spendBuyCompleted
          : spendBuyCompleted // ignore: cast_nullable_to_non_nullable
              as double,
      spendSellCompleted: null == spendSellCompleted
          ? _value.spendSellCompleted
          : spendSellCompleted // ignore: cast_nullable_to_non_nullable
              as double,
      spendBuyInCompleted: null == spendBuyInCompleted
          ? _value.spendBuyInCompleted
          : spendBuyInCompleted // ignore: cast_nullable_to_non_nullable
              as double,
      spendSellInCompleted: null == spendSellInCompleted
          ? _value.spendSellInCompleted
          : spendSellInCompleted // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseOrderSpendLimitModelImpl
    implements _ResponseOrderSpendLimitModel {
  const _$ResponseOrderSpendLimitModelImpl(
      {@JsonKey(name: 'spend_buy_completed') this.spendBuyCompleted = 0,
      @JsonKey(name: 'spend_sell_completed') this.spendSellCompleted = 0,
      @JsonKey(name: 'spend_buy_incompleted') this.spendBuyInCompleted = 0,
      @JsonKey(name: 'spend_sell_incompleted') this.spendSellInCompleted = 0});

  factory _$ResponseOrderSpendLimitModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseOrderSpendLimitModelImplFromJson(json);

  @override
  @JsonKey(name: 'spend_buy_completed')
  final double spendBuyCompleted;
  @override
  @JsonKey(name: 'spend_sell_completed')
  final double spendSellCompleted;
  @override
  @JsonKey(name: 'spend_buy_incompleted')
  final double spendBuyInCompleted;
  @override
  @JsonKey(name: 'spend_sell_incompleted')
  final double spendSellInCompleted;

  @override
  String toString() {
    return 'ResponseOrderSpendLimitModel(spendBuyCompleted: $spendBuyCompleted, spendSellCompleted: $spendSellCompleted, spendBuyInCompleted: $spendBuyInCompleted, spendSellInCompleted: $spendSellInCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOrderSpendLimitModelImpl &&
            (identical(other.spendBuyCompleted, spendBuyCompleted) ||
                other.spendBuyCompleted == spendBuyCompleted) &&
            (identical(other.spendSellCompleted, spendSellCompleted) ||
                other.spendSellCompleted == spendSellCompleted) &&
            (identical(other.spendBuyInCompleted, spendBuyInCompleted) ||
                other.spendBuyInCompleted == spendBuyInCompleted) &&
            (identical(other.spendSellInCompleted, spendSellInCompleted) ||
                other.spendSellInCompleted == spendSellInCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, spendBuyCompleted,
      spendSellCompleted, spendBuyInCompleted, spendSellInCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOrderSpendLimitModelImplCopyWith<
          _$ResponseOrderSpendLimitModelImpl>
      get copyWith => __$$ResponseOrderSpendLimitModelImplCopyWithImpl<
          _$ResponseOrderSpendLimitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOrderSpendLimitModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOrderSpendLimitModel
    implements ResponseOrderSpendLimitModel {
  const factory _ResponseOrderSpendLimitModel(
      {@JsonKey(name: 'spend_buy_completed') final double spendBuyCompleted,
      @JsonKey(name: 'spend_sell_completed') final double spendSellCompleted,
      @JsonKey(name: 'spend_buy_incompleted') final double spendBuyInCompleted,
      @JsonKey(name: 'spend_sell_incompleted')
      final double spendSellInCompleted}) = _$ResponseOrderSpendLimitModelImpl;

  factory _ResponseOrderSpendLimitModel.fromJson(Map<String, dynamic> json) =
      _$ResponseOrderSpendLimitModelImpl.fromJson;

  @override
  @JsonKey(name: 'spend_buy_completed')
  double get spendBuyCompleted;
  @override
  @JsonKey(name: 'spend_sell_completed')
  double get spendSellCompleted;
  @override
  @JsonKey(name: 'spend_buy_incompleted')
  double get spendBuyInCompleted;
  @override
  @JsonKey(name: 'spend_sell_incompleted')
  double get spendSellInCompleted;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOrderSpendLimitModelImplCopyWith<
          _$ResponseOrderSpendLimitModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestOrderSpendLimitModel _$RequestOrderSpendLimitModelFromJson(
    Map<String, dynamic> json) {
  return _RequestOrderSpendLimitModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderSpendLimitModel {
  @JsonKey(name: 'id_user')
  String get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'timezone')
  int get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOrderSpendLimitModelCopyWith<RequestOrderSpendLimitModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderSpendLimitModelCopyWith<$Res> {
  factory $RequestOrderSpendLimitModelCopyWith(
          RequestOrderSpendLimitModel value,
          $Res Function(RequestOrderSpendLimitModel) then) =
      _$RequestOrderSpendLimitModelCopyWithImpl<$Res,
          RequestOrderSpendLimitModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') String idUser,
      @JsonKey(name: 'timezone') int timezone});
}

/// @nodoc
class _$RequestOrderSpendLimitModelCopyWithImpl<$Res,
        $Val extends RequestOrderSpendLimitModel>
    implements $RequestOrderSpendLimitModelCopyWith<$Res> {
  _$RequestOrderSpendLimitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? timezone = null,
  }) {
    return _then(_value.copyWith(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOrderSpendLimitModelImplCopyWith<$Res>
    implements $RequestOrderSpendLimitModelCopyWith<$Res> {
  factory _$$RequestOrderSpendLimitModelImplCopyWith(
          _$RequestOrderSpendLimitModelImpl value,
          $Res Function(_$RequestOrderSpendLimitModelImpl) then) =
      __$$RequestOrderSpendLimitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') String idUser,
      @JsonKey(name: 'timezone') int timezone});
}

/// @nodoc
class __$$RequestOrderSpendLimitModelImplCopyWithImpl<$Res>
    extends _$RequestOrderSpendLimitModelCopyWithImpl<$Res,
        _$RequestOrderSpendLimitModelImpl>
    implements _$$RequestOrderSpendLimitModelImplCopyWith<$Res> {
  __$$RequestOrderSpendLimitModelImplCopyWithImpl(
      _$RequestOrderSpendLimitModelImpl _value,
      $Res Function(_$RequestOrderSpendLimitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? timezone = null,
  }) {
    return _then(_$RequestOrderSpendLimitModelImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderSpendLimitModelImpl
    implements _RequestOrderSpendLimitModel {
  const _$RequestOrderSpendLimitModelImpl(
      {@JsonKey(name: 'id_user') this.idUser = '',
      @JsonKey(name: 'timezone') this.timezone = 0});

  factory _$RequestOrderSpendLimitModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestOrderSpendLimitModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_user')
  final String idUser;
  @override
  @JsonKey(name: 'timezone')
  final int timezone;

  @override
  String toString() {
    return 'RequestOrderSpendLimitModel(idUser: $idUser, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderSpendLimitModelImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idUser, timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderSpendLimitModelImplCopyWith<_$RequestOrderSpendLimitModelImpl>
      get copyWith => __$$RequestOrderSpendLimitModelImplCopyWithImpl<
          _$RequestOrderSpendLimitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderSpendLimitModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderSpendLimitModel
    implements RequestOrderSpendLimitModel {
  const factory _RequestOrderSpendLimitModel(
          {@JsonKey(name: 'id_user') final String idUser,
          @JsonKey(name: 'timezone') final int timezone}) =
      _$RequestOrderSpendLimitModelImpl;

  factory _RequestOrderSpendLimitModel.fromJson(Map<String, dynamic> json) =
      _$RequestOrderSpendLimitModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_user')
  String get idUser;
  @override
  @JsonKey(name: 'timezone')
  int get timezone;
  @override
  @JsonKey(ignore: true)
  _$$RequestOrderSpendLimitModelImplCopyWith<_$RequestOrderSpendLimitModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
