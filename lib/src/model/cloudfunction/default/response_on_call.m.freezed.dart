// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_on_call.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseOnCallModel _$ResponseOnCallModelFromJson(Map<String, dynamic> json) {
  return _ResponseOnCallModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOnCallModel {
  @JsonKey(name: 'status')
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  Map<String, dynamic>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOnCallModelCopyWith<ResponseOnCallModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOnCallModelCopyWith<$Res> {
  factory $ResponseOnCallModelCopyWith(
          ResponseOnCallModel value, $Res Function(ResponseOnCallModel) then) =
      _$ResponseOnCallModelCopyWithImpl<$Res, ResponseOnCallModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int status,
      @JsonKey(name: 'result') Map<String, dynamic>? result});
}

/// @nodoc
class _$ResponseOnCallModelCopyWithImpl<$Res, $Val extends ResponseOnCallModel>
    implements $ResponseOnCallModelCopyWith<$Res> {
  _$ResponseOnCallModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseOnCallModelImplCopyWith<$Res>
    implements $ResponseOnCallModelCopyWith<$Res> {
  factory _$$ResponseOnCallModelImplCopyWith(_$ResponseOnCallModelImpl value,
          $Res Function(_$ResponseOnCallModelImpl) then) =
      __$$ResponseOnCallModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int status,
      @JsonKey(name: 'result') Map<String, dynamic>? result});
}

/// @nodoc
class __$$ResponseOnCallModelImplCopyWithImpl<$Res>
    extends _$ResponseOnCallModelCopyWithImpl<$Res, _$ResponseOnCallModelImpl>
    implements _$$ResponseOnCallModelImplCopyWith<$Res> {
  __$$ResponseOnCallModelImplCopyWithImpl(_$ResponseOnCallModelImpl _value,
      $Res Function(_$ResponseOnCallModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? result = freezed,
  }) {
    return _then(_$ResponseOnCallModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseOnCallModelImpl implements _ResponseOnCallModel {
  const _$ResponseOnCallModelImpl(
      {@JsonKey(name: 'status') this.status = 0,
      @JsonKey(name: 'result') final Map<String, dynamic>? result = null})
      : _result = result;

  factory _$ResponseOnCallModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseOnCallModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int status;
  final Map<String, dynamic>? _result;
  @override
  @JsonKey(name: 'result')
  Map<String, dynamic>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableMapView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ResponseOnCallModel(status: $status, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOnCallModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOnCallModelImplCopyWith<_$ResponseOnCallModelImpl> get copyWith =>
      __$$ResponseOnCallModelImplCopyWithImpl<_$ResponseOnCallModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOnCallModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOnCallModel implements ResponseOnCallModel {
  const factory _ResponseOnCallModel(
          {@JsonKey(name: 'status') final int status,
          @JsonKey(name: 'result') final Map<String, dynamic>? result}) =
      _$ResponseOnCallModelImpl;

  factory _ResponseOnCallModel.fromJson(Map<String, dynamic> json) =
      _$ResponseOnCallModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  int get status;
  @override
  @JsonKey(name: 'result')
  Map<String, dynamic>? get result;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOnCallModelImplCopyWith<_$ResponseOnCallModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
