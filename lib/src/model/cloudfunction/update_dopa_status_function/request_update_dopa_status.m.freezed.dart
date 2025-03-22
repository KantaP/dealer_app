// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_update_dopa_status.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestUpdateDopaStatusModel _$RequestUpdateDopaStatusModelFromJson(
    Map<String, dynamic> json) {
  return _RequestUpdateDopaStatusModel.fromJson(json);
}

/// @nodoc
mixin _$RequestUpdateDopaStatusModel {
  String get pid => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get birthDay => throw _privateConstructorUsedError;
  String get laser => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestUpdateDopaStatusModelCopyWith<RequestUpdateDopaStatusModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestUpdateDopaStatusModelCopyWith<$Res> {
  factory $RequestUpdateDopaStatusModelCopyWith(
          RequestUpdateDopaStatusModel value,
          $Res Function(RequestUpdateDopaStatusModel) then) =
      _$RequestUpdateDopaStatusModelCopyWithImpl<$Res,
          RequestUpdateDopaStatusModel>;
  @useResult
  $Res call(
      {String pid,
      String firstName,
      String lastName,
      String birthDay,
      String laser,
      String? uid});
}

/// @nodoc
class _$RequestUpdateDopaStatusModelCopyWithImpl<$Res,
        $Val extends RequestUpdateDopaStatusModel>
    implements $RequestUpdateDopaStatusModelCopyWith<$Res> {
  _$RequestUpdateDopaStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pid = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDay = null,
    Object? laser = null,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      laser: null == laser
          ? _value.laser
          : laser // ignore: cast_nullable_to_non_nullable
              as String,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestUpdateDopaStatusModelImplCopyWith<$Res>
    implements $RequestUpdateDopaStatusModelCopyWith<$Res> {
  factory _$$RequestUpdateDopaStatusModelImplCopyWith(
          _$RequestUpdateDopaStatusModelImpl value,
          $Res Function(_$RequestUpdateDopaStatusModelImpl) then) =
      __$$RequestUpdateDopaStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pid,
      String firstName,
      String lastName,
      String birthDay,
      String laser,
      String? uid});
}

/// @nodoc
class __$$RequestUpdateDopaStatusModelImplCopyWithImpl<$Res>
    extends _$RequestUpdateDopaStatusModelCopyWithImpl<$Res,
        _$RequestUpdateDopaStatusModelImpl>
    implements _$$RequestUpdateDopaStatusModelImplCopyWith<$Res> {
  __$$RequestUpdateDopaStatusModelImplCopyWithImpl(
      _$RequestUpdateDopaStatusModelImpl _value,
      $Res Function(_$RequestUpdateDopaStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pid = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? birthDay = null,
    Object? laser = null,
    Object? uid = freezed,
  }) {
    return _then(_$RequestUpdateDopaStatusModelImpl(
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      laser: null == laser
          ? _value.laser
          : laser // ignore: cast_nullable_to_non_nullable
              as String,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestUpdateDopaStatusModelImpl
    implements _RequestUpdateDopaStatusModel {
  const _$RequestUpdateDopaStatusModelImpl(
      {required this.pid,
      required this.firstName,
      required this.lastName,
      required this.birthDay,
      required this.laser,
      this.uid});

  factory _$RequestUpdateDopaStatusModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestUpdateDopaStatusModelImplFromJson(json);

  @override
  final String pid;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String birthDay;
  @override
  final String laser;
  @override
  final String? uid;

  @override
  String toString() {
    return 'RequestUpdateDopaStatusModel(pid: $pid, firstName: $firstName, lastName: $lastName, birthDay: $birthDay, laser: $laser, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestUpdateDopaStatusModelImpl &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.laser, laser) || other.laser == laser) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pid, firstName, lastName, birthDay, laser, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestUpdateDopaStatusModelImplCopyWith<
          _$RequestUpdateDopaStatusModelImpl>
      get copyWith => __$$RequestUpdateDopaStatusModelImplCopyWithImpl<
          _$RequestUpdateDopaStatusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestUpdateDopaStatusModelImplToJson(
      this,
    );
  }
}

abstract class _RequestUpdateDopaStatusModel
    implements RequestUpdateDopaStatusModel {
  const factory _RequestUpdateDopaStatusModel(
      {required final String pid,
      required final String firstName,
      required final String lastName,
      required final String birthDay,
      required final String laser,
      final String? uid}) = _$RequestUpdateDopaStatusModelImpl;

  factory _RequestUpdateDopaStatusModel.fromJson(Map<String, dynamic> json) =
      _$RequestUpdateDopaStatusModelImpl.fromJson;

  @override
  String get pid;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get birthDay;
  @override
  String get laser;
  @override
  String? get uid;
  @override
  @JsonKey(ignore: true)
  _$$RequestUpdateDopaStatusModelImplCopyWith<
          _$RequestUpdateDopaStatusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
