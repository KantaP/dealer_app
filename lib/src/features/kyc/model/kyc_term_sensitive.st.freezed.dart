// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_term_sensitive.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KycTermSensitivePageState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KycTermSensitivePageStateCopyWith<KycTermSensitivePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycTermSensitivePageStateCopyWith<$Res> {
  factory $KycTermSensitivePageStateCopyWith(KycTermSensitivePageState value,
          $Res Function(KycTermSensitivePageState) then) =
      _$KycTermSensitivePageStateCopyWithImpl<$Res, KycTermSensitivePageState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$KycTermSensitivePageStateCopyWithImpl<$Res,
        $Val extends KycTermSensitivePageState>
    implements $KycTermSensitivePageStateCopyWith<$Res> {
  _$KycTermSensitivePageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$KycTermSensitivePageStateImplCopyWith<$Res>
    implements $KycTermSensitivePageStateCopyWith<$Res> {
  factory _$$KycTermSensitivePageStateImplCopyWith(
          _$KycTermSensitivePageStateImpl value,
          $Res Function(_$KycTermSensitivePageStateImpl) then) =
      __$$KycTermSensitivePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$KycTermSensitivePageStateImplCopyWithImpl<$Res>
    extends _$KycTermSensitivePageStateCopyWithImpl<$Res,
        _$KycTermSensitivePageStateImpl>
    implements _$$KycTermSensitivePageStateImplCopyWith<$Res> {
  __$$KycTermSensitivePageStateImplCopyWithImpl(
      _$KycTermSensitivePageStateImpl _value,
      $Res Function(_$KycTermSensitivePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$KycTermSensitivePageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$KycTermSensitivePageStateImpl implements _KycTermSensitivePageState {
  const _$KycTermSensitivePageStateImpl({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'KycTermSensitivePageState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycTermSensitivePageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KycTermSensitivePageStateImplCopyWith<_$KycTermSensitivePageStateImpl>
      get copyWith => __$$KycTermSensitivePageStateImplCopyWithImpl<
          _$KycTermSensitivePageStateImpl>(this, _$identity);
}

abstract class _KycTermSensitivePageState implements KycTermSensitivePageState {
  const factory _KycTermSensitivePageState({final bool isLoading}) =
      _$KycTermSensitivePageStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$KycTermSensitivePageStateImplCopyWith<_$KycTermSensitivePageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
