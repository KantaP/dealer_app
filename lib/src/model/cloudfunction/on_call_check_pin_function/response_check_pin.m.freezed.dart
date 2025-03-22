// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_check_pin.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseCheckPinModel _$ResponseCheckPinModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseCheckPinModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseCheckPinModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseCheckPinModelCopyWith<ResponseCheckPinModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCheckPinModelCopyWith<$Res> {
  factory $ResponseCheckPinModelCopyWith(ResponseCheckPinModel value,
          $Res Function(ResponseCheckPinModel) then) =
      _$ResponseCheckPinModelCopyWithImpl<$Res, ResponseCheckPinModel>;
  @useResult
  $Res call({@JsonKey(name: 'status') bool status});
}

/// @nodoc
class _$ResponseCheckPinModelCopyWithImpl<$Res,
        $Val extends ResponseCheckPinModel>
    implements $ResponseCheckPinModelCopyWith<$Res> {
  _$ResponseCheckPinModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ResponseCheckPinModelImplCopyWith<$Res>
    implements $ResponseCheckPinModelCopyWith<$Res> {
  factory _$$ResponseCheckPinModelImplCopyWith(
          _$ResponseCheckPinModelImpl value,
          $Res Function(_$ResponseCheckPinModelImpl) then) =
      __$$ResponseCheckPinModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'status') bool status});
}

/// @nodoc
class __$$ResponseCheckPinModelImplCopyWithImpl<$Res>
    extends _$ResponseCheckPinModelCopyWithImpl<$Res,
        _$ResponseCheckPinModelImpl>
    implements _$$ResponseCheckPinModelImplCopyWith<$Res> {
  __$$ResponseCheckPinModelImplCopyWithImpl(_$ResponseCheckPinModelImpl _value,
      $Res Function(_$ResponseCheckPinModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$ResponseCheckPinModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseCheckPinModelImpl implements _ResponseCheckPinModel {
  const _$ResponseCheckPinModelImpl(
      {@JsonKey(name: 'status') required this.status});

  factory _$ResponseCheckPinModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseCheckPinModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;

  @override
  String toString() {
    return 'ResponseCheckPinModel(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseCheckPinModelImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseCheckPinModelImplCopyWith<_$ResponseCheckPinModelImpl>
      get copyWith => __$$ResponseCheckPinModelImplCopyWithImpl<
          _$ResponseCheckPinModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseCheckPinModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseCheckPinModel implements ResponseCheckPinModel {
  const factory _ResponseCheckPinModel(
          {@JsonKey(name: 'status') required final bool status}) =
      _$ResponseCheckPinModelImpl;

  factory _ResponseCheckPinModel.fromJson(Map<String, dynamic> json) =
      _$ResponseCheckPinModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$ResponseCheckPinModelImplCopyWith<_$ResponseCheckPinModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
