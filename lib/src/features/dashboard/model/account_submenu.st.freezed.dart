// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_submenu.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountSubmenuPageState _$AccountSubmenuPageStateFromJson(
    Map<String, dynamic> json) {
  return _AccountSubmenuPageState.fromJson(json);
}

/// @nodoc
mixin _$AccountSubmenuPageState {
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountSubmenuPageStateCopyWith<AccountSubmenuPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSubmenuPageStateCopyWith<$Res> {
  factory $AccountSubmenuPageStateCopyWith(AccountSubmenuPageState value,
          $Res Function(AccountSubmenuPageState) then) =
      _$AccountSubmenuPageStateCopyWithImpl<$Res, AccountSubmenuPageState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AccountSubmenuPageStateCopyWithImpl<$Res,
        $Val extends AccountSubmenuPageState>
    implements $AccountSubmenuPageStateCopyWith<$Res> {
  _$AccountSubmenuPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$AccountSubmenuPageStateImplCopyWith<$Res>
    implements $AccountSubmenuPageStateCopyWith<$Res> {
  factory _$$AccountSubmenuPageStateImplCopyWith(
          _$AccountSubmenuPageStateImpl value,
          $Res Function(_$AccountSubmenuPageStateImpl) then) =
      __$$AccountSubmenuPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$AccountSubmenuPageStateImplCopyWithImpl<$Res>
    extends _$AccountSubmenuPageStateCopyWithImpl<$Res,
        _$AccountSubmenuPageStateImpl>
    implements _$$AccountSubmenuPageStateImplCopyWith<$Res> {
  __$$AccountSubmenuPageStateImplCopyWithImpl(
      _$AccountSubmenuPageStateImpl _value,
      $Res Function(_$AccountSubmenuPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$AccountSubmenuPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountSubmenuPageStateImpl implements _AccountSubmenuPageState {
  const _$AccountSubmenuPageStateImpl({this.isLoading = false});

  factory _$AccountSubmenuPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountSubmenuPageStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AccountSubmenuPageState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountSubmenuPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountSubmenuPageStateImplCopyWith<_$AccountSubmenuPageStateImpl>
      get copyWith => __$$AccountSubmenuPageStateImplCopyWithImpl<
          _$AccountSubmenuPageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountSubmenuPageStateImplToJson(
      this,
    );
  }
}

abstract class _AccountSubmenuPageState implements AccountSubmenuPageState {
  const factory _AccountSubmenuPageState({final bool isLoading}) =
      _$AccountSubmenuPageStateImpl;

  factory _AccountSubmenuPageState.fromJson(Map<String, dynamic> json) =
      _$AccountSubmenuPageStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AccountSubmenuPageStateImplCopyWith<_$AccountSubmenuPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
