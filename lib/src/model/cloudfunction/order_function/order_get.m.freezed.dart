// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_get.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOrderGetModel _$RequestOrderGetModelFromJson(Map<String, dynamic> json) {
  return _RequestOrderGetModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderGetModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get ref => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOrderGetModelCopyWith<RequestOrderGetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderGetModelCopyWith<$Res> {
  factory $RequestOrderGetModelCopyWith(RequestOrderGetModel value,
          $Res Function(RequestOrderGetModel) then) =
      _$RequestOrderGetModelCopyWithImpl<$Res, RequestOrderGetModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'refcode') String ref});
}

/// @nodoc
class _$RequestOrderGetModelCopyWithImpl<$Res,
        $Val extends RequestOrderGetModel>
    implements $RequestOrderGetModelCopyWith<$Res> {
  _$RequestOrderGetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? ref = null,
  }) {
    return _then(_value.copyWith(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOrderGetModelImplCopyWith<$Res>
    implements $RequestOrderGetModelCopyWith<$Res> {
  factory _$$RequestOrderGetModelImplCopyWith(_$RequestOrderGetModelImpl value,
          $Res Function(_$RequestOrderGetModelImpl) then) =
      __$$RequestOrderGetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'refcode') String ref});
}

/// @nodoc
class __$$RequestOrderGetModelImplCopyWithImpl<$Res>
    extends _$RequestOrderGetModelCopyWithImpl<$Res, _$RequestOrderGetModelImpl>
    implements _$$RequestOrderGetModelImplCopyWith<$Res> {
  __$$RequestOrderGetModelImplCopyWithImpl(_$RequestOrderGetModelImpl _value,
      $Res Function(_$RequestOrderGetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? ref = null,
  }) {
    return _then(_$RequestOrderGetModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderGetModelImpl implements _RequestOrderGetModel {
  const _$RequestOrderGetModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder,
      @JsonKey(name: 'refcode') required this.ref});

  factory _$RequestOrderGetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOrderGetModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;
  @override
  @JsonKey(name: 'refcode')
  final String ref;

  @override
  String toString() {
    return 'RequestOrderGetModel(idOrder: $idOrder, ref: $ref)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderGetModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder) &&
            (identical(other.ref, ref) || other.ref == ref));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder, ref);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderGetModelImplCopyWith<_$RequestOrderGetModelImpl>
      get copyWith =>
          __$$RequestOrderGetModelImplCopyWithImpl<_$RequestOrderGetModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderGetModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderGetModel implements RequestOrderGetModel {
  const factory _RequestOrderGetModel(
          {@JsonKey(name: 'id_order') required final int idOrder,
          @JsonKey(name: 'refcode') required final String ref}) =
      _$RequestOrderGetModelImpl;

  factory _RequestOrderGetModel.fromJson(Map<String, dynamic> json) =
      _$RequestOrderGetModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(name: 'refcode')
  String get ref;
  @override
  @JsonKey(ignore: true)
  _$$RequestOrderGetModelImplCopyWith<_$RequestOrderGetModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseOrderGetModel _$ResponseOrderGetModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOrderGetModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOrderGetModel {
  @JsonKey(name: 'id_order')
  int? get idOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_user')
  String? get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_price')
  double? get digitalassetPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_price_actual')
  double? get digitalassetPriceActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'listed_pair')
  String? get listedPair => throw _privateConstructorUsedError;
  @JsonKey(name: 'topay_expire_time')
  int? get topayExpireTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime_create')
  String get datetimeCreate => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime_payment')
  String get datetimePayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime_complete')
  String get datetimeComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_side')
  String? get orderSide => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_value_fiat_set')
  double? get orderValueFiatSet => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_value_crypto_set')
  double? get orderValueCryptoSet => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankaccount_no')
  String? get bankAccountNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_address')
  String? get walletAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_reason')
  String? get cancelReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String? get refCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime_refcode')
  String get datetimeRefcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_type')
  String? get digitalassetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_price_set')
  double? get digitalAssetPriceSet => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_fee_set')
  double get digitalAssetFeeSet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOrderGetModelCopyWith<ResponseOrderGetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOrderGetModelCopyWith<$Res> {
  factory $ResponseOrderGetModelCopyWith(ResponseOrderGetModel value,
          $Res Function(ResponseOrderGetModel) then) =
      _$ResponseOrderGetModelCopyWithImpl<$Res, ResponseOrderGetModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int? idOrder,
      @JsonKey(name: 'id_user') String? idUser,
      @JsonKey(name: 'digitalasset_price') double? digitalassetPrice,
      @JsonKey(name: 'digitalasset_price_actual')
      double? digitalassetPriceActual,
      @JsonKey(name: 'listed_pair') String? listedPair,
      @JsonKey(name: 'topay_expire_time') int? topayExpireTime,
      @JsonKey(name: 'datetime_create') String datetimeCreate,
      @JsonKey(name: 'datetime_payment') String datetimePayment,
      @JsonKey(name: 'datetime_complete') String datetimeComplete,
      @JsonKey(name: 'order_side') String? orderSide,
      @JsonKey(name: 'order_value_fiat_set') double? orderValueFiatSet,
      @JsonKey(name: 'order_value_crypto_set') double? orderValueCryptoSet,
      @JsonKey(name: 'bankaccount_no') String? bankAccountNo,
      @JsonKey(name: 'wallet_address') String? walletAddress,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'cancel_reason') String? cancelReason,
      @JsonKey(name: 'refcode') String? refCode,
      @JsonKey(name: 'datetime_refcode') String datetimeRefcode,
      @JsonKey(name: 'digitalasset_type') String? digitalassetType,
      @JsonKey(name: 'digitalasset_price_set') double? digitalAssetPriceSet,
      @JsonKey(name: 'digitalasset_fee_set') double digitalAssetFeeSet});
}

