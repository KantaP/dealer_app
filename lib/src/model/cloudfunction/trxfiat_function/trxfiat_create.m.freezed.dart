// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trxfiat_create.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestTrxFiatCreateModel _$RequestTrxFiatCreateModelFromJson(
    Map<String, dynamic> json) {
  return _RequestTrxFiatCreateModel.fromJson(json);
}

/// @nodoc
mixin _$RequestTrxFiatCreateModel {
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
  @JsonKey(name: 'payment_account_src_actual')
  String get paymentAccountSrcActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_account_des_actual')
  String get paymentAccountDesActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_needaudit')
  bool get isNeedAudit => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_needapprove')
  bool get isNeedApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get refcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestTrxFiatCreateModelCopyWith<RequestTrxFiatCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestTrxFiatCreateModelCopyWith<$Res> {
  factory $RequestTrxFiatCreateModelCopyWith(RequestTrxFiatCreateModel value,
          $Res Function(RequestTrxFiatCreateModel) then) =
      _$RequestTrxFiatCreateModelCopyWithImpl<$Res, RequestTrxFiatCreateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'payment_channel') String paymentChannel,
      @JsonKey(name: 'payment_autosettle') bool paymentAutoSettle,
      @JsonKey(name: 'payment_value_set') double paymentValueSet,
      @JsonKey(name: 'payment_value_actual') double paymentValueAcutal,
      @JsonKey(name: 'payment_value_fee') double paymentValueFee,
      @JsonKey(name: 'payment_currency') String paymentCurrency,
      @JsonKey(name: 'payment_account_src_actual')
      String paymentAccountSrcActual,
      @JsonKey(name: 'payment_account_des_actual')
      String paymentAccountDesActual,
      @JsonKey(name: 'is_needaudit') bool isNeedAudit,
      @JsonKey(name: 'is_needapprove') bool isNeedApprove,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class _$RequestTrxFiatCreateModelCopyWithImpl<$Res,
        $Val extends RequestTrxFiatCreateModel>
    implements $RequestTrxFiatCreateModelCopyWith<$Res> {
  _$RequestTrxFiatCreateModelCopyWithImpl(this._value, this._then);

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
    Object? paymentAccountSrcActual = null,
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
      paymentAccountSrcActual: null == paymentAccountSrcActual
          ? _value.paymentAccountSrcActual
          : paymentAccountSrcActual // ignore: cast_nullable_to_non_nullable
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
abstract class _$$RequestTrxFiatCreateModelImplCopyWith<$Res>
    implements $RequestTrxFiatCreateModelCopyWith<$Res> {
  factory _$$RequestTrxFiatCreateModelImplCopyWith(
          _$RequestTrxFiatCreateModelImpl value,
          $Res Function(_$RequestTrxFiatCreateModelImpl) then) =
      __$$RequestTrxFiatCreateModelImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'payment_account_src_actual')
      String paymentAccountSrcActual,
      @JsonKey(name: 'payment_account_des_actual')
      String paymentAccountDesActual,
      @JsonKey(name: 'is_needaudit') bool isNeedAudit,
      @JsonKey(name: 'is_needapprove') bool isNeedApprove,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class __$$RequestTrxFiatCreateModelImplCopyWithImpl<$Res>
    extends _$RequestTrxFiatCreateModelCopyWithImpl<$Res,
        _$RequestTrxFiatCreateModelImpl>
    implements _$$RequestTrxFiatCreateModelImplCopyWith<$Res> {
  __$$RequestTrxFiatCreateModelImplCopyWithImpl(
      _$RequestTrxFiatCreateModelImpl _value,
      $Res Function(_$RequestTrxFiatCreateModelImpl) _then)
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
    Object? paymentAccountSrcActual = null,
    Object? paymentAccountDesActual = null,
    Object? isNeedAudit = null,
    Object? isNeedApprove = null,
    Object? refcode = null,
  }) {
    return _then(_$RequestTrxFiatCreateModelImpl(
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
      paymentAccountSrcActual: null == paymentAccountSrcActual
          ? _value.paymentAccountSrcActual
          : paymentAccountSrcActual // ignore: cast_nullable_to_non_nullable
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
class _$RequestTrxFiatCreateModelImpl implements _RequestTrxFiatCreateModel {
  const _$RequestTrxFiatCreateModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder,
      @JsonKey(name: 'payment_channel') required this.paymentChannel,
      @JsonKey(name: 'payment_autosettle') required this.paymentAutoSettle,
      @JsonKey(name: 'payment_value_set') required this.paymentValueSet,
      @JsonKey(name: 'payment_value_actual') required this.paymentValueAcutal,
      @JsonKey(name: 'payment_value_fee') required this.paymentValueFee,
      @JsonKey(name: 'payment_currency') required this.paymentCurrency,
      @JsonKey(name: 'payment_account_src_actual')
      required this.paymentAccountSrcActual,
      @JsonKey(name: 'payment_account_des_actual')
      this.paymentAccountDesActual = '',
      @JsonKey(name: 'is_needaudit') required this.isNeedAudit,
      @JsonKey(name: 'is_needapprove') required this.isNeedApprove,
      @JsonKey(name: 'refcode') required this.refcode});

  factory _$RequestTrxFiatCreateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestTrxFiatCreateModelImplFromJson(json);

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
  @JsonKey(name: 'payment_account_src_actual')
  final String paymentAccountSrcActual;
  @override
  @JsonKey(name: 'payment_account_des_actual')
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
    return 'RequestTrxFiatCreateModel(idOrder: $idOrder, paymentChannel: $paymentChannel, paymentAutoSettle: $paymentAutoSettle, paymentValueSet: $paymentValueSet, paymentValueAcutal: $paymentValueAcutal, paymentValueFee: $paymentValueFee, paymentCurrency: $paymentCurrency, paymentAccountSrcActual: $paymentAccountSrcActual, paymentAccountDesActual: $paymentAccountDesActual, isNeedAudit: $isNeedAudit, isNeedApprove: $isNeedApprove, refcode: $refcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestTrxFiatCreateModelImpl &&
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
                    other.paymentAccountSrcActual, paymentAccountSrcActual) ||
                other.paymentAccountSrcActual == paymentAccountSrcActual) &&
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
      paymentAccountSrcActual,
      paymentAccountDesActual,
      isNeedAudit,
      isNeedApprove,
      refcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestTrxFiatCreateModelImplCopyWith<_$RequestTrxFiatCreateModelImpl>
      get copyWith => __$$RequestTrxFiatCreateModelImplCopyWithImpl<
          _$RequestTrxFiatCreateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestTrxFiatCreateModelImplToJson(
      this,
    );
  }
}

