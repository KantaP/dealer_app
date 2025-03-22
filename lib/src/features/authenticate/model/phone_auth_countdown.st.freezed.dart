// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_auth_countdown.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneAuthCountdownState {
  int get retryCountdown => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneAuthCountdownStateCopyWith<PhoneAuthCountdownState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneAuthCountdownStateCopyWith<$Res> {
  factory $PhoneAuthCountdownStateCopyWith(PhoneAuthCountdownState value,
          $Res Function(PhoneAuthCountdownState) then) =
      _$PhoneAuthCountdownStateCopyWithImpl<$Res, PhoneAuthCountdownState>;
  @useResult
  $Res call({int retryCountdown});
}

/// @nodoc
class _$PhoneAuthCountdownStateCopyWithImpl<$Res,
        $Val extends PhoneAuthCountdownState>
    implements $PhoneAuthCountdownStateCopyWith<$Res> {
  _$PhoneAuthCountdownStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retryCountdown = null,
  }) {
    return _then(_value.copyWith(
      retryCountdown: null == retryCountdown
          ? _value.retryCountdown
          : retryCountdown // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneAuthCountdownStateImplCopyWith<$Res>
    implements $PhoneAuthCountdownStateCopyWith<$Res> {
  factory _$$PhoneAuthCountdownStateImplCopyWith(
          _$PhoneAuthCountdownStateImpl value,
          $Res Function(_$PhoneAuthCountdownStateImpl) then) =
      __$$PhoneAuthCountdownStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int retryCountdown});
}

/// @nodoc
class __$$PhoneAuthCountdownStateImplCopyWithImpl<$Res>
    extends _$PhoneAuthCountdownStateCopyWithImpl<$Res,
        _$PhoneAuthCountdownStateImpl>
    implements _$$PhoneAuthCountdownStateImplCopyWith<$Res> {
  __$$PhoneAuthCountdownStateImplCopyWithImpl(
      _$PhoneAuthCountdownStateImpl _value,
      $Res Function(_$PhoneAuthCountdownStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retryCountdown = null,
  }) {
    return _then(_$PhoneAuthCountdownStateImpl(
      retryCountdown: null == retryCountdown
          ? _value.retryCountdown
          : retryCountdown // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PhoneAuthCountdownStateImpl implements _PhoneAuthCountdownState {
  const _$PhoneAuthCountdownStateImpl({this.retryCountdown = 0});

  @override
  @JsonKey()
  final int retryCountdown;

  @override
  String toString() {
    return 'PhoneAuthCountdownState(retryCountdown: $retryCountdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneAuthCountdownStateImpl &&
            (identical(other.retryCountdown, retryCountdown) ||
                other.retryCountdown == retryCountdown));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retryCountdown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneAuthCountdownStateImplCopyWith<_$PhoneAuthCountdownStateImpl>
      get copyWith => __$$PhoneAuthCountdownStateImplCopyWithImpl<
          _$PhoneAuthCountdownStateImpl>(this, _$identity);
}

abstract class _PhoneAuthCountdownState implements PhoneAuthCountdownState {
  const factory _PhoneAuthCountdownState({final int retryCountdown}) =
      _$PhoneAuthCountdownStateImpl;

  @override
  int get retryCountdown;
  @override
  @JsonKey(ignore: true)
  _$$PhoneAuthCountdownStateImplCopyWith<_$PhoneAuthCountdownStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
