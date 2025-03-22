// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_list_screen.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoinListScreenPageState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoinListScreenPageStateCopyWith<CoinListScreenPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinListScreenPageStateCopyWith<$Res> {
  factory $CoinListScreenPageStateCopyWith(CoinListScreenPageState value,
          $Res Function(CoinListScreenPageState) then) =
      _$CoinListScreenPageStateCopyWithImpl<$Res, CoinListScreenPageState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$CoinListScreenPageStateCopyWithImpl<$Res,
        $Val extends CoinListScreenPageState>
    implements $CoinListScreenPageStateCopyWith<$Res> {
  _$CoinListScreenPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinListScreenPageStateImplCopyWith<$Res>
    implements $CoinListScreenPageStateCopyWith<$Res> {
  factory _$$CoinListScreenPageStateImplCopyWith(
          _$CoinListScreenPageStateImpl value,
          $Res Function(_$CoinListScreenPageStateImpl) then) =
      __$$CoinListScreenPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$CoinListScreenPageStateImplCopyWithImpl<$Res>
    extends _$CoinListScreenPageStateCopyWithImpl<$Res,
        _$CoinListScreenPageStateImpl>
    implements _$$CoinListScreenPageStateImplCopyWith<$Res> {
  __$$CoinListScreenPageStateImplCopyWithImpl(
      _$CoinListScreenPageStateImpl _value,
      $Res Function(_$CoinListScreenPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$CoinListScreenPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CoinListScreenPageStateImpl implements _CoinListScreenPageState {
  const _$CoinListScreenPageStateImpl({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CoinListScreenPageState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinListScreenPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinListScreenPageStateImplCopyWith<_$CoinListScreenPageStateImpl>
      get copyWith => __$$CoinListScreenPageStateImplCopyWithImpl<
          _$CoinListScreenPageStateImpl>(this, _$identity);
}

abstract class _CoinListScreenPageState implements CoinListScreenPageState {
  const factory _CoinListScreenPageState({final bool isLoading}) =
      _$CoinListScreenPageStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CoinListScreenPageStateImplCopyWith<_$CoinListScreenPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
