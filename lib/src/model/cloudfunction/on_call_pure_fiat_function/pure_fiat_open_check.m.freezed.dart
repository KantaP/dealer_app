// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pure_fiat_open_check.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PureFiatOpenCheckRequest _$PureFiatOpenCheckRequestFromJson(
    Map<String, dynamic> json) {
  return _PureFiatOpenCheckRequest.fromJson(json);
}

/// @nodoc
mixin _$PureFiatOpenCheckRequest {
  @JsonKey(name: 'id_user')
  String get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  String get paymentType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PureFiatOpenCheckRequestCopyWith<PureFiatOpenCheckRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PureFiatOpenCheckRequestCopyWith<$Res> {
  factory $PureFiatOpenCheckRequestCopyWith(PureFiatOpenCheckRequest value,
          $Res Function(PureFiatOpenCheckRequest) then) =
      _$PureFiatOpenCheckRequestCopyWithImpl<$Res, PureFiatOpenCheckRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') String idUser,
      @JsonKey(name: 'payment_type') String paymentType});
}

/// @nodoc
class _$PureFiatOpenCheckRequestCopyWithImpl<$Res,
        $Val extends PureFiatOpenCheckRequest>
    implements $PureFiatOpenCheckRequestCopyWith<$Res> {
  _$PureFiatOpenCheckRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? paymentType = null,
  }) {
    return _then(_value.copyWith(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PureFiatOpenCheckRequestImplCopyWith<$Res>
    implements $PureFiatOpenCheckRequestCopyWith<$Res> {
  factory _$$PureFiatOpenCheckRequestImplCopyWith(
          _$PureFiatOpenCheckRequestImpl value,
          $Res Function(_$PureFiatOpenCheckRequestImpl) then) =
      __$$PureFiatOpenCheckRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') String idUser,
      @JsonKey(name: 'payment_type') String paymentType});
}

/// @nodoc
class __$$PureFiatOpenCheckRequestImplCopyWithImpl<$Res>
    extends _$PureFiatOpenCheckRequestCopyWithImpl<$Res,
        _$PureFiatOpenCheckRequestImpl>
    implements _$$PureFiatOpenCheckRequestImplCopyWith<$Res> {
  __$$PureFiatOpenCheckRequestImplCopyWithImpl(
      _$PureFiatOpenCheckRequestImpl _value,
      $Res Function(_$PureFiatOpenCheckRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? paymentType = null,
  }) {
    return _then(_$PureFiatOpenCheckRequestImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PureFiatOpenCheckRequestImpl implements _PureFiatOpenCheckRequest {
  const _$PureFiatOpenCheckRequestImpl(
      {@JsonKey(name: 'id_user') this.idUser = '',
      @JsonKey(name: 'payment_type') this.paymentType = ''});

  factory _$PureFiatOpenCheckRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PureFiatOpenCheckRequestImplFromJson(json);

  @override
  @JsonKey(name: 'id_user')
  final String idUser;
  @override
  @JsonKey(name: 'payment_type')
  final String paymentType;

  @override
  String toString() {
    return 'PureFiatOpenCheckRequest(idUser: $idUser, paymentType: $paymentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PureFiatOpenCheckRequestImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idUser, paymentType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PureFiatOpenCheckRequestImplCopyWith<_$PureFiatOpenCheckRequestImpl>
      get copyWith => __$$PureFiatOpenCheckRequestImplCopyWithImpl<
          _$PureFiatOpenCheckRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PureFiatOpenCheckRequestImplToJson(
      this,
    );
  }
}

abstract class _PureFiatOpenCheckRequest implements PureFiatOpenCheckRequest {
  const factory _PureFiatOpenCheckRequest(
          {@JsonKey(name: 'id_user') final String idUser,
          @JsonKey(name: 'payment_type') final String paymentType}) =
      _$PureFiatOpenCheckRequestImpl;

  factory _PureFiatOpenCheckRequest.fromJson(Map<String, dynamic> json) =
      _$PureFiatOpenCheckRequestImpl.fromJson;

  @override
  @JsonKey(name: 'id_user')
  String get idUser;
  @override
  @JsonKey(name: 'payment_type')
  String get paymentType;
  @override
  @JsonKey(ignore: true)
  _$$PureFiatOpenCheckRequestImplCopyWith<_$PureFiatOpenCheckRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PureFiatOpenCheckResponse _$PureFiatOpenCheckResponseFromJson(
    Map<String, dynamic> json) {
  return _PureFiatOpenCheckResponse.fromJson(json);
}

/// @nodoc
mixin _$PureFiatOpenCheckResponse {
  @JsonKey(name: 'id_purefiat')
  int get idPureFiat => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  String get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  String get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get refcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_qrdata')
  String get paymentQrData => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_actual')
  double get paymentValueActual => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PureFiatOpenCheckResponseCopyWith<PureFiatOpenCheckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PureFiatOpenCheckResponseCopyWith<$Res> {
  factory $PureFiatOpenCheckResponseCopyWith(PureFiatOpenCheckResponse value,
          $Res Function(PureFiatOpenCheckResponse) then) =
      _$PureFiatOpenCheckResponseCopyWithImpl<$Res, PureFiatOpenCheckResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_purefiat') int idPureFiat,
      @JsonKey(name: 'order_status') String orderStatus,
      @JsonKey(name: 'payment_type') String paymentType,
      @JsonKey(name: 'refcode') String refcode,
      @JsonKey(name: 'payment_qrdata') String paymentQrData,
      @JsonKey(name: 'payment_value_actual') double paymentValueActual});
}

/// @nodoc
class _$PureFiatOpenCheckResponseCopyWithImpl<$Res,
        $Val extends PureFiatOpenCheckResponse>
    implements $PureFiatOpenCheckResponseCopyWith<$Res> {
  _$PureFiatOpenCheckResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPureFiat = null,
    Object? orderStatus = null,
    Object? paymentType = null,
    Object? refcode = null,
    Object? paymentQrData = null,
    Object? paymentValueActual = null,
  }) {
    return _then(_value.copyWith(
      idPureFiat: null == idPureFiat
          ? _value.idPureFiat
          : idPureFiat // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentQrData: null == paymentQrData
          ? _value.paymentQrData
          : paymentQrData // ignore: cast_nullable_to_non_nullable
              as String,
      paymentValueActual: null == paymentValueActual
          ? _value.paymentValueActual
          : paymentValueActual // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PureFiatOpenCheckResponseImplCopyWith<$Res>
    implements $PureFiatOpenCheckResponseCopyWith<$Res> {
  factory _$$PureFiatOpenCheckResponseImplCopyWith(
          _$PureFiatOpenCheckResponseImpl value,
          $Res Function(_$PureFiatOpenCheckResponseImpl) then) =
      __$$PureFiatOpenCheckResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_purefiat') int idPureFiat,
      @JsonKey(name: 'order_status') String orderStatus,
      @JsonKey(name: 'payment_type') String paymentType,
      @JsonKey(name: 'refcode') String refcode,
      @JsonKey(name: 'payment_qrdata') String paymentQrData,
      @JsonKey(name: 'payment_value_actual') double paymentValueActual});
}

/// @nodoc
class __$$PureFiatOpenCheckResponseImplCopyWithImpl<$Res>
    extends _$PureFiatOpenCheckResponseCopyWithImpl<$Res,
        _$PureFiatOpenCheckResponseImpl>
    implements _$$PureFiatOpenCheckResponseImplCopyWith<$Res> {
  __$$PureFiatOpenCheckResponseImplCopyWithImpl(
      _$PureFiatOpenCheckResponseImpl _value,
      $Res Function(_$PureFiatOpenCheckResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPureFiat = null,
    Object? orderStatus = null,
    Object? paymentType = null,
    Object? refcode = null,
    Object? paymentQrData = null,
    Object? paymentValueActual = null,
  }) {
    return _then(_$PureFiatOpenCheckResponseImpl(
      idPureFiat: null == idPureFiat
          ? _value.idPureFiat
          : idPureFiat // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentQrData: null == paymentQrData
          ? _value.paymentQrData
          : paymentQrData // ignore: cast_nullable_to_non_nullable
              as String,
      paymentValueActual: null == paymentValueActual
          ? _value.paymentValueActual
          : paymentValueActual // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PureFiatOpenCheckResponseImpl implements _PureFiatOpenCheckResponse {
  const _$PureFiatOpenCheckResponseImpl(
      {@JsonKey(name: 'id_purefiat') this.idPureFiat = 0,
      @JsonKey(name: 'order_status') this.orderStatus = '',
      @JsonKey(name: 'payment_type') this.paymentType = '',
      @JsonKey(name: 'refcode') this.refcode = '',
      @JsonKey(name: 'payment_qrdata') this.paymentQrData = '',
      @JsonKey(name: 'payment_value_actual') this.paymentValueActual = 0});

  factory _$PureFiatOpenCheckResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PureFiatOpenCheckResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id_purefiat')
  final int idPureFiat;
  @override
  @JsonKey(name: 'order_status')
  final String orderStatus;
  @override
  @JsonKey(name: 'payment_type')
  final String paymentType;
  @override
  @JsonKey(name: 'refcode')
  final String refcode;
  @override
  @JsonKey(name: 'payment_qrdata')
  final String paymentQrData;
  @override
  @JsonKey(name: 'payment_value_actual')
  final double paymentValueActual;

  @override
  String toString() {
    return 'PureFiatOpenCheckResponse(idPureFiat: $idPureFiat, orderStatus: $orderStatus, paymentType: $paymentType, refcode: $refcode, paymentQrData: $paymentQrData, paymentValueActual: $paymentValueActual)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PureFiatOpenCheckResponseImpl &&
            (identical(other.idPureFiat, idPureFiat) ||
                other.idPureFiat == idPureFiat) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.refcode, refcode) || other.refcode == refcode) &&
            (identical(other.paymentQrData, paymentQrData) ||
                other.paymentQrData == paymentQrData) &&
            (identical(other.paymentValueActual, paymentValueActual) ||
                other.paymentValueActual == paymentValueActual));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idPureFiat, orderStatus,
      paymentType, refcode, paymentQrData, paymentValueActual);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PureFiatOpenCheckResponseImplCopyWith<_$PureFiatOpenCheckResponseImpl>
      get copyWith => __$$PureFiatOpenCheckResponseImplCopyWithImpl<
          _$PureFiatOpenCheckResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PureFiatOpenCheckResponseImplToJson(
      this,
    );
  }
}

abstract class _PureFiatOpenCheckResponse implements PureFiatOpenCheckResponse {
  const factory _PureFiatOpenCheckResponse(
      {@JsonKey(name: 'id_purefiat') final int idPureFiat,
      @JsonKey(name: 'order_status') final String orderStatus,
      @JsonKey(name: 'payment_type') final String paymentType,
      @JsonKey(name: 'refcode') final String refcode,
      @JsonKey(name: 'payment_qrdata') final String paymentQrData,
      @JsonKey(name: 'payment_value_actual')
      final double paymentValueActual}) = _$PureFiatOpenCheckResponseImpl;

  factory _PureFiatOpenCheckResponse.fromJson(Map<String, dynamic> json) =
      _$PureFiatOpenCheckResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id_purefiat')
  int get idPureFiat;
  @override
  @JsonKey(name: 'order_status')
  String get orderStatus;
  @override
  @JsonKey(name: 'payment_type')
  String get paymentType;
  @override
  @JsonKey(name: 'refcode')
  String get refcode;
  @override
  @JsonKey(name: 'payment_qrdata')
  String get paymentQrData;
  @override
  @JsonKey(name: 'payment_value_actual')
  double get paymentValueActual;
  @override
  @JsonKey(ignore: true)
  _$$PureFiatOpenCheckResponseImplCopyWith<_$PureFiatOpenCheckResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
