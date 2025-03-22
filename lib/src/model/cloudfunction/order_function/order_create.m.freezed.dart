// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_create.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOrderCreateModel _$RequestOrderCreateModelFromJson(
    Map<String, dynamic> json) {
  return _RequestOrderCreateModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderCreateModel {
  @JsonKey(name: 'digitalasset_price_set')
  double get digitalAssetPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'listed_pair')
  String get listedPair =>
      throw _privateConstructorUsedError; // @Default(0) @JsonKey(name: 'topay_expire_time') int todayExpireTime,
  @JsonKey(name: 'order_side')
  String get orderSide => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_value_fiat_set')
  double get orderValueFiatSet => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_value_crypto_set')
  double get orderValueCryptoSet => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankaccount_no')
  String get bankAccountNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_address')
  String get walletAdress => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_type')
  String get digitalAssetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_fee_set')
  double get digitalAssetFeeSet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOrderCreateModelCopyWith<RequestOrderCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderCreateModelCopyWith<$Res> {
  factory $RequestOrderCreateModelCopyWith(RequestOrderCreateModel value,
          $Res Function(RequestOrderCreateModel) then) =
      _$RequestOrderCreateModelCopyWithImpl<$Res, RequestOrderCreateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'digitalasset_price_set') double digitalAssetPrice,
      @JsonKey(name: 'listed_pair') String listedPair,
      @JsonKey(name: 'order_side') String orderSide,
      @JsonKey(name: 'order_value_fiat_set') double orderValueFiatSet,
      @JsonKey(name: 'order_value_crypto_set') double orderValueCryptoSet,
      @JsonKey(name: 'bankaccount_no') String bankAccountNo,
      @JsonKey(name: 'wallet_address') String walletAdress,
      @JsonKey(name: 'digitalasset_type') String digitalAssetType,
      @JsonKey(name: 'digitalasset_fee_set') double digitalAssetFeeSet});
}

/// @nodoc
class _$RequestOrderCreateModelCopyWithImpl<$Res,
        $Val extends RequestOrderCreateModel>
    implements $RequestOrderCreateModelCopyWith<$Res> {
  _$RequestOrderCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digitalAssetPrice = null,
    Object? listedPair = null,
    Object? orderSide = null,
    Object? orderValueFiatSet = null,
    Object? orderValueCryptoSet = null,
    Object? bankAccountNo = null,
    Object? walletAdress = null,
    Object? digitalAssetType = null,
    Object? digitalAssetFeeSet = null,
  }) {
    return _then(_value.copyWith(
      digitalAssetPrice: null == digitalAssetPrice
          ? _value.digitalAssetPrice
          : digitalAssetPrice // ignore: cast_nullable_to_non_nullable
              as double,
      listedPair: null == listedPair
          ? _value.listedPair
          : listedPair // ignore: cast_nullable_to_non_nullable
              as String,
      orderSide: null == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
              as String,
      orderValueFiatSet: null == orderValueFiatSet
          ? _value.orderValueFiatSet
          : orderValueFiatSet // ignore: cast_nullable_to_non_nullable
              as double,
      orderValueCryptoSet: null == orderValueCryptoSet
          ? _value.orderValueCryptoSet
          : orderValueCryptoSet // ignore: cast_nullable_to_non_nullable
              as double,
      bankAccountNo: null == bankAccountNo
          ? _value.bankAccountNo
          : bankAccountNo // ignore: cast_nullable_to_non_nullable
              as String,
      walletAdress: null == walletAdress
          ? _value.walletAdress
          : walletAdress // ignore: cast_nullable_to_non_nullable
              as String,
      digitalAssetType: null == digitalAssetType
          ? _value.digitalAssetType
          : digitalAssetType // ignore: cast_nullable_to_non_nullable
              as String,
      digitalAssetFeeSet: null == digitalAssetFeeSet
          ? _value.digitalAssetFeeSet
          : digitalAssetFeeSet // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOrderCreateModelImplCopyWith<$Res>
    implements $RequestOrderCreateModelCopyWith<$Res> {
  factory _$$RequestOrderCreateModelImplCopyWith(
          _$RequestOrderCreateModelImpl value,
          $Res Function(_$RequestOrderCreateModelImpl) then) =
      __$$RequestOrderCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'digitalasset_price_set') double digitalAssetPrice,
      @JsonKey(name: 'listed_pair') String listedPair,
      @JsonKey(name: 'order_side') String orderSide,
      @JsonKey(name: 'order_value_fiat_set') double orderValueFiatSet,
      @JsonKey(name: 'order_value_crypto_set') double orderValueCryptoSet,
      @JsonKey(name: 'bankaccount_no') String bankAccountNo,
      @JsonKey(name: 'wallet_address') String walletAdress,
      @JsonKey(name: 'digitalasset_type') String digitalAssetType,
      @JsonKey(name: 'digitalasset_fee_set') double digitalAssetFeeSet});
}

