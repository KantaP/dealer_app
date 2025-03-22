// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_update_dopa_status.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseUpdateDopaStatusModel _$ResponseUpdateDopaStatusModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseUpdateDopaStatusModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseUpdateDopaStatusModel {
  @JsonKey(name: 'result')
  ResponseUpdateDopaStatusResult get result =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseUpdateDopaStatusModelCopyWith<ResponseUpdateDopaStatusModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseUpdateDopaStatusModelCopyWith<$Res> {
  factory $ResponseUpdateDopaStatusModelCopyWith(
          ResponseUpdateDopaStatusModel value,
          $Res Function(ResponseUpdateDopaStatusModel) then) =
      _$ResponseUpdateDopaStatusModelCopyWithImpl<$Res,
          ResponseUpdateDopaStatusModel>;
  @useResult
  $Res call({@JsonKey(name: 'result') ResponseUpdateDopaStatusResult result});

  $ResponseUpdateDopaStatusResultCopyWith<$Res> get result;
}

/// @nodoc
class _$ResponseUpdateDopaStatusModelCopyWithImpl<$Res,
        $Val extends ResponseUpdateDopaStatusModel>
    implements $ResponseUpdateDopaStatusModelCopyWith<$Res> {
  _$ResponseUpdateDopaStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResponseUpdateDopaStatusResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseUpdateDopaStatusResultCopyWith<$Res> get result {
    return $ResponseUpdateDopaStatusResultCopyWith<$Res>(_value.result,
        (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseUpdateDopaStatusModelImplCopyWith<$Res>
    implements $ResponseUpdateDopaStatusModelCopyWith<$Res> {
  factory _$$ResponseUpdateDopaStatusModelImplCopyWith(
          _$ResponseUpdateDopaStatusModelImpl value,
          $Res Function(_$ResponseUpdateDopaStatusModelImpl) then) =
      __$$ResponseUpdateDopaStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'result') ResponseUpdateDopaStatusResult result});

  @override
  $ResponseUpdateDopaStatusResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$ResponseUpdateDopaStatusModelImplCopyWithImpl<$Res>
    extends _$ResponseUpdateDopaStatusModelCopyWithImpl<$Res,
        _$ResponseUpdateDopaStatusModelImpl>
    implements _$$ResponseUpdateDopaStatusModelImplCopyWith<$Res> {
  __$$ResponseUpdateDopaStatusModelImplCopyWithImpl(
      _$ResponseUpdateDopaStatusModelImpl _value,
      $Res Function(_$ResponseUpdateDopaStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ResponseUpdateDopaStatusModelImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResponseUpdateDopaStatusResult,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ResponseUpdateDopaStatusModelImpl
    implements _ResponseUpdateDopaStatusModel {
  const _$ResponseUpdateDopaStatusModelImpl(
      {@JsonKey(name: 'result') required this.result});

  factory _$ResponseUpdateDopaStatusModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseUpdateDopaStatusModelImplFromJson(json);

  @override
  @JsonKey(name: 'result')
  final ResponseUpdateDopaStatusResult result;

  @override
  String toString() {
    return 'ResponseUpdateDopaStatusModel(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseUpdateDopaStatusModelImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseUpdateDopaStatusModelImplCopyWith<
          _$ResponseUpdateDopaStatusModelImpl>
      get copyWith => __$$ResponseUpdateDopaStatusModelImplCopyWithImpl<
          _$ResponseUpdateDopaStatusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseUpdateDopaStatusModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseUpdateDopaStatusModel
    implements ResponseUpdateDopaStatusModel {
  const factory _ResponseUpdateDopaStatusModel(
          {@JsonKey(name: 'result')
          required final ResponseUpdateDopaStatusResult result}) =
      _$ResponseUpdateDopaStatusModelImpl;

  factory _ResponseUpdateDopaStatusModel.fromJson(Map<String, dynamic> json) =
      _$ResponseUpdateDopaStatusModelImpl.fromJson;

  @override
  @JsonKey(name: 'result')
  ResponseUpdateDopaStatusResult get result;
  @override
  @JsonKey(ignore: true)
  _$$ResponseUpdateDopaStatusModelImplCopyWith<
          _$ResponseUpdateDopaStatusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseUpdateDopaStatusResult _$ResponseUpdateDopaStatusResultFromJson(
    Map<String, dynamic> json) {
  return _ResponseUpdateDopaStatusResult.fromJson(json);
}

/// @nodoc
mixin _$ResponseUpdateDopaStatusResult {
  @JsonKey(name: 'dopa_check_status')
  bool get dopaCheckStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseUpdateDopaStatusResultCopyWith<ResponseUpdateDopaStatusResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseUpdateDopaStatusResultCopyWith<$Res> {
  factory $ResponseUpdateDopaStatusResultCopyWith(
          ResponseUpdateDopaStatusResult value,
          $Res Function(ResponseUpdateDopaStatusResult) then) =
      _$ResponseUpdateDopaStatusResultCopyWithImpl<$Res,
          ResponseUpdateDopaStatusResult>;
  @useResult
  $Res call({@JsonKey(name: 'dopa_check_status') bool dopaCheckStatus});
}

/// @nodoc
class _$ResponseUpdateDopaStatusResultCopyWithImpl<$Res,
        $Val extends ResponseUpdateDopaStatusResult>
    implements $ResponseUpdateDopaStatusResultCopyWith<$Res> {
  _$ResponseUpdateDopaStatusResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dopaCheckStatus = null,
  }) {
    return _then(_value.copyWith(
      dopaCheckStatus: null == dopaCheckStatus
          ? _value.dopaCheckStatus
          : dopaCheckStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseUpdateDopaStatusResultImplCopyWith<$Res>
    implements $ResponseUpdateDopaStatusResultCopyWith<$Res> {
  factory _$$ResponseUpdateDopaStatusResultImplCopyWith(
          _$ResponseUpdateDopaStatusResultImpl value,
          $Res Function(_$ResponseUpdateDopaStatusResultImpl) then) =
      __$$ResponseUpdateDopaStatusResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'dopa_check_status') bool dopaCheckStatus});
}

/// @nodoc
class __$$ResponseUpdateDopaStatusResultImplCopyWithImpl<$Res>
    extends _$ResponseUpdateDopaStatusResultCopyWithImpl<$Res,
        _$ResponseUpdateDopaStatusResultImpl>
    implements _$$ResponseUpdateDopaStatusResultImplCopyWith<$Res> {
  __$$ResponseUpdateDopaStatusResultImplCopyWithImpl(
      _$ResponseUpdateDopaStatusResultImpl _value,
      $Res Function(_$ResponseUpdateDopaStatusResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dopaCheckStatus = null,
  }) {
    return _then(_$ResponseUpdateDopaStatusResultImpl(
      dopaCheckStatus: null == dopaCheckStatus
          ? _value.dopaCheckStatus
          : dopaCheckStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseUpdateDopaStatusResultImpl
    implements _ResponseUpdateDopaStatusResult {
  const _$ResponseUpdateDopaStatusResultImpl(
      {@JsonKey(name: 'dopa_check_status') this.dopaCheckStatus = false});

  factory _$ResponseUpdateDopaStatusResultImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseUpdateDopaStatusResultImplFromJson(json);

  @override
  @JsonKey(name: 'dopa_check_status')
  final bool dopaCheckStatus;

  @override
  String toString() {
    return 'ResponseUpdateDopaStatusResult(dopaCheckStatus: $dopaCheckStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseUpdateDopaStatusResultImpl &&
            (identical(other.dopaCheckStatus, dopaCheckStatus) ||
                other.dopaCheckStatus == dopaCheckStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dopaCheckStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseUpdateDopaStatusResultImplCopyWith<
          _$ResponseUpdateDopaStatusResultImpl>
      get copyWith => __$$ResponseUpdateDopaStatusResultImplCopyWithImpl<
          _$ResponseUpdateDopaStatusResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseUpdateDopaStatusResultImplToJson(
      this,
    );
  }
}

abstract class _ResponseUpdateDopaStatusResult
    implements ResponseUpdateDopaStatusResult {
  const factory _ResponseUpdateDopaStatusResult(
          {@JsonKey(name: 'dopa_check_status') final bool dopaCheckStatus}) =
      _$ResponseUpdateDopaStatusResultImpl;

  factory _ResponseUpdateDopaStatusResult.fromJson(Map<String, dynamic> json) =
      _$ResponseUpdateDopaStatusResultImpl.fromJson;

  @override
  @JsonKey(name: 'dopa_check_status')
  bool get dopaCheckStatus;
  @override
  @JsonKey(ignore: true)
  _$$ResponseUpdateDopaStatusResultImplCopyWith<
          _$ResponseUpdateDopaStatusResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
