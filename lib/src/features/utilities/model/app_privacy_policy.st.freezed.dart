// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_privacy_policy.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppPrivacyPolicyPageState _$AppPrivacyPolicyPageStateFromJson(
    Map<String, dynamic> json) {
  return _AppPrivacyPolicyPageState.fromJson(json);
}

/// @nodoc
mixin _$AppPrivacyPolicyPageState {
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppPrivacyPolicyPageStateCopyWith<AppPrivacyPolicyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPrivacyPolicyPageStateCopyWith<$Res> {
  factory $AppPrivacyPolicyPageStateCopyWith(AppPrivacyPolicyPageState value,
          $Res Function(AppPrivacyPolicyPageState) then) =
      _$AppPrivacyPolicyPageStateCopyWithImpl<$Res, AppPrivacyPolicyPageState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AppPrivacyPolicyPageStateCopyWithImpl<$Res,
        $Val extends AppPrivacyPolicyPageState>
    implements $AppPrivacyPolicyPageStateCopyWith<$Res> {
  _$AppPrivacyPolicyPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$AppPrivacyPolicyPageStateImplCopyWith<$Res>
    implements $AppPrivacyPolicyPageStateCopyWith<$Res> {
  factory _$$AppPrivacyPolicyPageStateImplCopyWith(
          _$AppPrivacyPolicyPageStateImpl value,
          $Res Function(_$AppPrivacyPolicyPageStateImpl) then) =
      __$$AppPrivacyPolicyPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$AppPrivacyPolicyPageStateImplCopyWithImpl<$Res>
    extends _$AppPrivacyPolicyPageStateCopyWithImpl<$Res,
        _$AppPrivacyPolicyPageStateImpl>
    implements _$$AppPrivacyPolicyPageStateImplCopyWith<$Res> {
  __$$AppPrivacyPolicyPageStateImplCopyWithImpl(
      _$AppPrivacyPolicyPageStateImpl _value,
      $Res Function(_$AppPrivacyPolicyPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$AppPrivacyPolicyPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppPrivacyPolicyPageStateImpl implements _AppPrivacyPolicyPageState {
  const _$AppPrivacyPolicyPageStateImpl({this.isLoading = false});

  factory _$AppPrivacyPolicyPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppPrivacyPolicyPageStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AppPrivacyPolicyPageState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPrivacyPolicyPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPrivacyPolicyPageStateImplCopyWith<_$AppPrivacyPolicyPageStateImpl>
      get copyWith => __$$AppPrivacyPolicyPageStateImplCopyWithImpl<
          _$AppPrivacyPolicyPageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppPrivacyPolicyPageStateImplToJson(
      this,
    );
  }
}

abstract class _AppPrivacyPolicyPageState implements AppPrivacyPolicyPageState {
  const factory _AppPrivacyPolicyPageState({final bool isLoading}) =
      _$AppPrivacyPolicyPageStateImpl;

  factory _AppPrivacyPolicyPageState.fromJson(Map<String, dynamic> json) =
      _$AppPrivacyPolicyPageStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AppPrivacyPolicyPageStateImplCopyWith<_$AppPrivacyPolicyPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
