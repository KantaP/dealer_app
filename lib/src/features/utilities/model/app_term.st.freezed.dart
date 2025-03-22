// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_term.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppTermPageState _$AppTermPageStateFromJson(Map<String, dynamic> json) {
  return _AppTermPageState.fromJson(json);
}

/// @nodoc
mixin _$AppTermPageState {
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppTermPageStateCopyWith<AppTermPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppTermPageStateCopyWith<$Res> {
  factory $AppTermPageStateCopyWith(
          AppTermPageState value, $Res Function(AppTermPageState) then) =
      _$AppTermPageStateCopyWithImpl<$Res, AppTermPageState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AppTermPageStateCopyWithImpl<$Res, $Val extends AppTermPageState>
    implements $AppTermPageStateCopyWith<$Res> {
  _$AppTermPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$AppTermPageStateImplCopyWith<$Res>
    implements $AppTermPageStateCopyWith<$Res> {
  factory _$$AppTermPageStateImplCopyWith(_$AppTermPageStateImpl value,
          $Res Function(_$AppTermPageStateImpl) then) =
      __$$AppTermPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$AppTermPageStateImplCopyWithImpl<$Res>
    extends _$AppTermPageStateCopyWithImpl<$Res, _$AppTermPageStateImpl>
    implements _$$AppTermPageStateImplCopyWith<$Res> {
  __$$AppTermPageStateImplCopyWithImpl(_$AppTermPageStateImpl _value,
      $Res Function(_$AppTermPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$AppTermPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppTermPageStateImpl implements _AppTermPageState {
  const _$AppTermPageStateImpl({this.isLoading = false});

  factory _$AppTermPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppTermPageStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AppTermPageState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppTermPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppTermPageStateImplCopyWith<_$AppTermPageStateImpl> get copyWith =>
      __$$AppTermPageStateImplCopyWithImpl<_$AppTermPageStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppTermPageStateImplToJson(
      this,
    );
  }
}

abstract class _AppTermPageState implements AppTermPageState {
  const factory _AppTermPageState({final bool isLoading}) =
      _$AppTermPageStateImpl;

  factory _AppTermPageState.fromJson(Map<String, dynamic> json) =
      _$AppTermPageStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AppTermPageStateImplCopyWith<_$AppTermPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
