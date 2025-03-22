// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_set_pin.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseSetPinModel _$ResponseSetPinModelFromJson(Map<String, dynamic> json) {
  return _ResponseSetPinModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseSetPinModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseSetPinModelCopyWith<ResponseSetPinModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseSetPinModelCopyWith<$Res> {
  factory $ResponseSetPinModelCopyWith(
          ResponseSetPinModel value, $Res Function(ResponseSetPinModel) then) =
      _$ResponseSetPinModelCopyWithImpl<$Res, ResponseSetPinModel>;
  @useResult
  $Res call({@JsonKey(name: 'status') bool status});
}

/// @nodoc
class _$ResponseSetPinModelCopyWithImpl<$Res, $Val extends ResponseSetPinModel>
    implements $ResponseSetPinModelCopyWith<$Res> {
  _$ResponseSetPinModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseSetPinModelImplCopyWith<$Res>
    implements $ResponseSetPinModelCopyWith<$Res> {
  factory _$$ResponseSetPinModelImplCopyWith(_$ResponseSetPinModelImpl value,
          $Res Function(_$ResponseSetPinModelImpl) then) =
      __$$ResponseSetPinModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'status') bool status});
}

/// @nodoc
class __$$ResponseSetPinModelImplCopyWithImpl<$Res>
    extends _$ResponseSetPinModelCopyWithImpl<$Res, _$ResponseSetPinModelImpl>
    implements _$$ResponseSetPinModelImplCopyWith<$Res> {
  __$$ResponseSetPinModelImplCopyWithImpl(_$ResponseSetPinModelImpl _value,
      $Res Function(_$ResponseSetPinModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$ResponseSetPinModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseSetPinModelImpl implements _ResponseSetPinModel {
  const _$ResponseSetPinModelImpl(
      {@JsonKey(name: 'status') required this.status});

  factory _$ResponseSetPinModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseSetPinModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;

  @override
  String toString() {
    return 'ResponseSetPinModel(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseSetPinModelImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseSetPinModelImplCopyWith<_$ResponseSetPinModelImpl> get copyWith =>
      __$$ResponseSetPinModelImplCopyWithImpl<_$ResponseSetPinModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseSetPinModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseSetPinModel implements ResponseSetPinModel {
  const factory _ResponseSetPinModel(
          {@JsonKey(name: 'status') required final bool status}) =
      _$ResponseSetPinModelImpl;

  factory _ResponseSetPinModel.fromJson(Map<String, dynamic> json) =
      _$ResponseSetPinModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$ResponseSetPinModelImplCopyWith<_$ResponseSetPinModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
