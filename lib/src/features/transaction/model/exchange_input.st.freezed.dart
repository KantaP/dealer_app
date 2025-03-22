// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_input.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExchangeInputState {
  String get numberOfCount => throw _privateConstructorUsedError;
  double get equalTo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExchangeInputStateCopyWith<ExchangeInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeInputStateCopyWith<$Res> {
  factory $ExchangeInputStateCopyWith(
          ExchangeInputState value, $Res Function(ExchangeInputState) then) =
      _$ExchangeInputStateCopyWithImpl<$Res, ExchangeInputState>;
  @useResult
  $Res call({String numberOfCount, double equalTo});
}

/// @nodoc
class _$ExchangeInputStateCopyWithImpl<$Res, $Val extends ExchangeInputState>
    implements $ExchangeInputStateCopyWith<$Res> {
  _$ExchangeInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfCount = null,
    Object? equalTo = null,
  }) {
    return _then(_value.copyWith(
      numberOfCount: null == numberOfCount
          ? _value.numberOfCount
          : numberOfCount // ignore: cast_nullable_to_non_nullable
              as String,
      equalTo: null == equalTo
          ? _value.equalTo
          : equalTo // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExchangeInputStateImplCopyWith<$Res>
    implements $ExchangeInputStateCopyWith<$Res> {
  factory _$$ExchangeInputStateImplCopyWith(_$ExchangeInputStateImpl value,
          $Res Function(_$ExchangeInputStateImpl) then) =
      __$$ExchangeInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String numberOfCount, double equalTo});
}

/// @nodoc
class __$$ExchangeInputStateImplCopyWithImpl<$Res>
    extends _$ExchangeInputStateCopyWithImpl<$Res, _$ExchangeInputStateImpl>
    implements _$$ExchangeInputStateImplCopyWith<$Res> {
  __$$ExchangeInputStateImplCopyWithImpl(_$ExchangeInputStateImpl _value,
      $Res Function(_$ExchangeInputStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfCount = null,
    Object? equalTo = null,
  }) {
    return _then(_$ExchangeInputStateImpl(
      numberOfCount: null == numberOfCount
          ? _value.numberOfCount
          : numberOfCount // ignore: cast_nullable_to_non_nullable
              as String,
      equalTo: null == equalTo
          ? _value.equalTo
          : equalTo // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ExchangeInputStateImpl implements _ExchangeInputState {
  const _$ExchangeInputStateImpl(
      {this.numberOfCount = '0', this.equalTo = 0.00});

  @override
  @JsonKey()
  final String numberOfCount;
  @override
  @JsonKey()
  final double equalTo;

  @override
  String toString() {
    return 'ExchangeInputState(numberOfCount: $numberOfCount, equalTo: $equalTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeInputStateImpl &&
            (identical(other.numberOfCount, numberOfCount) ||
                other.numberOfCount == numberOfCount) &&
            (identical(other.equalTo, equalTo) || other.equalTo == equalTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, numberOfCount, equalTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeInputStateImplCopyWith<_$ExchangeInputStateImpl> get copyWith =>
      __$$ExchangeInputStateImplCopyWithImpl<_$ExchangeInputStateImpl>(
          this, _$identity);
}

abstract class _ExchangeInputState implements ExchangeInputState {
  const factory _ExchangeInputState(
      {final String numberOfCount,
      final double equalTo}) = _$ExchangeInputStateImpl;

  @override
  String get numberOfCount;
  @override
  double get equalTo;
  @override
  @JsonKey(ignore: true)
  _$$ExchangeInputStateImplCopyWith<_$ExchangeInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
