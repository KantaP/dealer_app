// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_manage_submenu.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountManageSubmenuPageState _$AccountManageSubmenuPageStateFromJson(
    Map<String, dynamic> json) {
  return _AccountManageSubmenuPageState.fromJson(json);
}

/// @nodoc
mixin _$AccountManageSubmenuPageState {
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountManageSubmenuPageStateCopyWith<AccountManageSubmenuPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountManageSubmenuPageStateCopyWith<$Res> {
  factory $AccountManageSubmenuPageStateCopyWith(
          AccountManageSubmenuPageState value,
          $Res Function(AccountManageSubmenuPageState) then) =
      _$AccountManageSubmenuPageStateCopyWithImpl<$Res,
          AccountManageSubmenuPageState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AccountManageSubmenuPageStateCopyWithImpl<$Res,
        $Val extends AccountManageSubmenuPageState>
    implements $AccountManageSubmenuPageStateCopyWith<$Res> {
  _$AccountManageSubmenuPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$AccountManageSubmenuPageStateImplCopyWith<$Res>
    implements $AccountManageSubmenuPageStateCopyWith<$Res> {
  factory _$$AccountManageSubmenuPageStateImplCopyWith(
          _$AccountManageSubmenuPageStateImpl value,
          $Res Function(_$AccountManageSubmenuPageStateImpl) then) =
      __$$AccountManageSubmenuPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$AccountManageSubmenuPageStateImplCopyWithImpl<$Res>
    extends _$AccountManageSubmenuPageStateCopyWithImpl<$Res,
        _$AccountManageSubmenuPageStateImpl>
    implements _$$AccountManageSubmenuPageStateImplCopyWith<$Res> {
  __$$AccountManageSubmenuPageStateImplCopyWithImpl(
      _$AccountManageSubmenuPageStateImpl _value,
      $Res Function(_$AccountManageSubmenuPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$AccountManageSubmenuPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountManageSubmenuPageStateImpl
    implements _AccountManageSubmenuPageState {
  const _$AccountManageSubmenuPageStateImpl({this.isLoading = false});

  factory _$AccountManageSubmenuPageStateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AccountManageSubmenuPageStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AccountManageSubmenuPageState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountManageSubmenuPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountManageSubmenuPageStateImplCopyWith<
          _$AccountManageSubmenuPageStateImpl>
      get copyWith => __$$AccountManageSubmenuPageStateImplCopyWithImpl<
          _$AccountManageSubmenuPageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountManageSubmenuPageStateImplToJson(
      this,
    );
  }
}

abstract class _AccountManageSubmenuPageState
    implements AccountManageSubmenuPageState {
  const factory _AccountManageSubmenuPageState({final bool isLoading}) =
      _$AccountManageSubmenuPageStateImpl;

  factory _AccountManageSubmenuPageState.fromJson(Map<String, dynamic> json) =
      _$AccountManageSubmenuPageStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AccountManageSubmenuPageStateImplCopyWith<
          _$AccountManageSubmenuPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
