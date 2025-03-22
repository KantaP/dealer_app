// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_user_sensitive_data.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestUserSensitiveDataModel _$RequestUserSensitiveDataModelFromJson(
    Map<String, dynamic> json) {
  return _RequestUserSensitiveDataModel.fromJson(json);
}

/// @nodoc
mixin _$RequestUserSensitiveDataModel {
  @JsonKey(name: 'pin')
  String get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestUserSensitiveDataModelCopyWith<RequestUserSensitiveDataModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestUserSensitiveDataModelCopyWith<$Res> {
  factory $RequestUserSensitiveDataModelCopyWith(
          RequestUserSensitiveDataModel value,
          $Res Function(RequestUserSensitiveDataModel) then) =
      _$RequestUserSensitiveDataModelCopyWithImpl<$Res,
          RequestUserSensitiveDataModel>;
  @useResult
  $Res call({@JsonKey(name: 'pin') String pin});
}

/// @nodoc
class _$RequestUserSensitiveDataModelCopyWithImpl<$Res,
        $Val extends RequestUserSensitiveDataModel>
    implements $RequestUserSensitiveDataModelCopyWith<$Res> {
  _$RequestUserSensitiveDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
  }) {
    return _then(_value.copyWith(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestUserSensitiveDataModelImplCopyWith<$Res>
    implements $RequestUserSensitiveDataModelCopyWith<$Res> {
  factory _$$RequestUserSensitiveDataModelImplCopyWith(
          _$RequestUserSensitiveDataModelImpl value,
          $Res Function(_$RequestUserSensitiveDataModelImpl) then) =
      __$$RequestUserSensitiveDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'pin') String pin});
}

/// @nodoc
class __$$RequestUserSensitiveDataModelImplCopyWithImpl<$Res>
    extends _$RequestUserSensitiveDataModelCopyWithImpl<$Res,
        _$RequestUserSensitiveDataModelImpl>
    implements _$$RequestUserSensitiveDataModelImplCopyWith<$Res> {
  __$$RequestUserSensitiveDataModelImplCopyWithImpl(
      _$RequestUserSensitiveDataModelImpl _value,
      $Res Function(_$RequestUserSensitiveDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
  }) {
    return _then(_$RequestUserSensitiveDataModelImpl(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestUserSensitiveDataModelImpl
    implements _RequestUserSensitiveDataModel {
  const _$RequestUserSensitiveDataModelImpl(
      {@JsonKey(name: 'pin') required this.pin});

  factory _$RequestUserSensitiveDataModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestUserSensitiveDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'pin')
  final String pin;

  @override
  String toString() {
    return 'RequestUserSensitiveDataModel(pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestUserSensitiveDataModelImpl &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestUserSensitiveDataModelImplCopyWith<
          _$RequestUserSensitiveDataModelImpl>
      get copyWith => __$$RequestUserSensitiveDataModelImplCopyWithImpl<
          _$RequestUserSensitiveDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestUserSensitiveDataModelImplToJson(
      this,
    );
  }
}

abstract class _RequestUserSensitiveDataModel
    implements RequestUserSensitiveDataModel {
  const factory _RequestUserSensitiveDataModel(
          {@JsonKey(name: 'pin') required final String pin}) =
      _$RequestUserSensitiveDataModelImpl;

  factory _RequestUserSensitiveDataModel.fromJson(Map<String, dynamic> json) =
      _$RequestUserSensitiveDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'pin')
  String get pin;
  @override
  @JsonKey(ignore: true)
  _$$RequestUserSensitiveDataModelImplCopyWith<
          _$RequestUserSensitiveDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
