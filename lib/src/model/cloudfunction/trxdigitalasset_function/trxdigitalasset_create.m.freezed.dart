// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trxdigitalasset_create.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestTrxDigitalAssetCreateModel _$RequestTrxDigitalAssetCreateModelFromJson(
    Map<String, dynamic> json) {
  return _RequestTrxDigitalAssetCreateModel.fromJson(json);
}

/// @nodoc
mixin _$RequestTrxDigitalAssetCreateModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_channel')
  String get paymentChannel => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_autosettle')
  bool get paymentAutoSettle => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_set')
  double get paymentValueSet => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_actual')
  double get paymentValueAcutal => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_fee')
  double get paymentValueFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_currency')
  String get paymentCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_wallet_des_actual')
  String get paymentAccountDesActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_needaudit')
  bool get isNeedAudit => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_needapprove')
  bool get isNeedApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get refcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestTrxDigitalAssetCreateModelCopyWith<RequestTrxDigitalAssetCreateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestTrxDigitalAssetCreateModelCopyWith<$Res> {
  factory $RequestTrxDigitalAssetCreateModelCopyWith(
          RequestTrxDigitalAssetCreateModel value,
          $Res Function(RequestTrxDigitalAssetCreateModel) then) =
      _$RequestTrxDigitalAssetCreateModelCopyWithImpl<$Res,
          RequestTrxDigitalAssetCreateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'payment_channel') String paymentChannel,
      @JsonKey(name: 'payment_autosettle') bool paymentAutoSettle,
      @JsonKey(name: 'payment_value_set') double paymentValueSet,
      @JsonKey(name: 'payment_value_actual') double paymentValueAcutal,
      @JsonKey(name: 'payment_value_fee') double paymentValueFee,
      @JsonKey(name: 'payment_currency') String paymentCurrency,
      @JsonKey(name: 'payment_wallet_des_actual')
      String paymentAccountDesActual,
      @JsonKey(name: 'is_needaudit') bool isNeedAudit,
      @JsonKey(name: 'is_needapprove') bool isNeedApprove,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class _$RequestTrxDigitalAssetCreateModelCopyWithImpl<$Res,
        $Val extends RequestTrxDigitalAssetCreateModel>
    implements $RequestTrxDigitalAssetCreateModelCopyWith<$Res> {
  _$RequestTrxDigitalAssetCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? paymentChannel = null,
    Object? paymentAutoSettle = null,
    Object? paymentValueSet = null,
    Object? paymentValueAcutal = null,
    Object? paymentValueFee = null,
    Object? paymentCurrency = null,
    Object? paymentAccountDesActual = null,
    Object? isNeedAudit = null,
    Object? isNeedApprove = null,
    Object? refcode = null,
  }) {
    return _then(_value.copyWith(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      paymentChannel: null == paymentChannel
          ? _value.paymentChannel
          : paymentChannel // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAutoSettle: null == paymentAutoSettle
          ? _value.paymentAutoSettle
          : paymentAutoSettle // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentValueSet: null == paymentValueSet
          ? _value.paymentValueSet
          : paymentValueSet // ignore: cast_nullable_to_non_nullable
              as double,
      paymentValueAcutal: null == paymentValueAcutal
          ? _value.paymentValueAcutal
          : paymentValueAcutal // ignore: cast_nullable_to_non_nullable
              as double,
      paymentValueFee: null == paymentValueFee
          ? _value.paymentValueFee
          : paymentValueFee // ignore: cast_nullable_to_non_nullable
              as double,
      paymentCurrency: null == paymentCurrency
          ? _value.paymentCurrency
          : paymentCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAccountDesActual: null == paymentAccountDesActual
          ? _value.paymentAccountDesActual
          : paymentAccountDesActual // ignore: cast_nullable_to_non_nullable
              as String,
      isNeedAudit: null == isNeedAudit
          ? _value.isNeedAudit
          : isNeedAudit // ignore: cast_nullable_to_non_nullable
              as bool,
      isNeedApprove: null == isNeedApprove
          ? _value.isNeedApprove
          : isNeedApprove // ignore: cast_nullable_to_non_nullable
              as bool,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestTrxDigitalAssetCreateModelImplCopyWith<$Res>
    implements $RequestTrxDigitalAssetCreateModelCopyWith<$Res> {
  factory _$$RequestTrxDigitalAssetCreateModelImplCopyWith(
          _$RequestTrxDigitalAssetCreateModelImpl value,
          $Res Function(_$RequestTrxDigitalAssetCreateModelImpl) then) =
      __$$RequestTrxDigitalAssetCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'payment_channel') String paymentChannel,
      @JsonKey(name: 'payment_autosettle') bool paymentAutoSettle,
      @JsonKey(name: 'payment_value_set') double paymentValueSet,
      @JsonKey(name: 'payment_value_actual') double paymentValueAcutal,
      @JsonKey(name: 'payment_value_fee') double paymentValueFee,
      @JsonKey(name: 'payment_currency') String paymentCurrency,
      @JsonKey(name: 'payment_wallet_des_actual')
      String paymentAccountDesActual,
      @JsonKey(name: 'is_needaudit') bool isNeedAudit,
      @JsonKey(name: 'is_needapprove') bool isNeedApprove,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class __$$RequestTrxDigitalAssetCreateModelImplCopyWithImpl<$Res>
    extends _$RequestTrxDigitalAssetCreateModelCopyWithImpl<$Res,
        _$RequestTrxDigitalAssetCreateModelImpl>
    implements _$$RequestTrxDigitalAssetCreateModelImplCopyWith<$Res> {
  __$$RequestTrxDigitalAssetCreateModelImplCopyWithImpl(
      _$RequestTrxDigitalAssetCreateModelImpl _value,
      $Res Function(_$RequestTrxDigitalAssetCreateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? paymentChannel = null,
    Object? paymentAutoSettle = null,
    Object? paymentValueSet = null,
    Object? paymentValueAcutal = null,
    Object? paymentValueFee = null,
    Object? paymentCurrency = null,
    Object? paymentAccountDesActual = null,
    Object? isNeedAudit = null,
    Object? isNeedApprove = null,
    Object? refcode = null,
  }) {
    return _then(_$RequestTrxDigitalAssetCreateModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      paymentChannel: null == paymentChannel
          ? _value.paymentChannel
          : paymentChannel // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAutoSettle: null == paymentAutoSettle
          ? _value.paymentAutoSettle
          : paymentAutoSettle // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentValueSet: null == paymentValueSet
          ? _value.paymentValueSet
          : paymentValueSet // ignore: cast_nullable_to_non_nullable
              as double,
      paymentValueAcutal: null == paymentValueAcutal
          ? _value.paymentValueAcutal
          : paymentValueAcutal // ignore: cast_nullable_to_non_nullable
              as double,
      paymentValueFee: null == paymentValueFee
          ? _value.paymentValueFee
          : paymentValueFee // ignore: cast_nullable_to_non_nullable
              as double,
      paymentCurrency: null == paymentCurrency
          ? _value.paymentCurrency
          : paymentCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAccountDesActual: null == paymentAccountDesActual
          ? _value.paymentAccountDesActual
          : paymentAccountDesActual // ignore: cast_nullable_to_non_nullable
              as String,
      isNeedAudit: null == isNeedAudit
          ? _value.isNeedAudit
          : isNeedAudit // ignore: cast_nullable_to_non_nullable
              as bool,
      isNeedApprove: null == isNeedApprove
          ? _value.isNeedApprove
          : isNeedApprove // ignore: cast_nullable_to_non_nullable
              as bool,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestTrxDigitalAssetCreateModelImpl
    implements _RequestTrxDigitalAssetCreateModel {
  const _$RequestTrxDigitalAssetCreateModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder,
      @JsonKey(name: 'payment_channel') required this.paymentChannel,
      @JsonKey(name: 'payment_autosettle') required this.paymentAutoSettle,
      @JsonKey(name: 'payment_value_set') required this.paymentValueSet,
      @JsonKey(name: 'payment_value_actual') required this.paymentValueAcutal,
      @JsonKey(name: 'payment_value_fee') required this.paymentValueFee,
      @JsonKey(name: 'payment_currency') required this.paymentCurrency,
      @JsonKey(name: 'payment_wallet_des_actual')
      required this.paymentAccountDesActual,
      @JsonKey(name: 'is_needaudit') required this.isNeedAudit,
      @JsonKey(name: 'is_needapprove') required this.isNeedApprove,
      @JsonKey(name: 'refcode') required this.refcode});

  factory _$RequestTrxDigitalAssetCreateModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestTrxDigitalAssetCreateModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;
  @override
  @JsonKey(name: 'payment_channel')
  final String paymentChannel;
  @override
  @JsonKey(name: 'payment_autosettle')
  final bool paymentAutoSettle;
  @override
  @JsonKey(name: 'payment_value_set')
  final double paymentValueSet;
  @override
  @JsonKey(name: 'payment_value_actual')
  final double paymentValueAcutal;
  @override
  @JsonKey(name: 'payment_value_fee')
  final double paymentValueFee;
  @override
  @JsonKey(name: 'payment_currency')
  final String paymentCurrency;
  @override
  @JsonKey(name: 'payment_wallet_des_actual')
  final String paymentAccountDesActual;
  @override
  @JsonKey(name: 'is_needaudit')
  final bool isNeedAudit;
  @override
  @JsonKey(name: 'is_needapprove')
  final bool isNeedApprove;
  @override
  @JsonKey(name: 'refcode')
  final String refcode;

  @override
  String toString() {
    return 'RequestTrxDigitalAssetCreateModel(idOrder: $idOrder, paymentChannel: $paymentChannel, paymentAutoSettle: $paymentAutoSettle, paymentValueSet: $paymentValueSet, paymentValueAcutal: $paymentValueAcutal, paymentValueFee: $paymentValueFee, paymentCurrency: $paymentCurrency, paymentAccountDesActual: $paymentAccountDesActual, isNeedAudit: $isNeedAudit, isNeedApprove: $isNeedApprove, refcode: $refcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestTrxDigitalAssetCreateModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder) &&
            (identical(other.paymentChannel, paymentChannel) ||
                other.paymentChannel == paymentChannel) &&
            (identical(other.paymentAutoSettle, paymentAutoSettle) ||
                other.paymentAutoSettle == paymentAutoSettle) &&
            (identical(other.paymentValueSet, paymentValueSet) ||
                other.paymentValueSet == paymentValueSet) &&
            (identical(other.paymentValueAcutal, paymentValueAcutal) ||
                other.paymentValueAcutal == paymentValueAcutal) &&
            (identical(other.paymentValueFee, paymentValueFee) ||
                other.paymentValueFee == paymentValueFee) &&
            (identical(other.paymentCurrency, paymentCurrency) ||
                other.paymentCurrency == paymentCurrency) &&
            (identical(
                    other.paymentAccountDesActual, paymentAccountDesActual) ||
                other.paymentAccountDesActual == paymentAccountDesActual) &&
            (identical(other.isNeedAudit, isNeedAudit) ||
                other.isNeedAudit == isNeedAudit) &&
            (identical(other.isNeedApprove, isNeedApprove) ||
                other.isNeedApprove == isNeedApprove) &&
            (identical(other.refcode, refcode) || other.refcode == refcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idOrder,
      paymentChannel,
      paymentAutoSettle,
      paymentValueSet,
      paymentValueAcutal,
      paymentValueFee,
      paymentCurrency,
      paymentAccountDesActual,
      isNeedAudit,
      isNeedApprove,
      refcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestTrxDigitalAssetCreateModelImplCopyWith<
          _$RequestTrxDigitalAssetCreateModelImpl>
      get copyWith => __$$RequestTrxDigitalAssetCreateModelImplCopyWithImpl<
          _$RequestTrxDigitalAssetCreateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestTrxDigitalAssetCreateModelImplToJson(
      this,
    );
  }
}

abstract class _RequestTrxDigitalAssetCreateModel
    implements RequestTrxDigitalAssetCreateModel {
  const factory _RequestTrxDigitalAssetCreateModel(
      {@JsonKey(name: 'id_order') required final int idOrder,
      @JsonKey(name: 'payment_channel') required final String paymentChannel,
      @JsonKey(name: 'payment_autosettle')
      required final bool paymentAutoSettle,
      @JsonKey(name: 'payment_value_set') required final double paymentValueSet,
      @JsonKey(name: 'payment_value_actual')
      required final double paymentValueAcutal,
      @JsonKey(name: 'payment_value_fee') required final double paymentValueFee,
      @JsonKey(name: 'payment_currency') required final String paymentCurrency,
      @JsonKey(name: 'payment_wallet_des_actual')
      required final String paymentAccountDesActual,
      @JsonKey(name: 'is_needaudit') required final bool isNeedAudit,
      @JsonKey(name: 'is_needapprove') required final bool isNeedApprove,
      @JsonKey(name: 'refcode')
      required final String refcode}) = _$RequestTrxDigitalAssetCreateModelImpl;

  factory _RequestTrxDigitalAssetCreateModel.fromJson(
          Map<String, dynamic> json) =
      _$RequestTrxDigitalAssetCreateModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(name: 'payment_channel')
  String get paymentChannel;
  @override
  @JsonKey(name: 'payment_autosettle')
  bool get paymentAutoSettle;
  @override
  @JsonKey(name: 'payment_value_set')
  double get paymentValueSet;
  @override
  @JsonKey(name: 'payment_value_actual')
  double get paymentValueAcutal;
  @override
  @JsonKey(name: 'payment_value_fee')
  double get paymentValueFee;
  @override
  @JsonKey(name: 'payment_currency')
  String get paymentCurrency;
  @override
  @JsonKey(name: 'payment_wallet_des_actual')
  String get paymentAccountDesActual;
  @override
  @JsonKey(name: 'is_needaudit')
  bool get isNeedAudit;
  @override
  @JsonKey(name: 'is_needapprove')
  bool get isNeedApprove;
  @override
  @JsonKey(name: 'refcode')
  String get refcode;
  @override
  @JsonKey(ignore: true)
  _$$RequestTrxDigitalAssetCreateModelImplCopyWith<
          _$RequestTrxDigitalAssetCreateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseTrxDigitalAssetCreateModel _$ResponseTrxDigitalAssetCreateModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseTrxDigitalAssetCreateModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseTrxDigitalAssetCreateModel {
  @JsonKey(name: 'id_trxdigitalasset')
  int get idTrxDigitalAsset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseTrxDigitalAssetCreateModelCopyWith<
          ResponseTrxDigitalAssetCreateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseTrxDigitalAssetCreateModelCopyWith<$Res> {
  factory $ResponseTrxDigitalAssetCreateModelCopyWith(
          ResponseTrxDigitalAssetCreateModel value,
          $Res Function(ResponseTrxDigitalAssetCreateModel) then) =
      _$ResponseTrxDigitalAssetCreateModelCopyWithImpl<$Res,
          ResponseTrxDigitalAssetCreateModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_trxdigitalasset') int idTrxDigitalAsset});
}

/// @nodoc
class _$ResponseTrxDigitalAssetCreateModelCopyWithImpl<$Res,
        $Val extends ResponseTrxDigitalAssetCreateModel>
    implements $ResponseTrxDigitalAssetCreateModelCopyWith<$Res> {
  _$ResponseTrxDigitalAssetCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxDigitalAsset = null,
  }) {
    return _then(_value.copyWith(
      idTrxDigitalAsset: null == idTrxDigitalAsset
          ? _value.idTrxDigitalAsset
          : idTrxDigitalAsset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseTrxDigitalAssetCreateModelImplCopyWith<$Res>
    implements $ResponseTrxDigitalAssetCreateModelCopyWith<$Res> {
  factory _$$ResponseTrxDigitalAssetCreateModelImplCopyWith(
          _$ResponseTrxDigitalAssetCreateModelImpl value,
          $Res Function(_$ResponseTrxDigitalAssetCreateModelImpl) then) =
      __$$ResponseTrxDigitalAssetCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_trxdigitalasset') int idTrxDigitalAsset});
}

/// @nodoc
class __$$ResponseTrxDigitalAssetCreateModelImplCopyWithImpl<$Res>
    extends _$ResponseTrxDigitalAssetCreateModelCopyWithImpl<$Res,
        _$ResponseTrxDigitalAssetCreateModelImpl>
    implements _$$ResponseTrxDigitalAssetCreateModelImplCopyWith<$Res> {
  __$$ResponseTrxDigitalAssetCreateModelImplCopyWithImpl(
      _$ResponseTrxDigitalAssetCreateModelImpl _value,
      $Res Function(_$ResponseTrxDigitalAssetCreateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxDigitalAsset = null,
  }) {
    return _then(_$ResponseTrxDigitalAssetCreateModelImpl(
      idTrxDigitalAsset: null == idTrxDigitalAsset
          ? _value.idTrxDigitalAsset
          : idTrxDigitalAsset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseTrxDigitalAssetCreateModelImpl
    implements _ResponseTrxDigitalAssetCreateModel {
  const _$ResponseTrxDigitalAssetCreateModelImpl(
      {@JsonKey(name: 'id_trxdigitalasset') required this.idTrxDigitalAsset});

  factory _$ResponseTrxDigitalAssetCreateModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseTrxDigitalAssetCreateModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_trxdigitalasset')
  final int idTrxDigitalAsset;

  @override
  String toString() {
    return 'ResponseTrxDigitalAssetCreateModel(idTrxDigitalAsset: $idTrxDigitalAsset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseTrxDigitalAssetCreateModelImpl &&
            (identical(other.idTrxDigitalAsset, idTrxDigitalAsset) ||
                other.idTrxDigitalAsset == idTrxDigitalAsset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idTrxDigitalAsset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseTrxDigitalAssetCreateModelImplCopyWith<
          _$ResponseTrxDigitalAssetCreateModelImpl>
      get copyWith => __$$ResponseTrxDigitalAssetCreateModelImplCopyWithImpl<
          _$ResponseTrxDigitalAssetCreateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseTrxDigitalAssetCreateModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseTrxDigitalAssetCreateModel
    implements ResponseTrxDigitalAssetCreateModel {
  const factory _ResponseTrxDigitalAssetCreateModel(
          {@JsonKey(name: 'id_trxdigitalasset')
          required final int idTrxDigitalAsset}) =
      _$ResponseTrxDigitalAssetCreateModelImpl;

  factory _ResponseTrxDigitalAssetCreateModel.fromJson(
          Map<String, dynamic> json) =
      _$ResponseTrxDigitalAssetCreateModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_trxdigitalasset')
  int get idTrxDigitalAsset;
  @override
  @JsonKey(ignore: true)
  _$$ResponseTrxDigitalAssetCreateModelImplCopyWith<
          _$ResponseTrxDigitalAssetCreateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
