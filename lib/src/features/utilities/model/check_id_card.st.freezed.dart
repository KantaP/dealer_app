// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_id_card.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckIdCardPageState _$CheckIdCardPageStateFromJson(Map<String, dynamic> json) {
  return _CheckIdCardPageState.fromJson(json);
}

/// @nodoc
mixin _$CheckIdCardPageState {
  String get idCard => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckIdCardPageStateCopyWith<CheckIdCardPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckIdCardPageStateCopyWith<$Res> {
  factory $CheckIdCardPageStateCopyWith(CheckIdCardPageState value,
          $Res Function(CheckIdCardPageState) then) =
      _$CheckIdCardPageStateCopyWithImpl<$Res, CheckIdCardPageState>;
  @useResult
  $Res call({String idCard});
}

/// @nodoc
class _$CheckIdCardPageStateCopyWithImpl<$Res,
        $Val extends CheckIdCardPageState>
    implements $CheckIdCardPageStateCopyWith<$Res> {
  _$CheckIdCardPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCard = null,
  }) {
    return _then(_value.copyWith(
      idCard: null == idCard
          ? _value.idCard
          : idCard // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckIdCardPageStateImplCopyWith<$Res>
    implements $CheckIdCardPageStateCopyWith<$Res> {
  factory _$$CheckIdCardPageStateImplCopyWith(_$CheckIdCardPageStateImpl value,
          $Res Function(_$CheckIdCardPageStateImpl) then) =
      __$$CheckIdCardPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idCard});
}

/// @nodoc
class __$$CheckIdCardPageStateImplCopyWithImpl<$Res>
    extends _$CheckIdCardPageStateCopyWithImpl<$Res, _$CheckIdCardPageStateImpl>
    implements _$$CheckIdCardPageStateImplCopyWith<$Res> {
  __$$CheckIdCardPageStateImplCopyWithImpl(_$CheckIdCardPageStateImpl _value,
      $Res Function(_$CheckIdCardPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCard = null,
  }) {
    return _then(_$CheckIdCardPageStateImpl(
      idCard: null == idCard
          ? _value.idCard
          : idCard // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckIdCardPageStateImpl implements _CheckIdCardPageState {
  const _$CheckIdCardPageStateImpl({this.idCard = ''});

  factory _$CheckIdCardPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckIdCardPageStateImplFromJson(json);

  @override
  @JsonKey()
  final String idCard;

  @override
  String toString() {
    return 'CheckIdCardPageState(idCard: $idCard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckIdCardPageStateImpl &&
            (identical(other.idCard, idCard) || other.idCard == idCard));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idCard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckIdCardPageStateImplCopyWith<_$CheckIdCardPageStateImpl>
      get copyWith =>
          __$$CheckIdCardPageStateImplCopyWithImpl<_$CheckIdCardPageStateImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckIdCardPageStateImplToJson(
      this,
    );
  }
}

abstract class _CheckIdCardPageState implements CheckIdCardPageState {
  const factory _CheckIdCardPageState({final String idCard}) =
      _$CheckIdCardPageStateImpl;

  factory _CheckIdCardPageState.fromJson(Map<String, dynamic> json) =
      _$CheckIdCardPageStateImpl.fromJson;

  @override
  String get idCard;
  @override
  @JsonKey(ignore: true)
  _$$CheckIdCardPageStateImplCopyWith<_$CheckIdCardPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