/// @nodoc
class _$ResponseOrderGetModelCopyWithImpl<$Res,
        $Val extends ResponseOrderGetModel>
    implements $ResponseOrderGetModelCopyWith<$Res> {
  _$ResponseOrderGetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = freezed,
    Object? idUser = freezed,
    Object? digitalassetPrice = freezed,
    Object? digitalassetPriceActual = freezed,
    Object? listedPair = freezed,
    Object? topayExpireTime = freezed,
    Object? datetimeCreate = null,
    Object? datetimePayment = null,
    Object? datetimeComplete = null,
    Object? orderSide = freezed,
    Object? orderValueFiatSet = freezed,
    Object? orderValueCryptoSet = freezed,
    Object? bankAccountNo = freezed,
    Object? walletAddress = freezed,
    Object? status = freezed,
    Object? cancelReason = freezed,
    Object? refCode = freezed,
    Object? datetimeRefcode = null,
    Object? digitalassetType = freezed,
    Object? digitalAssetPriceSet = freezed,
    Object? digitalAssetFeeSet = null,
  }) {
    return _then(_value.copyWith(
      idOrder: freezed == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalassetPrice: freezed == digitalassetPrice
          ? _value.digitalassetPrice
          : digitalassetPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      digitalassetPriceActual: freezed == digitalassetPriceActual
          ? _value.digitalassetPriceActual
          : digitalassetPriceActual // ignore: cast_nullable_to_non_nullable
              as double?,
      listedPair: freezed == listedPair
          ? _value.listedPair
          : listedPair // ignore: cast_nullable_to_non_nullable
              as String?,
      topayExpireTime: freezed == topayExpireTime
          ? _value.topayExpireTime
          : topayExpireTime // ignore: cast_nullable_to_non_nullable
              as int?,
      datetimeCreate: null == datetimeCreate
          ? _value.datetimeCreate
          : datetimeCreate // ignore: cast_nullable_to_non_nullable
              as String,
      datetimePayment: null == datetimePayment
          ? _value.datetimePayment
          : datetimePayment // ignore: cast_nullable_to_non_nullable
              as String,
      datetimeComplete: null == datetimeComplete
          ? _value.datetimeComplete
          : datetimeComplete // ignore: cast_nullable_to_non_nullable
              as String,
      orderSide: freezed == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
              as String?,
      orderValueFiatSet: freezed == orderValueFiatSet
          ? _value.orderValueFiatSet
          : orderValueFiatSet // ignore: cast_nullable_to_non_nullable
              as double?,
      orderValueCryptoSet: freezed == orderValueCryptoSet
          ? _value.orderValueCryptoSet
          : orderValueCryptoSet // ignore: cast_nullable_to_non_nullable
              as double?,
      bankAccountNo: freezed == bankAccountNo
          ? _value.bankAccountNo
          : bankAccountNo // ignore: cast_nullable_to_non_nullable
              as String?,
      walletAddress: freezed == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      refCode: freezed == refCode
          ? _value.refCode
          : refCode // ignore: cast_nullable_to_non_nullable
              as String?,
      datetimeRefcode: null == datetimeRefcode
          ? _value.datetimeRefcode
          : datetimeRefcode // ignore: cast_nullable_to_non_nullable
              as String,
      digitalassetType: freezed == digitalassetType
          ? _value.digitalassetType
          : digitalassetType // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalAssetPriceSet: freezed == digitalAssetPriceSet
          ? _value.digitalAssetPriceSet
          : digitalAssetPriceSet // ignore: cast_nullable_to_non_nullable
              as double?,
      digitalAssetFeeSet: null == digitalAssetFeeSet
          ? _value.digitalAssetFeeSet
          : digitalAssetFeeSet // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseOrderGetModelImplCopyWith<$Res>
    implements $ResponseOrderGetModelCopyWith<$Res> {
  factory _$$ResponseOrderGetModelImplCopyWith(
          _$ResponseOrderGetModelImpl value,
          $Res Function(_$ResponseOrderGetModelImpl) then) =
      __$$ResponseOrderGetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int? idOrder,
      @JsonKey(name: 'id_user') String? idUser,
      @JsonKey(name: 'digitalasset_price') double? digitalassetPrice,
      @JsonKey(name: 'digitalasset_price_actual')
      double? digitalassetPriceActual,
      @JsonKey(name: 'listed_pair') String? listedPair,
      @JsonKey(name: 'topay_expire_time') int? topayExpireTime,
      @JsonKey(name: 'datetime_create') String datetimeCreate,
      @JsonKey(name: 'datetime_payment') String datetimePayment,
      @JsonKey(name: 'datetime_complete') String datetimeComplete,
      @JsonKey(name: 'order_side') String? orderSide,
      @JsonKey(name: 'order_value_fiat_set') double? orderValueFiatSet,
      @JsonKey(name: 'order_value_crypto_set') double? orderValueCryptoSet,
      @JsonKey(name: 'bankaccount_no') String? bankAccountNo,
      @JsonKey(name: 'wallet_address') String? walletAddress,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'cancel_reason') String? cancelReason,
      @JsonKey(name: 'refcode') String? refCode,
      @JsonKey(name: 'datetime_refcode') String datetimeRefcode,
      @JsonKey(name: 'digitalasset_type') String? digitalassetType,
      @JsonKey(name: 'digitalasset_price_set') double? digitalAssetPriceSet,
      @JsonKey(name: 'digitalasset_fee_set') double digitalAssetFeeSet});
}

