// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trxfiat_proof.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestTrxFiatProofModel _$RequestTrxFiatProofModelFromJson(
    Map<String, dynamic> json) {
  return _RequestTrxFiatProofModel.fromJson(json);
}

/// @nodoc
mixin _$RequestTrxFiatProofModel {
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_actual')
  int get paymentValueActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_proof')
  String get paymentProof => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestTrxFiatProofModelCopyWith<RequestTrxFiatProofModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestTrxFiatProofModelCopyWith<$Res> {
  factory $RequestTrxFiatProofModelCopyWith(RequestTrxFiatProofModel value,
          $Res Function(RequestTrxFiatProofModel) then) =
      _$RequestTrxFiatProofModelCopyWithImpl<$Res, RequestTrxFiatProofModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_trxfiat') int idTrxFiat,
      @JsonKey(name: 'payment_value_actual') int paymentValueActual,
      @JsonKey(name: 'payment_proof') String paymentProof});
}

/// @nodoc
class _$RequestTrxFiatProofModelCopyWithImpl<$Res,
        $Val extends RequestTrxFiatProofModel>
    implements $RequestTrxFiatProofModelCopyWith<$Res> {
  _$RequestTrxFiatProofModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = null,
    Object? paymentValueActual = null,
    Object? paymentProof = null,
  }) {
    return _then(_value.copyWith(
      idTrxFiat: null == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int,
      paymentValueActual: null == paymentValueActual
          ? _value.paymentValueActual
          : paymentValueActual // ignore: cast_nullable_to_non_nullable
              as int,
      paymentProof: null == paymentProof
          ? _value.paymentProof
          : paymentProof // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestTrxFiatProofModelImplCopyWith<$Res>
    implements $RequestTrxFiatProofModelCopyWith<$Res> {
  factory _$$RequestTrxFiatProofModelImplCopyWith(
          _$RequestTrxFiatProofModelImpl value,
          $Res Function(_$RequestTrxFiatProofModelImpl) then) =
      __$$RequestTrxFiatProofModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_trxfiat') int idTrxFiat,
      @JsonKey(name: 'payment_value_actual') int paymentValueActual,
      @JsonKey(name: 'payment_proof') String paymentProof});
}

/// @nodoc
class __$$RequestTrxFiatProofModelImplCopyWithImpl<$Res>
    extends _$RequestTrxFiatProofModelCopyWithImpl<$Res,
        _$RequestTrxFiatProofModelImpl>
    implements _$$RequestTrxFiatProofModelImplCopyWith<$Res> {
  __$$RequestTrxFiatProofModelImplCopyWithImpl(
      _$RequestTrxFiatProofModelImpl _value,
      $Res Function(_$RequestTrxFiatProofModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = null,
    Object? paymentValueActual = null,
    Object? paymentProof = null,
  }) {
    return _then(_$RequestTrxFiatProofModelImpl(
      idTrxFiat: null == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int,
      paymentValueActual: null == paymentValueActual
          ? _value.paymentValueActual
          : paymentValueActual // ignore: cast_nullable_to_non_nullable
              as int,
      paymentProof: null == paymentProof
          ? _value.paymentProof
          : paymentProof // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestTrxFiatProofModelImpl implements _RequestTrxFiatProofModel {
  const _$RequestTrxFiatProofModelImpl(
      {@JsonKey(name: 'id_trxfiat') required this.idTrxFiat,
      @JsonKey(name: 'payment_value_actual') required this.paymentValueActual,
      @JsonKey(name: 'payment_proof') required this.paymentProof});

  factory _$RequestTrxFiatProofModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestTrxFiatProofModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_trxfiat')
  final int idTrxFiat;
  @override
  @JsonKey(name: 'payment_value_actual')
  final int paymentValueActual;
  @override
  @JsonKey(name: 'payment_proof')
  final String paymentProof;

  @override
  String toString() {
    return 'RequestTrxFiatProofModel(idTrxFiat: $idTrxFiat, paymentValueActual: $paymentValueActual, paymentProof: $paymentProof)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestTrxFiatProofModelImpl &&
            (identical(other.idTrxFiat, idTrxFiat) ||
                other.idTrxFiat == idTrxFiat) &&
            (identical(other.paymentValueActual, paymentValueActual) ||
                other.paymentValueActual == paymentValueActual) &&
            (identical(other.paymentProof, paymentProof) ||
                other.paymentProof == paymentProof));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idTrxFiat, paymentValueActual, paymentProof);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestTrxFiatProofModelImplCopyWith<_$RequestTrxFiatProofModelImpl>
      get copyWith => __$$RequestTrxFiatProofModelImplCopyWithImpl<
          _$RequestTrxFiatProofModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestTrxFiatProofModelImplToJson(
      this,
    );
  }
}

abstract class _RequestTrxFiatProofModel implements RequestTrxFiatProofModel {
  const factory _RequestTrxFiatProofModel(
          {@JsonKey(name: 'id_trxfiat') required final int idTrxFiat,
          @JsonKey(name: 'payment_value_actual')
          required final int paymentValueActual,
          @JsonKey(name: 'payment_proof') required final String paymentProof}) =
      _$RequestTrxFiatProofModelImpl;

  factory _RequestTrxFiatProofModel.fromJson(Map<String, dynamic> json) =
      _$RequestTrxFiatProofModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat;
  @override
  @JsonKey(name: 'payment_value_actual')
  int get paymentValueActual;
  @override
  @JsonKey(name: 'payment_proof')
  String get paymentProof;
  @override
  @JsonKey(ignore: true)
  _$$RequestTrxFiatProofModelImplCopyWith<_$RequestTrxFiatProofModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseTrxFiatProofModel _$ResponseTrxFiatProofModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseTrxFiatProofModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseTrxFiatProofModel {
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseTrxFiatProofModelCopyWith<ResponseTrxFiatProofModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseTrxFiatProofModelCopyWith<$Res> {
  factory $ResponseTrxFiatProofModelCopyWith(ResponseTrxFiatProofModel value,
          $Res Function(ResponseTrxFiatProofModel) then) =
      _$ResponseTrxFiatProofModelCopyWithImpl<$Res, ResponseTrxFiatProofModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_trxfiat') int idTrxFiat});
}

/// @nodoc
class _$ResponseTrxFiatProofModelCopyWithImpl<$Res,
        $Val extends ResponseTrxFiatProofModel>
    implements $ResponseTrxFiatProofModelCopyWith<$Res> {
  _$ResponseTrxFiatProofModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ResponseTrxFiatProofModelImplCopyWith<$Res>
    implements $ResponseTrxFiatProofModelCopyWith<$Res> {
  factory _$$ResponseTrxFiatProofModelImplCopyWith(
          _$ResponseTrxFiatProofModelImpl value,
          $Res Function(_$ResponseTrxFiatProofModelImpl) then) =
      __$$ResponseTrxFiatProofModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_trxfiat') int idTrxFiat});
}

/// @nodoc
class __$$ResponseTrxFiatProofModelImplCopyWithImpl<$Res>
    extends _$ResponseTrxFiatProofModelCopyWithImpl<$Res,
        _$ResponseTrxFiatProofModelImpl>
    implements _$$ResponseTrxFiatProofModelImplCopyWith<$Res> {
  __$$ResponseTrxFiatProofModelImplCopyWithImpl(
      _$ResponseTrxFiatProofModelImpl _value,
      $Res Function(_$ResponseTrxFiatProofModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = null,
  }) {
    return _then(_$ResponseTrxFiatProofModelImpl(
      idTrxFiat: null == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseTrxFiatProofModelImpl implements _ResponseTrxFiatProofModel {
  const _$ResponseTrxFiatProofModelImpl(
      {@JsonKey(name: 'id_trxfiat') required this.idTrxFiat});

  factory _$ResponseTrxFiatProofModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseTrxFiatProofModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_trxfiat')
  final int idTrxFiat;

  @override
  String toString() {
    return 'ResponseTrxFiatProofModel(idTrxFiat: $idTrxFiat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseTrxFiatProofModelImpl &&
            (identical(other.idTrxFiat, idTrxFiat) ||
                other.idTrxFiat == idTrxFiat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idTrxFiat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseTrxFiatProofModelImplCopyWith<_$ResponseTrxFiatProofModelImpl>
      get copyWith => __$$ResponseTrxFiatProofModelImplCopyWithImpl<
          _$ResponseTrxFiatProofModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseTrxFiatProofModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseTrxFiatProofModel implements ResponseTrxFiatProofModel {
  const factory _ResponseTrxFiatProofModel(
          {@JsonKey(name: 'id_trxfiat') required final int idTrxFiat}) =
      _$ResponseTrxFiatProofModelImpl;

  factory _ResponseTrxFiatProofModel.fromJson(Map<String, dynamic> json) =
      _$ResponseTrxFiatProofModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat;
  @override
  @JsonKey(ignore: true)
  _$$ResponseTrxFiatProofModelImplCopyWith<_$ResponseTrxFiatProofModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
