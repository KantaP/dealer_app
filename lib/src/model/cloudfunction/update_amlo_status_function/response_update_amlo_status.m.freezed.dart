// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_update_amlo_status.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseUpdateAmloStatusModel _$ResponseUpdateAmloStatusModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseUpdateAmloStatusModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseUpdateAmloStatusModel {
  @JsonKey(name: 'amlo_status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseUpdateAmloStatusModelCopyWith<ResponseUpdateAmloStatusModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseUpdateAmloStatusModelCopyWith<$Res> {
  factory $ResponseUpdateAmloStatusModelCopyWith(
          ResponseUpdateAmloStatusModel value,
          $Res Function(ResponseUpdateAmloStatusModel) then) =
      _$ResponseUpdateAmloStatusModelCopyWithImpl<$Res,
          ResponseUpdateAmloStatusModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'amlo_status') bool status,
      @JsonKey(name: 'message') String message,
      int code});
}

/// @nodoc
class _$ResponseUpdateAmloStatusModelCopyWithImpl<$Res,
        $Val extends ResponseUpdateAmloStatusModel>
    implements $ResponseUpdateAmloStatusModelCopyWith<$Res> {
  _$ResponseUpdateAmloStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseUpdateAmloStatusModelImplCopyWith<$Res>
    implements $ResponseUpdateAmloStatusModelCopyWith<$Res> {
  factory _$$ResponseUpdateAmloStatusModelImplCopyWith(
          _$ResponseUpdateAmloStatusModelImpl value,
          $Res Function(_$ResponseUpdateAmloStatusModelImpl) then) =
      __$$ResponseUpdateAmloStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'amlo_status') bool status,
      @JsonKey(name: 'message') String message,
      int code});
}

/// @nodoc
class __$$ResponseUpdateAmloStatusModelImplCopyWithImpl<$Res>
    extends _$ResponseUpdateAmloStatusModelCopyWithImpl<$Res,
        _$ResponseUpdateAmloStatusModelImpl>
    implements _$$ResponseUpdateAmloStatusModelImplCopyWith<$Res> {
  __$$ResponseUpdateAmloStatusModelImplCopyWithImpl(
      _$ResponseUpdateAmloStatusModelImpl _value,
      $Res Function(_$ResponseUpdateAmloStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$ResponseUpdateAmloStatusModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseUpdateAmloStatusModelImpl
    implements _ResponseUpdateAmloStatusModel {
  const _$ResponseUpdateAmloStatusModelImpl(
      {@JsonKey(name: 'amlo_status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      this.code = 0});

  factory _$ResponseUpdateAmloStatusModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseUpdateAmloStatusModelImplFromJson(json);

  @override
  @JsonKey(name: 'amlo_status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey()
  final int code;

  @override
  String toString() {
    return 'ResponseUpdateAmloStatusModel(status: $status, message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseUpdateAmloStatusModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseUpdateAmloStatusModelImplCopyWith<
          _$ResponseUpdateAmloStatusModelImpl>
      get copyWith => __$$ResponseUpdateAmloStatusModelImplCopyWithImpl<
          _$ResponseUpdateAmloStatusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseUpdateAmloStatusModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseUpdateAmloStatusModel
    implements ResponseUpdateAmloStatusModel {
  const factory _ResponseUpdateAmloStatusModel(
      {@JsonKey(name: 'amlo_status') final bool status,
      @JsonKey(name: 'message') final String message,
      final int code}) = _$ResponseUpdateAmloStatusModelImpl;

  factory _ResponseUpdateAmloStatusModel.fromJson(Map<String, dynamic> json) =
      _$ResponseUpdateAmloStatusModelImpl.fromJson;

  @override
  @JsonKey(name: 'amlo_status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  int get code;
  @override
  @JsonKey(ignore: true)
  _$$ResponseUpdateAmloStatusModelImplCopyWith<
          _$ResponseUpdateAmloStatusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
