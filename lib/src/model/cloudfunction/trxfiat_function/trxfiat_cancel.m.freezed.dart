// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trxfiat_cancel.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestTrxFiatCancelModel _$RequestTrxFiatCancelModelFromJson(
    Map<String, dynamic> json) {
  return _RequestTrxFiatCancelModel.fromJson(json);
}

/// @nodoc
mixin _$RequestTrxFiatCancelModel {
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_reason')
  String get cancelReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestTrxFiatCancelModelCopyWith<RequestTrxFiatCancelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestTrxFiatCancelModelCopyWith<$Res> {
  factory $RequestTrxFiatCancelModelCopyWith(RequestTrxFiatCancelModel value,
          $Res Function(RequestTrxFiatCancelModel) then) =
      _$RequestTrxFiatCancelModelCopyWithImpl<$Res, RequestTrxFiatCancelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_trxfiat') int idTrxFiat,
      @JsonKey(name: 'cancel_reason') String cancelReason});
}

/// @nodoc
class _$RequestTrxFiatCancelModelCopyWithImpl<$Res,
        $Val extends RequestTrxFiatCancelModel>
    implements $RequestTrxFiatCancelModelCopyWith<$Res> {
  _$RequestTrxFiatCancelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = null,
    Object? cancelReason = null,
  }) {
    return _then(_value.copyWith(
      idTrxFiat: null == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int,
      cancelReason: null == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestTrxFiatCancelModelImplCopyWith<$Res>
    implements $RequestTrxFiatCancelModelCopyWith<$Res> {
  factory _$$RequestTrxFiatCancelModelImplCopyWith(
          _$RequestTrxFiatCancelModelImpl value,
          $Res Function(_$RequestTrxFiatCancelModelImpl) then) =
      __$$RequestTrxFiatCancelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_trxfiat') int idTrxFiat,
      @JsonKey(name: 'cancel_reason') String cancelReason});
}

/// @nodoc
class __$$RequestTrxFiatCancelModelImplCopyWithImpl<$Res>
    extends _$RequestTrxFiatCancelModelCopyWithImpl<$Res,
        _$RequestTrxFiatCancelModelImpl>
    implements _$$RequestTrxFiatCancelModelImplCopyWith<$Res> {
  __$$RequestTrxFiatCancelModelImplCopyWithImpl(
      _$RequestTrxFiatCancelModelImpl _value,
      $Res Function(_$RequestTrxFiatCancelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = null,
    Object? cancelReason = null,
  }) {
    return _then(_$RequestTrxFiatCancelModelImpl(
      idTrxFiat: null == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int,
      cancelReason: null == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestTrxFiatCancelModelImpl implements _RequestTrxFiatCancelModel {
  const _$RequestTrxFiatCancelModelImpl(
      {@JsonKey(name: 'id_trxfiat') required this.idTrxFiat,
      @JsonKey(name: 'cancel_reason') required this.cancelReason});

  factory _$RequestTrxFiatCancelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestTrxFiatCancelModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_trxfiat')
  final int idTrxFiat;
  @override
  @JsonKey(name: 'cancel_reason')
  final String cancelReason;

  @override
  String toString() {
    return 'RequestTrxFiatCancelModel(idTrxFiat: $idTrxFiat, cancelReason: $cancelReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestTrxFiatCancelModelImpl &&
            (identical(other.idTrxFiat, idTrxFiat) ||
                other.idTrxFiat == idTrxFiat) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idTrxFiat, cancelReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestTrxFiatCancelModelImplCopyWith<_$RequestTrxFiatCancelModelImpl>
      get copyWith => __$$RequestTrxFiatCancelModelImplCopyWithImpl<
          _$RequestTrxFiatCancelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestTrxFiatCancelModelImplToJson(
      this,
    );
  }
}

abstract class _RequestTrxFiatCancelModel implements RequestTrxFiatCancelModel {
  const factory _RequestTrxFiatCancelModel(
          {@JsonKey(name: 'id_trxfiat') required final int idTrxFiat,
          @JsonKey(name: 'cancel_reason') required final String cancelReason}) =
      _$RequestTrxFiatCancelModelImpl;

  factory _RequestTrxFiatCancelModel.fromJson(Map<String, dynamic> json) =
      _$RequestTrxFiatCancelModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat;
  @override
  @JsonKey(name: 'cancel_reason')
  String get cancelReason;
  @override
  @JsonKey(ignore: true)
  _$$RequestTrxFiatCancelModelImplCopyWith<_$RequestTrxFiatCancelModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseTrxFiatCancelModel _$ResponseTrxFiatCancelModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseTrxFiatCancelModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseTrxFiatCancelModel {
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseTrxFiatCancelModelCopyWith<ResponseTrxFiatCancelModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseTrxFiatCancelModelCopyWith<$Res> {
  factory $ResponseTrxFiatCancelModelCopyWith(ResponseTrxFiatCancelModel value,
          $Res Function(ResponseTrxFiatCancelModel) then) =
      _$ResponseTrxFiatCancelModelCopyWithImpl<$Res,
          ResponseTrxFiatCancelModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_trxfiat') int idTrxFiat});
}

/// @nodoc
class _$ResponseTrxFiatCancelModelCopyWithImpl<$Res,
        $Val extends ResponseTrxFiatCancelModel>
    implements $ResponseTrxFiatCancelModelCopyWith<$Res> {
  _$ResponseTrxFiatCancelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = null,
  }) {
    return _then(_value.copyWith(
      idTrxFiat: null == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseTrxFiatCancelModelImplCopyWith<$Res>
    implements $ResponseTrxFiatCancelModelCopyWith<$Res> {
  factory _$$ResponseTrxFiatCancelModelImplCopyWith(
          _$ResponseTrxFiatCancelModelImpl value,
          $Res Function(_$ResponseTrxFiatCancelModelImpl) then) =
      __$$ResponseTrxFiatCancelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_trxfiat') int idTrxFiat});
}

/// @nodoc
class __$$ResponseTrxFiatCancelModelImplCopyWithImpl<$Res>
    extends _$ResponseTrxFiatCancelModelCopyWithImpl<$Res,
        _$ResponseTrxFiatCancelModelImpl>
    implements _$$ResponseTrxFiatCancelModelImplCopyWith<$Res> {
  __$$ResponseTrxFiatCancelModelImplCopyWithImpl(
      _$ResponseTrxFiatCancelModelImpl _value,
      $Res Function(_$ResponseTrxFiatCancelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = null,
  }) {
    return _then(_$ResponseTrxFiatCancelModelImpl(
      idTrxFiat: null == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseTrxFiatCancelModelImpl implements _ResponseTrxFiatCancelModel {
  const _$ResponseTrxFiatCancelModelImpl(
      {@JsonKey(name: 'id_trxfiat') required this.idTrxFiat});

  factory _$ResponseTrxFiatCancelModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseTrxFiatCancelModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_trxfiat')
  final int idTrxFiat;

  @override
  String toString() {
    return 'ResponseTrxFiatCancelModel(idTrxFiat: $idTrxFiat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseTrxFiatCancelModelImpl &&
            (identical(other.idTrxFiat, idTrxFiat) ||
                other.idTrxFiat == idTrxFiat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idTrxFiat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseTrxFiatCancelModelImplCopyWith<_$ResponseTrxFiatCancelModelImpl>
      get copyWith => __$$ResponseTrxFiatCancelModelImplCopyWithImpl<
          _$ResponseTrxFiatCancelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseTrxFiatCancelModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseTrxFiatCancelModel
    implements ResponseTrxFiatCancelModel {
  const factory _ResponseTrxFiatCancelModel(
          {@JsonKey(name: 'id_trxfiat') required final int idTrxFiat}) =
      _$ResponseTrxFiatCancelModelImpl;

  factory _ResponseTrxFiatCancelModel.fromJson(Map<String, dynamic> json) =
      _$ResponseTrxFiatCancelModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat;
  @override
  @JsonKey(ignore: true)
  _$$ResponseTrxFiatCancelModelImplCopyWith<_$ResponseTrxFiatCancelModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