/// @nodoc
class __$$RequestOrderCreateModelImplCopyWithImpl<$Res>
    extends _$RequestOrderCreateModelCopyWithImpl<$Res,
        _$RequestOrderCreateModelImpl>
    implements _$$RequestOrderCreateModelImplCopyWith<$Res> {
  __$$RequestOrderCreateModelImplCopyWithImpl(
      _$RequestOrderCreateModelImpl _value,
      $Res Function(_$RequestOrderCreateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digitalAssetPrice = null,
    Object? listedPair = null,
    Object? orderSide = null,
    Object? orderValueFiatSet = null,
    Object? orderValueCryptoSet = null,
    Object? bankAccountNo = null,
    Object? walletAdress = null,
    Object? digitalAssetType = null,
    Object? digitalAssetFeeSet = null,
  }) {
    return _then(_$RequestOrderCreateModelImpl(
      digitalAssetPrice: null == digitalAssetPrice
          ? _value.digitalAssetPrice
          : digitalAssetPrice // ignore: cast_nullable_to_non_nullable
              as double,
      listedPair: null == listedPair
          ? _value.listedPair
          : listedPair // ignore: cast_nullable_to_non_nullable
              as String,
      orderSide: null == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
              as String,
      orderValueFiatSet: null == orderValueFiatSet
          ? _value.orderValueFiatSet
          : orderValueFiatSet // ignore: cast_nullable_to_non_nullable
              as double,
      orderValueCryptoSet: null == orderValueCryptoSet
          ? _value.orderValueCryptoSet
          : orderValueCryptoSet // ignore: cast_nullable_to_non_nullable
              as double,
      bankAccountNo: null == bankAccountNo
          ? _value.bankAccountNo
          : bankAccountNo // ignore: cast_nullable_to_non_nullable
              as String,
      walletAdress: null == walletAdress
          ? _value.walletAdress
          : walletAdress // ignore: cast_nullable_to_non_nullable
              as String,
      digitalAssetType: null == digitalAssetType
          ? _value.digitalAssetType
          : digitalAssetType // ignore: cast_nullable_to_non_nullable
              as String,
      digitalAssetFeeSet: null == digitalAssetFeeSet
          ? _value.digitalAssetFeeSet
          : digitalAssetFeeSet // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderCreateModelImpl implements _RequestOrderCreateModel {
  const _$RequestOrderCreateModelImpl(
      {@JsonKey(name: 'digitalasset_price_set') this.digitalAssetPrice = 0,
      @JsonKey(name: 'listed_pair') this.listedPair = '',
      @JsonKey(name: 'order_side') this.orderSide = '',
      @JsonKey(name: 'order_value_fiat_set') this.orderValueFiatSet = 0,
      @JsonKey(name: 'order_value_crypto_set') this.orderValueCryptoSet = 0,
      @JsonKey(name: 'bankaccount_no') this.bankAccountNo = '',
      @JsonKey(name: 'wallet_address') this.walletAdress = '',
      @JsonKey(name: 'digitalasset_type') this.digitalAssetType = '',
      @JsonKey(name: 'digitalasset_fee_set') this.digitalAssetFeeSet = 0});

  factory _$RequestOrderCreateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOrderCreateModelImplFromJson(json);

  @override
  @JsonKey(name: 'digitalasset_price_set')
  final double digitalAssetPrice;
  @override
  @JsonKey(name: 'listed_pair')
  final String listedPair;
// @Default(0) @JsonKey(name: 'topay_expire_time') int todayExpireTime,
  @override
  @JsonKey(name: 'order_side')
  final String orderSide;
  @override
  @JsonKey(name: 'order_value_fiat_set')
  final double orderValueFiatSet;
  @override
  @JsonKey(name: 'order_value_crypto_set')
  final double orderValueCryptoSet;
  @override
  @JsonKey(name: 'bankaccount_no')
  final String bankAccountNo;
  @override
  @JsonKey(name: 'wallet_address')
  final String walletAdress;
  @override
  @JsonKey(name: 'digitalasset_type')
  final String digitalAssetType;
  @override
  @JsonKey(name: 'digitalasset_fee_set')
  final double digitalAssetFeeSet;

  @override
  String toString() {
    return 'RequestOrderCreateModel(digitalAssetPrice: $digitalAssetPrice, listedPair: $listedPair, orderSide: $orderSide, orderValueFiatSet: $orderValueFiatSet, orderValueCryptoSet: $orderValueCryptoSet, bankAccountNo: $bankAccountNo, walletAdress: $walletAdress, digitalAssetType: $digitalAssetType, digitalAssetFeeSet: $digitalAssetFeeSet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderCreateModelImpl &&
            (identical(other.digitalAssetPrice, digitalAssetPrice) ||
                other.digitalAssetPrice == digitalAssetPrice) &&
            (identical(other.listedPair, listedPair) ||
                other.listedPair == listedPair) &&
            (identical(other.orderSide, orderSide) ||
                other.orderSide == orderSide) &&
            (identical(other.orderValueFiatSet, orderValueFiatSet) ||
                other.orderValueFiatSet == orderValueFiatSet) &&
            (identical(other.orderValueCryptoSet, orderValueCryptoSet) ||
                other.orderValueCryptoSet == orderValueCryptoSet) &&
            (identical(other.bankAccountNo, bankAccountNo) ||
                other.bankAccountNo == bankAccountNo) &&
            (identical(other.walletAdress, walletAdress) ||
                other.walletAdress == walletAdress) &&
            (identical(other.digitalAssetType, digitalAssetType) ||
                other.digitalAssetType == digitalAssetType) &&
            (identical(other.digitalAssetFeeSet, digitalAssetFeeSet) ||
                other.digitalAssetFeeSet == digitalAssetFeeSet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      digitalAssetPrice,
      listedPair,
      orderSide,
      orderValueFiatSet,
      orderValueCryptoSet,
      bankAccountNo,
      walletAdress,
      digitalAssetType,
      digitalAssetFeeSet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderCreateModelImplCopyWith<_$RequestOrderCreateModelImpl>
      get copyWith => __$$RequestOrderCreateModelImplCopyWithImpl<
          _$RequestOrderCreateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderCreateModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderCreateModel implements RequestOrderCreateModel {
  const factory _RequestOrderCreateModel(
      {@JsonKey(name: 'digitalasset_price_set') final double digitalAssetPrice,
      @JsonKey(name: 'listed_pair') final String listedPair,
      @JsonKey(name: 'order_side') final String orderSide,
      @JsonKey(name: 'order_value_fiat_set') final double orderValueFiatSet,
      @JsonKey(name: 'order_value_crypto_set') final double orderValueCryptoSet,
      @JsonKey(name: 'bankaccount_no') final String bankAccountNo,
      @JsonKey(name: 'wallet_address') final String walletAdress,
      @JsonKey(name: 'digitalasset_type') final String digitalAssetType,
      @JsonKey(name: 'digitalasset_fee_set')
      final double digitalAssetFeeSet}) = _$RequestOrderCreateModelImpl;

  factory _RequestOrderCreateModel.fromJson(Map<String, dynamic> json) =
      _$RequestOrderCreateModelImpl.fromJson;

  @override
  @JsonKey(name: 'digitalasset_price_set')
  double get digitalAssetPrice;
  @override
  @JsonKey(name: 'listed_pair')
  String get listedPair;
  @override // @Default(0) @JsonKey(name: 'topay_expire_time') int todayExpireTime,
  @JsonKey(name: 'order_side')
  String get orderSide;
  @override
  @JsonKey(name: 'order_value_fiat_set')
  double get orderValueFiatSet;
  @override
  @JsonKey(name: 'order_value_crypto_set')
  double get orderValueCryptoSet;
  @override
  @JsonKey(name: 'bankaccount_no')
  String get bankAccountNo;
  @override
  @JsonKey(name: 'wallet_address')
  String get walletAdress;
  @override
  @JsonKey(name: 'digitalasset_type')
  String get digitalAssetType;
  @override
  @JsonKey(name: 'digitalasset_fee_set')
  double get digitalAssetFeeSet;
  @override
  @JsonKey(ignore: true)
  _$$RequestOrderCreateModelImplCopyWith<_$RequestOrderCreateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseOrderCreateModel _$ResponseOrderCreateModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOrderCreateModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOrderCreateModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get refcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOrderCreateModelCopyWith<ResponseOrderCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOrderCreateModelCopyWith<$Res> {
  factory $ResponseOrderCreateModelCopyWith(ResponseOrderCreateModel value,
          $Res Function(ResponseOrderCreateModel) then) =
      _$ResponseOrderCreateModelCopyWithImpl<$Res, ResponseOrderCreateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class _$ResponseOrderCreateModelCopyWithImpl<$Res,
        $Val extends ResponseOrderCreateModel>
    implements $ResponseOrderCreateModelCopyWith<$Res> {
  _$ResponseOrderCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? refcode = null,
  }) {
    return _then(_value.copyWith(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseOrderCreateModelImplCopyWith<$Res>
    implements $ResponseOrderCreateModelCopyWith<$Res> {
  factory _$$ResponseOrderCreateModelImplCopyWith(
          _$ResponseOrderCreateModelImpl value,
          $Res Function(_$ResponseOrderCreateModelImpl) then) =
      __$$ResponseOrderCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class __$$ResponseOrderCreateModelImplCopyWithImpl<$Res>
    extends _$ResponseOrderCreateModelCopyWithImpl<$Res,
        _$ResponseOrderCreateModelImpl>
    implements _$$ResponseOrderCreateModelImplCopyWith<$Res> {
  __$$ResponseOrderCreateModelImplCopyWithImpl(
      _$ResponseOrderCreateModelImpl _value,
      $Res Function(_$ResponseOrderCreateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? refcode = null,
  }) {
    return _then(_$ResponseOrderCreateModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseOrderCreateModelImpl implements _ResponseOrderCreateModel {
  const _$ResponseOrderCreateModelImpl(
      {@JsonKey(name: 'id_order') this.idOrder = 0,
      @JsonKey(name: 'refcode') this.refcode = ''});

  factory _$ResponseOrderCreateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseOrderCreateModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;
  @override
  @JsonKey(name: 'refcode')
  final String refcode;

  @override
  String toString() {
    return 'ResponseOrderCreateModel(idOrder: $idOrder, refcode: $refcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOrderCreateModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder) &&
            (identical(other.refcode, refcode) || other.refcode == refcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder, refcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOrderCreateModelImplCopyWith<_$ResponseOrderCreateModelImpl>
      get copyWith => __$$ResponseOrderCreateModelImplCopyWithImpl<
          _$ResponseOrderCreateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOrderCreateModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOrderCreateModel implements ResponseOrderCreateModel {
  const factory _ResponseOrderCreateModel(
          {@JsonKey(name: 'id_order') final int idOrder,
          @JsonKey(name: 'refcode') final String refcode}) =
      _$ResponseOrderCreateModelImpl;

  factory _ResponseOrderCreateModel.fromJson(Map<String, dynamic> json) =
      _$ResponseOrderCreateModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(name: 'refcode')
  String get refcode;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOrderCreateModelImplCopyWith<_$ResponseOrderCreateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
