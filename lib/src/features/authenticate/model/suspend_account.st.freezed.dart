// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suspend_account.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuspendAccountPageState _$SuspendAccountPageStateFromJson(
    Map<String, dynamic> json) {
  return _SuspendAccountPageState.fromJson(json);
}

/// @nodoc
mixin _$SuspendAccountPageState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAccept => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuspendAccountPageStateCopyWith<SuspendAccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuspendAccountPageStateCopyWith<$Res> {
  factory $SuspendAccountPageStateCopyWith(SuspendAccountPageState value,
          $Res Function(SuspendAccountPageState) then) =
      _$SuspendAccountPageStateCopyWithImpl<$Res, SuspendAccountPageState>;
  @useResult
  $Res call({bool isLoading, bool isAccept});
}

/// @nodoc
class _$SuspendAccountPageStateCopyWithImpl<$Res,
        $Val extends SuspendAccountPageState>
    implements $SuspendAccountPageStateCopyWith<$Res> {
  _$SuspendAccountPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isAccept = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccept: null == isAccept
          ? _value.isAccept
          : isAccept // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuspendAccountPageStateImplCopyWith<$Res>
    implements $SuspendAccountPageStateCopyWith<$Res> {
  factory _$$SuspendAccountPageStateImplCopyWith(
          _$SuspendAccountPageStateImpl value,
          $Res Function(_$SuspendAccountPageStateImpl) then) =
      __$$SuspendAccountPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isAccept});
}

/// @nodoc
class __$$SuspendAccountPageStateImplCopyWithImpl<$Res>
    extends _$SuspendAccountPageStateCopyWithImpl<$Res,
        _$SuspendAccountPageStateImpl>
    implements _$$SuspendAccountPageStateImplCopyWith<$Res> {
  __$$SuspendAccountPageStateImplCopyWithImpl(
      _$SuspendAccountPageStateImpl _value,
      $Res Function(_$SuspendAccountPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isAccept = null,
  }) {
    return _then(_$SuspendAccountPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccept: null == isAccept
          ? _value.isAccept
          : isAccept // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuspendAccountPageStateImpl implements _SuspendAccountPageState {
  const _$SuspendAccountPageStateImpl(
      {this.isLoading = false, this.isAccept = false});

  factory _$SuspendAccountPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuspendAccountPageStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isAccept;

  @override
  String toString() {
    return 'SuspendAccountPageState(isLoading: $isLoading, isAccept: $isAccept)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuspendAccountPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAccept, isAccept) ||
                other.isAccept == isAccept));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isAccept);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuspendAccountPageStateImplCopyWith<_$SuspendAccountPageStateImpl>
      get copyWith => __$$SuspendAccountPageStateImplCopyWithImpl<
          _$SuspendAccountPageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuspendAccountPageStateImplToJson(
      this,
    );
  }
}

abstract class _SuspendAccountPageState implements SuspendAccountPageState {
  const factory _SuspendAccountPageState(
      {final bool isLoading,
      final bool isAccept}) = _$SuspendAccountPageStateImpl;

  factory _SuspendAccountPageState.fromJson(Map<String, dynamic> json) =
      _$SuspendAccountPageStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get isAccept;
  @override
  @JsonKey(ignore: true)
  _$$SuspendAccountPageStateImplCopyWith<_$SuspendAccountPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
