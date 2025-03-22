// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_update_amlo_status.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestUpdateAmloStatusModel _$RequestUpdateAmloStatusModelFromJson(
    Map<String, dynamic> json) {
  return _RequestUpdateAmloStatusModel.fromJson(json);
}

/// @nodoc
mixin _$RequestUpdateAmloStatusModel {
  String get identificationId => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestUpdateAmloStatusModelCopyWith<RequestUpdateAmloStatusModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestUpdateAmloStatusModelCopyWith<$Res> {
  factory $RequestUpdateAmloStatusModelCopyWith(
          RequestUpdateAmloStatusModel value,
          $Res Function(RequestUpdateAmloStatusModel) then) =
      _$RequestUpdateAmloStatusModelCopyWithImpl<$Res,
          RequestUpdateAmloStatusModel>;
  @useResult
  $Res call({String identificationId, String? uid});
}

/// @nodoc
class _$RequestUpdateAmloStatusModelCopyWithImpl<$Res,
        $Val extends RequestUpdateAmloStatusModel>
    implements $RequestUpdateAmloStatusModelCopyWith<$Res> {
  _$RequestUpdateAmloStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identificationId = null,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      identificationId: null == identificationId
          ? _value.identificationId
          : identificationId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestUpdateAmloStatusModelImplCopyWith<$Res>
    implements $RequestUpdateAmloStatusModelCopyWith<$Res> {
  factory _$$RequestUpdateAmloStatusModelImplCopyWith(
          _$RequestUpdateAmloStatusModelImpl value,
          $Res Function(_$RequestUpdateAmloStatusModelImpl) then) =
      __$$RequestUpdateAmloStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identificationId, String? uid});
}

/// @nodoc
class __$$RequestUpdateAmloStatusModelImplCopyWithImpl<$Res>
    extends _$RequestUpdateAmloStatusModelCopyWithImpl<$Res,
        _$RequestUpdateAmloStatusModelImpl>
    implements _$$RequestUpdateAmloStatusModelImplCopyWith<$Res> {
  __$$RequestUpdateAmloStatusModelImplCopyWithImpl(
      _$RequestUpdateAmloStatusModelImpl _value,
      $Res Function(_$RequestUpdateAmloStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identificationId = null,
    Object? uid = freezed,
  }) {
    return _then(_$RequestUpdateAmloStatusModelImpl(
      identificationId: null == identificationId
          ? _value.identificationId
          : identificationId // ignore: cast_nullable_to_non_nullable
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
class _$RequestUpdateAmloStatusModelImpl
    implements _RequestUpdateAmloStatusModel {
  const _$RequestUpdateAmloStatusModelImpl(
      {required this.identificationId, this.uid});

  factory _$RequestUpdateAmloStatusModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestUpdateAmloStatusModelImplFromJson(json);

  @override
  final String identificationId;
  @override
  final String? uid;

  @override
  String toString() {
    return 'RequestUpdateAmloStatusModel(identificationId: $identificationId, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestUpdateAmloStatusModelImpl &&
            (identical(other.identificationId, identificationId) ||
                other.identificationId == identificationId) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, identificationId, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestUpdateAmloStatusModelImplCopyWith<
          _$RequestUpdateAmloStatusModelImpl>
      get copyWith => __$$RequestUpdateAmloStatusModelImplCopyWithImpl<
          _$RequestUpdateAmloStatusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestUpdateAmloStatusModelImplToJson(
      this,
    );
  }
}

abstract class _RequestUpdateAmloStatusModel
    implements RequestUpdateAmloStatusModel {
  const factory _RequestUpdateAmloStatusModel(
      {required final String identificationId,
      final String? uid}) = _$RequestUpdateAmloStatusModelImpl;

  factory _RequestUpdateAmloStatusModel.fromJson(Map<String, dynamic> json) =
      _$RequestUpdateAmloStatusModelImpl.fromJson;

  @override
  String get identificationId;
  @override
  String? get uid;
  @override
  @JsonKey(ignore: true)
  _$$RequestUpdateAmloStatusModelImplCopyWith<
          _$RequestUpdateAmloStatusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