abstract class _RequestTrxFiatCreateModel implements RequestTrxFiatCreateModel {
  const factory _RequestTrxFiatCreateModel(
      {@JsonKey(name: 'id_order') required final int idOrder,
      @JsonKey(name: 'payment_channel') required final String paymentChannel,
      @JsonKey(name: 'payment_autosettle')
      required final bool paymentAutoSettle,
      @JsonKey(name: 'payment_value_set') required final double paymentValueSet,
      @JsonKey(name: 'payment_value_actual')
      required final double paymentValueAcutal,
      @JsonKey(name: 'payment_value_fee') required final double paymentValueFee,
      @JsonKey(name: 'payment_currency') required final String paymentCurrency,
      @JsonKey(name: 'payment_account_src_actual')
      required final String paymentAccountSrcActual,
      @JsonKey(name: 'payment_account_des_actual')
      final String paymentAccountDesActual,
      @JsonKey(name: 'is_needaudit') required final bool isNeedAudit,
      @JsonKey(name: 'is_needapprove') required final bool isNeedApprove,
      @JsonKey(name: 'refcode')
      required final String refcode}) = _$RequestTrxFiatCreateModelImpl;

  factory _RequestTrxFiatCreateModel.fromJson(Map<String, dynamic> json) =
      _$RequestTrxFiatCreateModelImpl.fromJson;

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
  @JsonKey(name: 'payment_account_src_actual')
  String get paymentAccountSrcActual;
  @override
  @JsonKey(name: 'payment_account_des_actual')
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
  _$$RequestTrxFiatCreateModelImplCopyWith<_$RequestTrxFiatCreateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseTrxFiatCreateModel _$ResponseTrxFiatCreateModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseTrxFiatCreateModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseTrxFiatCreateModel {
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseTrxFiatCreateModelCopyWith<ResponseTrxFiatCreateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseTrxFiatCreateModelCopyWith<$Res> {
  factory $ResponseTrxFiatCreateModelCopyWith(ResponseTrxFiatCreateModel value,
          $Res Function(ResponseTrxFiatCreateModel) then) =
      _$ResponseTrxFiatCreateModelCopyWithImpl<$Res,
          ResponseTrxFiatCreateModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_trxfiat') int idTrxFiat});
}

/// @nodoc
class _$ResponseTrxFiatCreateModelCopyWithImpl<$Res,
        $Val extends ResponseTrxFiatCreateModel>
    implements $ResponseTrxFiatCreateModelCopyWith<$Res> {
  _$ResponseTrxFiatCreateModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ResponseTrxFiatCreateModelImplCopyWith<$Res>
    implements $ResponseTrxFiatCreateModelCopyWith<$Res> {
  factory _$$ResponseTrxFiatCreateModelImplCopyWith(
          _$ResponseTrxFiatCreateModelImpl value,
          $Res Function(_$ResponseTrxFiatCreateModelImpl) then) =
      __$$ResponseTrxFiatCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_trxfiat') int idTrxFiat});
}

/// @nodoc
class __$$ResponseTrxFiatCreateModelImplCopyWithImpl<$Res>
    extends _$ResponseTrxFiatCreateModelCopyWithImpl<$Res,
        _$ResponseTrxFiatCreateModelImpl>
    implements _$$ResponseTrxFiatCreateModelImplCopyWith<$Res> {
  __$$ResponseTrxFiatCreateModelImplCopyWithImpl(
      _$ResponseTrxFiatCreateModelImpl _value,
      $Res Function(_$ResponseTrxFiatCreateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = null,
  }) {
    return _then(_$ResponseTrxFiatCreateModelImpl(
      idTrxFiat: null == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseTrxFiatCreateModelImpl implements _ResponseTrxFiatCreateModel {
  const _$ResponseTrxFiatCreateModelImpl(
      {@JsonKey(name: 'id_trxfiat') required this.idTrxFiat});

  factory _$ResponseTrxFiatCreateModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseTrxFiatCreateModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_trxfiat')
  final int idTrxFiat;

  @override
  String toString() {
    return 'ResponseTrxFiatCreateModel(idTrxFiat: $idTrxFiat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseTrxFiatCreateModelImpl &&
            (identical(other.idTrxFiat, idTrxFiat) ||
                other.idTrxFiat == idTrxFiat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idTrxFiat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseTrxFiatCreateModelImplCopyWith<_$ResponseTrxFiatCreateModelImpl>
      get copyWith => __$$ResponseTrxFiatCreateModelImplCopyWithImpl<
          _$ResponseTrxFiatCreateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseTrxFiatCreateModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseTrxFiatCreateModel
    implements ResponseTrxFiatCreateModel {
  const factory _ResponseTrxFiatCreateModel(
          {@JsonKey(name: 'id_trxfiat') required final int idTrxFiat}) =
      _$ResponseTrxFiatCreateModelImpl;

  factory _ResponseTrxFiatCreateModel.fromJson(Map<String, dynamic> json) =
      _$ResponseTrxFiatCreateModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_trxfiat')
  int get idTrxFiat;
  @override
  @JsonKey(ignore: true)
  _$$ResponseTrxFiatCreateModelImplCopyWith<_$ResponseTrxFiatCreateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