/// @nodoc
class __$$ResponseOrderGetModelImplCopyWithImpl<$Res>
    extends _$ResponseOrderGetModelCopyWithImpl<$Res,
        _$ResponseOrderGetModelImpl>
    implements _$$ResponseOrderGetModelImplCopyWith<$Res> {
  __$$ResponseOrderGetModelImplCopyWithImpl(_$ResponseOrderGetModelImpl _value,
      $Res Function(_$ResponseOrderGetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = freezed,
    Object? idUser = freezed,
    Object? digitalassetPrice = freezed,
    Object? digitalassetPriceActual = freezed,
    Object? listedPair = freezed,
    Object? topayExpireTime = freezed,
    Object? datetimeCreate = null,
    Object? datetimePayment = null,
    Object? datetimeComplete = null,
    Object? orderSide = freezed,
    Object? orderValueFiatSet = freezed,
    Object? orderValueCryptoSet = freezed,
    Object? bankAccountNo = freezed,
    Object? walletAddress = freezed,
    Object? status = freezed,
    Object? cancelReason = freezed,
    Object? refCode = freezed,
    Object? datetimeRefcode = null,
    Object? digitalassetType = freezed,
    Object? digitalAssetPriceSet = freezed,
    Object? digitalAssetFeeSet = null,
  }) {
    return _then(_$ResponseOrderGetModelImpl(
      idOrder: freezed == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalassetPrice: freezed == digitalassetPrice
          ? _value.digitalassetPrice
          : digitalassetPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      digitalassetPriceActual: freezed == digitalassetPriceActual
          ? _value.digitalassetPriceActual
          : digitalassetPriceActual // ignore: cast_nullable_to_non_nullable
              as double?,
      listedPair: freezed == listedPair
          ? _value.listedPair
          : listedPair // ignore: cast_nullable_to_non_nullable
              as String?,
      topayExpireTime: freezed == topayExpireTime
          ? _value.topayExpireTime
          : topayExpireTime // ignore: cast_nullable_to_non_nullable
              as int?,
      datetimeCreate: null == datetimeCreate
          ? _value.datetimeCreate
          : datetimeCreate // ignore: cast_nullable_to_non_nullable
              as String,
      datetimePayment: null == datetimePayment
          ? _value.datetimePayment
          : datetimePayment // ignore: cast_nullable_to_non_nullable
              as String,
      datetimeComplete: null == datetimeComplete
          ? _value.datetimeComplete
          : datetimeComplete // ignore: cast_nullable_to_non_nullable
              as String,
      orderSide: freezed == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
              as String?,
      orderValueFiatSet: freezed == orderValueFiatSet
          ? _value.orderValueFiatSet
          : orderValueFiatSet // ignore: cast_nullable_to_non_nullable
              as double?,
      orderValueCryptoSet: freezed == orderValueCryptoSet
          ? _value.orderValueCryptoSet
          : orderValueCryptoSet // ignore: cast_nullable_to_non_nullable
              as double?,
      bankAccountNo: freezed == bankAccountNo
          ? _value.bankAccountNo
          : bankAccountNo // ignore: cast_nullable_to_non_nullable
              as String?,
      walletAddress: freezed == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      refCode: freezed == refCode
          ? _value.refCode
          : refCode // ignore: cast_nullable_to_non_nullable
              as String?,
      datetimeRefcode: null == datetimeRefcode
          ? _value.datetimeRefcode
          : datetimeRefcode // ignore: cast_nullable_to_non_nullable
              as String,
      digitalassetType: freezed == digitalassetType
          ? _value.digitalassetType
          : digitalassetType // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalAssetPriceSet: freezed == digitalAssetPriceSet
          ? _value.digitalAssetPriceSet
          : digitalAssetPriceSet // ignore: cast_nullable_to_non_nullable
              as double?,
      digitalAssetFeeSet: null == digitalAssetFeeSet
          ? _value.digitalAssetFeeSet
          : digitalAssetFeeSet // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ResponseOrderGetModelImpl implements _ResponseOrderGetModel {
  const _$ResponseOrderGetModelImpl(
      {@JsonKey(name: 'id_order') this.idOrder = 0,
      @JsonKey(name: 'id_user') this.idUser = '',
      @JsonKey(name: 'digitalasset_price') this.digitalassetPrice = 0,
      @JsonKey(name: 'digitalasset_price_actual')
      this.digitalassetPriceActual = 0,
      @JsonKey(name: 'listed_pair') this.listedPair = '',
      @JsonKey(name: 'topay_expire_time') this.topayExpireTime = 0,
      @JsonKey(name: 'datetime_create') this.datetimeCreate = '',
      @JsonKey(name: 'datetime_payment') this.datetimePayment = '',
      @JsonKey(name: 'datetime_complete') this.datetimeComplete = '',
      @JsonKey(name: 'order_side') this.orderSide = '',
      @JsonKey(name: 'order_value_fiat_set') this.orderValueFiatSet = 0,
      @JsonKey(name: 'order_value_crypto_set') this.orderValueCryptoSet = 0,
      @JsonKey(name: 'bankaccount_no') this.bankAccountNo = '',
      @JsonKey(name: 'wallet_address') this.walletAddress = '',
      @JsonKey(name: 'status') this.status = '',
      @JsonKey(name: 'cancel_reason') this.cancelReason = '',
      @JsonKey(name: 'refcode') this.refCode = '',
      @JsonKey(name: 'datetime_refcode') this.datetimeRefcode = '',
      @JsonKey(name: 'digitalasset_type') this.digitalassetType = '',
      @JsonKey(name: 'digitalasset_price_set') this.digitalAssetPriceSet = 0,
      @JsonKey(name: 'digitalasset_fee_set') this.digitalAssetFeeSet = 0});

  factory _$ResponseOrderGetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseOrderGetModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int? idOrder;
  @override
  @JsonKey(name: 'id_user')
  final String? idUser;
  @override
  @JsonKey(name: 'digitalasset_price')
  final double? digitalassetPrice;
  @override
  @JsonKey(name: 'digitalasset_price_actual')
  final double? digitalassetPriceActual;
  @override
  @JsonKey(name: 'listed_pair')
  final String? listedPair;
  @override
  @JsonKey(name: 'topay_expire_time')
  final int? topayExpireTime;
  @override
  @JsonKey(name: 'datetime_create')
  final String datetimeCreate;
  @override
  @JsonKey(name: 'datetime_payment')
  final String datetimePayment;
  @override
  @JsonKey(name: 'datetime_complete')
  final String datetimeComplete;
  @override
  @JsonKey(name: 'order_side')
  final String? orderSide;
  @override
  @JsonKey(name: 'order_value_fiat_set')
  final double? orderValueFiatSet;
  @override
  @JsonKey(name: 'order_value_crypto_set')
  final double? orderValueCryptoSet;
  @override
  @JsonKey(name: 'bankaccount_no')
  final String? bankAccountNo;
  @override
  @JsonKey(name: 'wallet_address')
  final String? walletAddress;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'cancel_reason')
  final String? cancelReason;
  @override
  @JsonKey(name: 'refcode')
  final String? refCode;
  @override
  @JsonKey(name: 'datetime_refcode')
  final String datetimeRefcode;
  @override
  @JsonKey(name: 'digitalasset_type')
  final String? digitalassetType;
  @override
  @JsonKey(name: 'digitalasset_price_set')
  final double? digitalAssetPriceSet;
  @override
  @JsonKey(name: 'digitalasset_fee_set')
  final double digitalAssetFeeSet;

  @override
  String toString() {
    return 'ResponseOrderGetModel(idOrder: $idOrder, idUser: $idUser, digitalassetPrice: $digitalassetPrice, digitalassetPriceActual: $digitalassetPriceActual, listedPair: $listedPair, topayExpireTime: $topayExpireTime, datetimeCreate: $datetimeCreate, datetimePayment: $datetimePayment, datetimeComplete: $datetimeComplete, orderSide: $orderSide, orderValueFiatSet: $orderValueFiatSet, orderValueCryptoSet: $orderValueCryptoSet, bankAccountNo: $bankAccountNo, walletAddress: $walletAddress, status: $status, cancelReason: $cancelReason, refCode: $refCode, datetimeRefcode: $datetimeRefcode, digitalassetType: $digitalassetType, digitalAssetPriceSet: $digitalAssetPriceSet, digitalAssetFeeSet: $digitalAssetFeeSet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOrderGetModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.digitalassetPrice, digitalassetPrice) ||
                other.digitalassetPrice == digitalassetPrice) &&
            (identical(
                    other.digitalassetPriceActual, digitalassetPriceActual) ||
                other.digitalassetPriceActual == digitalassetPriceActual) &&
            (identical(other.listedPair, listedPair) ||
                other.listedPair == listedPair) &&
            (identical(other.topayExpireTime, topayExpireTime) ||
                other.topayExpireTime == topayExpireTime) &&
            (identical(other.datetimeCreate, datetimeCreate) ||
                other.datetimeCreate == datetimeCreate) &&
            (identical(other.datetimePayment, datetimePayment) ||
                other.datetimePayment == datetimePayment) &&
            (identical(other.datetimeComplete, datetimeComplete) ||
                other.datetimeComplete == datetimeComplete) &&
            (identical(other.orderSide, orderSide) ||
                other.orderSide == orderSide) &&
            (identical(other.orderValueFiatSet, orderValueFiatSet) ||
                other.orderValueFiatSet == orderValueFiatSet) &&
            (identical(other.orderValueCryptoSet, orderValueCryptoSet) ||
                other.orderValueCryptoSet == orderValueCryptoSet) &&
            (identical(other.bankAccountNo, bankAccountNo) ||
                other.bankAccountNo == bankAccountNo) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason) &&
            (identical(other.refCode, refCode) || other.refCode == refCode) &&
            (identical(other.datetimeRefcode, datetimeRefcode) ||
                other.datetimeRefcode == datetimeRefcode) &&
            (identical(other.digitalassetType, digitalassetType) ||
                other.digitalassetType == digitalassetType) &&
            (identical(other.digitalAssetPriceSet, digitalAssetPriceSet) ||
                other.digitalAssetPriceSet == digitalAssetPriceSet) &&
            (identical(other.digitalAssetFeeSet, digitalAssetFeeSet) ||
                other.digitalAssetFeeSet == digitalAssetFeeSet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idOrder,
        idUser,
        digitalassetPrice,
        digitalassetPriceActual,
        listedPair,
        topayExpireTime,
        datetimeCreate,
        datetimePayment,
        datetimeComplete,
        orderSide,
        orderValueFiatSet,
        orderValueCryptoSet,
        bankAccountNo,
        walletAddress,
        status,
        cancelReason,
        refCode,
        datetimeRefcode,
        digitalassetType,
        digitalAssetPriceSet,
        digitalAssetFeeSet
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOrderGetModelImplCopyWith<_$ResponseOrderGetModelImpl>
      get copyWith => __$$ResponseOrderGetModelImplCopyWithImpl<
          _$ResponseOrderGetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOrderGetModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOrderGetModel implements ResponseOrderGetModel {
  const factory _ResponseOrderGetModel(
      {@JsonKey(name: 'id_order') final int? idOrder,
      @JsonKey(name: 'id_user') final String? idUser,
      @JsonKey(name: 'digitalasset_price') final double? digitalassetPrice,
      @JsonKey(name: 'digitalasset_price_actual')
      final double? digitalassetPriceActual,
      @JsonKey(name: 'listed_pair') final String? listedPair,
      @JsonKey(name: 'topay_expire_time') final int? topayExpireTime,
      @JsonKey(name: 'datetime_create') final String datetimeCreate,
      @JsonKey(name: 'datetime_payment') final String datetimePayment,
      @JsonKey(name: 'datetime_complete') final String datetimeComplete,
      @JsonKey(name: 'order_side') final String? orderSide,
      @JsonKey(name: 'order_value_fiat_set') final double? orderValueFiatSet,
      @JsonKey(name: 'order_value_crypto_set')
      final double? orderValueCryptoSet,
      @JsonKey(name: 'bankaccount_no') final String? bankAccountNo,
      @JsonKey(name: 'wallet_address') final String? walletAddress,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'cancel_reason') final String? cancelReason,
      @JsonKey(name: 'refcode') final String? refCode,
      @JsonKey(name: 'datetime_refcode') final String datetimeRefcode,
      @JsonKey(name: 'digitalasset_type') final String? digitalassetType,
      @JsonKey(name: 'digitalasset_price_set')
      final double? digitalAssetPriceSet,
      @JsonKey(name: 'digitalasset_fee_set')
      final double digitalAssetFeeSet}) = _$ResponseOrderGetModelImpl;

  factory _ResponseOrderGetModel.fromJson(Map<String, dynamic> json) =
      _$ResponseOrderGetModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int? get idOrder;
  @override
  @JsonKey(name: 'id_user')
  String? get idUser;
  @override
  @JsonKey(name: 'digitalasset_price')
  double? get digitalassetPrice;
  @override
  @JsonKey(name: 'digitalasset_price_actual')
  double? get digitalassetPriceActual;
  @override
  @JsonKey(name: 'listed_pair')
  String? get listedPair;
  @override
  @JsonKey(name: 'topay_expire_time')
  int? get topayExpireTime;
  @override
  @JsonKey(name: 'datetime_create')
  String get datetimeCreate;
  @override
  @JsonKey(name: 'datetime_payment')
  String get datetimePayment;
  @override
  @JsonKey(name: 'datetime_complete')
  String get datetimeComplete;
  @override
  @JsonKey(name: 'order_side')
  String? get orderSide;
  @override
  @JsonKey(name: 'order_value_fiat_set')
  double? get orderValueFiatSet;
  @override
  @JsonKey(name: 'order_value_crypto_set')
  double? get orderValueCryptoSet;
  @override
  @JsonKey(name: 'bankaccount_no')
  String? get bankAccountNo;
  @override
  @JsonKey(name: 'wallet_address')
  String? get walletAddress;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'cancel_reason')
  String? get cancelReason;
  @override
  @JsonKey(name: 'refcode')
  String? get refCode;
  @override
  @JsonKey(name: 'datetime_refcode')
  String get datetimeRefcode;
  @override
  @JsonKey(name: 'digitalasset_type')
  String? get digitalassetType;
  @override
  @JsonKey(name: 'digitalasset_price_set')
  double? get digitalAssetPriceSet;
  @override
  @JsonKey(name: 'digitalasset_fee_set')
  double get digitalAssetFeeSet;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOrderGetModelImplCopyWith<_$ResponseOrderGetModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
