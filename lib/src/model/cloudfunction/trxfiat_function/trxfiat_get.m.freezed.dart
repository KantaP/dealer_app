// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trxfiat_get.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseTrxFiatGetModel _$ResponseTrxFiatGetModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseTrxFiatGetModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseTrxFiatGetModel {
  @JsonKey(name: 'id_trxfiat')
  int? get idTrxFiat => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_order')
  int? get idOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_price_set')
  double? get digitalAssetPriceSet => throw _privateConstructorUsedError;
  @JsonKey(name: 'digitalasset_price_actual')
  double? get digitalAssetPriceActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime_create')
  String? get datetimeCreate => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime_payment')
  String? get datetimePayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime_complete')
  String? get datetimeComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_side')
  String? get orderSide => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_channel')
  String? get paymentChannel => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_autosettle')
  bool? get paymentAutoSettle => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_callbacklog')
  String? get paymentCallbackLog => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_set')
  double? get paymentValueSet => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_actual')
  double? get paymentValueActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_fee')
  double? get paymentValueFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_account_src_actual')
  String? get paymentAccountSrcActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_account_des_actual')
  String? get paymentAccountDesActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_currency')
  String? get paymentCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_proof')
  String? get paymentProof => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag_message')
  String? get flagMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_needaudit')
  bool? get isNeedAudit => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_needapprove')
  bool? get isNeedApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_audited')
  bool? get isAudited => throw _privateConstructorUsedError;
  @JsonKey(name: 'auditor')
  String? get auditor => throw _privateConstructorUsedError;
  @JsonKey(name: 'audit_datetime')
  String? get auditDatetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_approved')
  bool? get isApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'approver')
  String? get approver => throw _privateConstructorUsedError;
  @JsonKey(name: 'approve_datetime')
  String? get approveDatetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'payer')
  String? get payer => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_reason')
  String get cancelReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseTrxFiatGetModelCopyWith<ResponseTrxFiatGetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseTrxFiatGetModelCopyWith<$Res> {
  factory $ResponseTrxFiatGetModelCopyWith(ResponseTrxFiatGetModel value,
          $Res Function(ResponseTrxFiatGetModel) then) =
      _$ResponseTrxFiatGetModelCopyWithImpl<$Res, ResponseTrxFiatGetModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_trxfiat') int? idTrxFiat,
      @JsonKey(name: 'id_order') int? idOrder,
      @JsonKey(name: 'digitalasset_price_set') double? digitalAssetPriceSet,
      @JsonKey(name: 'digitalasset_price_actual')
      double? digitalAssetPriceActual,
      @JsonKey(name: 'datetime_create') String? datetimeCreate,
      @JsonKey(name: 'datetime_payment') String? datetimePayment,
      @JsonKey(name: 'datetime_complete') String? datetimeComplete,
      @JsonKey(name: 'order_side') String? orderSide,
      @JsonKey(name: 'payment_channel') String? paymentChannel,
      @JsonKey(name: 'payment_autosettle') bool? paymentAutoSettle,
      @JsonKey(name: 'payment_callbacklog') String? paymentCallbackLog,
      @JsonKey(name: 'payment_value_set') double? paymentValueSet,
      @JsonKey(name: 'payment_value_actual') double? paymentValueActual,
      @JsonKey(name: 'payment_value_fee') double? paymentValueFee,
      @JsonKey(name: 'payment_account_src_actual')
      String? paymentAccountSrcActual,
      @JsonKey(name: 'payment_account_des_actual')
      String? paymentAccountDesActual,
      @JsonKey(name: 'payment_currency') String? paymentCurrency,
      @JsonKey(name: 'payment_proof') String? paymentProof,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'flag_message') String? flagMessage,
      @JsonKey(name: 'is_needaudit') bool? isNeedAudit,
      @JsonKey(name: 'is_needapprove') bool? isNeedApprove,
      @JsonKey(name: 'is_audited') bool? isAudited,
      @JsonKey(name: 'auditor') String? auditor,
      @JsonKey(name: 'audit_datetime') String? auditDatetime,
      @JsonKey(name: 'is_approved') bool? isApprove,
      @JsonKey(name: 'approver') String? approver,
      @JsonKey(name: 'approve_datetime') String? approveDatetime,
      @JsonKey(name: 'payer') String? payer,
      @JsonKey(name: 'cancel_reason') String cancelReason});
}

/// @nodoc
class _$ResponseTrxFiatGetModelCopyWithImpl<$Res,
        $Val extends ResponseTrxFiatGetModel>
    implements $ResponseTrxFiatGetModelCopyWith<$Res> {
  _$ResponseTrxFiatGetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = freezed,
    Object? idOrder = freezed,
    Object? digitalAssetPriceSet = freezed,
    Object? digitalAssetPriceActual = freezed,
    Object? datetimeCreate = freezed,
    Object? datetimePayment = freezed,
    Object? datetimeComplete = freezed,
    Object? orderSide = freezed,
    Object? paymentChannel = freezed,
    Object? paymentAutoSettle = freezed,
    Object? paymentCallbackLog = freezed,
    Object? paymentValueSet = freezed,
    Object? paymentValueActual = freezed,
    Object? paymentValueFee = freezed,
    Object? paymentAccountSrcActual = freezed,
    Object? paymentAccountDesActual = freezed,
    Object? paymentCurrency = freezed,
    Object? paymentProof = freezed,
    Object? status = freezed,
    Object? flagMessage = freezed,
    Object? isNeedAudit = freezed,
    Object? isNeedApprove = freezed,
    Object? isAudited = freezed,
    Object? auditor = freezed,
    Object? auditDatetime = freezed,
    Object? isApprove = freezed,
    Object? approver = freezed,
    Object? approveDatetime = freezed,
    Object? payer = freezed,
    Object? cancelReason = null,
  }) {
    return _then(_value.copyWith(
      idTrxFiat: freezed == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int?,
      idOrder: freezed == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      digitalAssetPriceSet: freezed == digitalAssetPriceSet
          ? _value.digitalAssetPriceSet
          : digitalAssetPriceSet // ignore: cast_nullable_to_non_nullable
              as double?,
      digitalAssetPriceActual: freezed == digitalAssetPriceActual
          ? _value.digitalAssetPriceActual
          : digitalAssetPriceActual // ignore: cast_nullable_to_non_nullable
              as double?,
      datetimeCreate: freezed == datetimeCreate
          ? _value.datetimeCreate
          : datetimeCreate // ignore: cast_nullable_to_non_nullable
              as String?,
      datetimePayment: freezed == datetimePayment
          ? _value.datetimePayment
          : datetimePayment // ignore: cast_nullable_to_non_nullable
              as String?,
      datetimeComplete: freezed == datetimeComplete
          ? _value.datetimeComplete
          : datetimeComplete // ignore: cast_nullable_to_non_nullable
              as String?,
      orderSide: freezed == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentChannel: freezed == paymentChannel
          ? _value.paymentChannel
          : paymentChannel // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAutoSettle: freezed == paymentAutoSettle
          ? _value.paymentAutoSettle
          : paymentAutoSettle // ignore: cast_nullable_to_non_nullable
              as bool?,
      paymentCallbackLog: freezed == paymentCallbackLog
          ? _value.paymentCallbackLog
          : paymentCallbackLog // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentValueSet: freezed == paymentValueSet
          ? _value.paymentValueSet
          : paymentValueSet // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentValueActual: freezed == paymentValueActual
          ? _value.paymentValueActual
          : paymentValueActual // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentValueFee: freezed == paymentValueFee
          ? _value.paymentValueFee
          : paymentValueFee // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentAccountSrcActual: freezed == paymentAccountSrcActual
          ? _value.paymentAccountSrcActual
          : paymentAccountSrcActual // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAccountDesActual: freezed == paymentAccountDesActual
          ? _value.paymentAccountDesActual
          : paymentAccountDesActual // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentCurrency: freezed == paymentCurrency
          ? _value.paymentCurrency
          : paymentCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentProof: freezed == paymentProof
          ? _value.paymentProof
          : paymentProof // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      flagMessage: freezed == flagMessage
          ? _value.flagMessage
          : flagMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isNeedAudit: freezed == isNeedAudit
          ? _value.isNeedAudit
          : isNeedAudit // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNeedApprove: freezed == isNeedApprove
          ? _value.isNeedApprove
          : isNeedApprove // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAudited: freezed == isAudited
          ? _value.isAudited
          : isAudited // ignore: cast_nullable_to_non_nullable
              as bool?,
      auditor: freezed == auditor
          ? _value.auditor
          : auditor // ignore: cast_nullable_to_non_nullable
              as String?,
      auditDatetime: freezed == auditDatetime
          ? _value.auditDatetime
          : auditDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprove: freezed == isApprove
          ? _value.isApprove
          : isApprove // ignore: cast_nullable_to_non_nullable
              as bool?,
      approver: freezed == approver
          ? _value.approver
          : approver // ignore: cast_nullable_to_non_nullable
              as String?,
      approveDatetime: freezed == approveDatetime
          ? _value.approveDatetime
          : approveDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      payer: freezed == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelReason: null == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseTrxFiatGetModelImplCopyWith<$Res>
    implements $ResponseTrxFiatGetModelCopyWith<$Res> {
  factory _$$ResponseTrxFiatGetModelImplCopyWith(
          _$ResponseTrxFiatGetModelImpl value,
          $Res Function(_$ResponseTrxFiatGetModelImpl) then) =
      __$$ResponseTrxFiatGetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_trxfiat') int? idTrxFiat,
      @JsonKey(name: 'id_order') int? idOrder,
      @JsonKey(name: 'digitalasset_price_set') double? digitalAssetPriceSet,
      @JsonKey(name: 'digitalasset_price_actual')
      double? digitalAssetPriceActual,
      @JsonKey(name: 'datetime_create') String? datetimeCreate,
      @JsonKey(name: 'datetime_payment') String? datetimePayment,
      @JsonKey(name: 'datetime_complete') String? datetimeComplete,
      @JsonKey(name: 'order_side') String? orderSide,
      @JsonKey(name: 'payment_channel') String? paymentChannel,
      @JsonKey(name: 'payment_autosettle') bool? paymentAutoSettle,
      @JsonKey(name: 'payment_callbacklog') String? paymentCallbackLog,
      @JsonKey(name: 'payment_value_set') double? paymentValueSet,
      @JsonKey(name: 'payment_value_actual') double? paymentValueActual,
      @JsonKey(name: 'payment_value_fee') double? paymentValueFee,
      @JsonKey(name: 'payment_account_src_actual')
      String? paymentAccountSrcActual,
      @JsonKey(name: 'payment_account_des_actual')
      String? paymentAccountDesActual,
      @JsonKey(name: 'payment_currency') String? paymentCurrency,
      @JsonKey(name: 'payment_proof') String? paymentProof,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'flag_message') String? flagMessage,
      @JsonKey(name: 'is_needaudit') bool? isNeedAudit,
      @JsonKey(name: 'is_needapprove') bool? isNeedApprove,
      @JsonKey(name: 'is_audited') bool? isAudited,
      @JsonKey(name: 'auditor') String? auditor,
      @JsonKey(name: 'audit_datetime') String? auditDatetime,
      @JsonKey(name: 'is_approved') bool? isApprove,
      @JsonKey(name: 'approver') String? approver,
      @JsonKey(name: 'approve_datetime') String? approveDatetime,
      @JsonKey(name: 'payer') String? payer,
      @JsonKey(name: 'cancel_reason') String cancelReason});
}

/// @nodoc
class __$$ResponseTrxFiatGetModelImplCopyWithImpl<$Res>
    extends _$ResponseTrxFiatGetModelCopyWithImpl<$Res,
        _$ResponseTrxFiatGetModelImpl>
    implements _$$ResponseTrxFiatGetModelImplCopyWith<$Res> {
  __$$ResponseTrxFiatGetModelImplCopyWithImpl(
      _$ResponseTrxFiatGetModelImpl _value,
      $Res Function(_$ResponseTrxFiatGetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTrxFiat = freezed,
    Object? idOrder = freezed,
    Object? digitalAssetPriceSet = freezed,
    Object? digitalAssetPriceActual = freezed,
    Object? datetimeCreate = freezed,
    Object? datetimePayment = freezed,
    Object? datetimeComplete = freezed,
    Object? orderSide = freezed,
    Object? paymentChannel = freezed,
    Object? paymentAutoSettle = freezed,
    Object? paymentCallbackLog = freezed,
    Object? paymentValueSet = freezed,
    Object? paymentValueActual = freezed,
    Object? paymentValueFee = freezed,
    Object? paymentAccountSrcActual = freezed,
    Object? paymentAccountDesActual = freezed,
    Object? paymentCurrency = freezed,
    Object? paymentProof = freezed,
    Object? status = freezed,
    Object? flagMessage = freezed,
    Object? isNeedAudit = freezed,
    Object? isNeedApprove = freezed,
    Object? isAudited = freezed,
    Object? auditor = freezed,
    Object? auditDatetime = freezed,
    Object? isApprove = freezed,
    Object? approver = freezed,
    Object? approveDatetime = freezed,
    Object? payer = freezed,
    Object? cancelReason = null,
  }) {
    return _then(_$ResponseTrxFiatGetModelImpl(
      idTrxFiat: freezed == idTrxFiat
          ? _value.idTrxFiat
          : idTrxFiat // ignore: cast_nullable_to_non_nullable
              as int?,
      idOrder: freezed == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      digitalAssetPriceSet: freezed == digitalAssetPriceSet
          ? _value.digitalAssetPriceSet
          : digitalAssetPriceSet // ignore: cast_nullable_to_non_nullable
              as double?,
      digitalAssetPriceActual: freezed == digitalAssetPriceActual
          ? _value.digitalAssetPriceActual
          : digitalAssetPriceActual // ignore: cast_nullable_to_non_nullable
              as double?,
      datetimeCreate: freezed == datetimeCreate
          ? _value.datetimeCreate
          : datetimeCreate // ignore: cast_nullable_to_non_nullable
              as String?,
      datetimePayment: freezed == datetimePayment
          ? _value.datetimePayment
          : datetimePayment // ignore: cast_nullable_to_non_nullable
              as String?,
      datetimeComplete: freezed == datetimeComplete
          ? _value.datetimeComplete
          : datetimeComplete // ignore: cast_nullable_to_non_nullable
              as String?,
      orderSide: freezed == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentChannel: freezed == paymentChannel
          ? _value.paymentChannel
          : paymentChannel // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAutoSettle: freezed == paymentAutoSettle
          ? _value.paymentAutoSettle
          : paymentAutoSettle // ignore: cast_nullable_to_non_nullable
              as bool?,
      paymentCallbackLog: freezed == paymentCallbackLog
          ? _value.paymentCallbackLog
          : paymentCallbackLog // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentValueSet: freezed == paymentValueSet
          ? _value.paymentValueSet
          : paymentValueSet // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentValueActual: freezed == paymentValueActual
          ? _value.paymentValueActual
          : paymentValueActual // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentValueFee: freezed == paymentValueFee
          ? _value.paymentValueFee
          : paymentValueFee // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentAccountSrcActual: freezed == paymentAccountSrcActual
          ? _value.paymentAccountSrcActual
          : paymentAccountSrcActual // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAccountDesActual: freezed == paymentAccountDesActual
          ? _value.paymentAccountDesActual
          : paymentAccountDesActual // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentCurrency: freezed == paymentCurrency
          ? _value.paymentCurrency
          : paymentCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentProof: freezed == paymentProof
          ? _value.paymentProof
          : paymentProof // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      flagMessage: freezed == flagMessage
          ? _value.flagMessage
          : flagMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isNeedAudit: freezed == isNeedAudit
          ? _value.isNeedAudit
          : isNeedAudit // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNeedApprove: freezed == isNeedApprove
          ? _value.isNeedApprove
          : isNeedApprove // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAudited: freezed == isAudited
          ? _value.isAudited
          : isAudited // ignore: cast_nullable_to_non_nullable
              as bool?,
      auditor: freezed == auditor
          ? _value.auditor
          : auditor // ignore: cast_nullable_to_non_nullable
              as String?,
      auditDatetime: freezed == auditDatetime
          ? _value.auditDatetime
          : auditDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprove: freezed == isApprove
          ? _value.isApprove
          : isApprove // ignore: cast_nullable_to_non_nullable
              as bool?,
      approver: freezed == approver
          ? _value.approver
          : approver // ignore: cast_nullable_to_non_nullable
              as String?,
      approveDatetime: freezed == approveDatetime
          ? _value.approveDatetime
          : approveDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      payer: freezed == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelReason: null == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseTrxFiatGetModelImpl implements _ResponseTrxFiatGetModel {
  const _$ResponseTrxFiatGetModelImpl(
      {@JsonKey(name: 'id_trxfiat') this.idTrxFiat = 0,
      @JsonKey(name: 'id_order') this.idOrder = 0,
      @JsonKey(name: 'digitalasset_price_set') this.digitalAssetPriceSet = 0,
      @JsonKey(name: 'digitalasset_price_actual')
      this.digitalAssetPriceActual = 0,
      @JsonKey(name: 'datetime_create') this.datetimeCreate = '',
      @JsonKey(name: 'datetime_payment') this.datetimePayment = '',
      @JsonKey(name: 'datetime_complete') this.datetimeComplete = '',
      @JsonKey(name: 'order_side') this.orderSide = '',
      @JsonKey(name: 'payment_channel') this.paymentChannel = '',
      @JsonKey(name: 'payment_autosettle') this.paymentAutoSettle = true,
      @JsonKey(name: 'payment_callbacklog') this.paymentCallbackLog = '',
      @JsonKey(name: 'payment_value_set') this.paymentValueSet = 0,
      @JsonKey(name: 'payment_value_actual') this.paymentValueActual = 0,
      @JsonKey(name: 'payment_value_fee') this.paymentValueFee = 0,
      @JsonKey(name: 'payment_account_src_actual')
      this.paymentAccountSrcActual = '',
      @JsonKey(name: 'payment_account_des_actual')
      this.paymentAccountDesActual = '',
      @JsonKey(name: 'payment_currency') this.paymentCurrency = '',
      @JsonKey(name: 'payment_proof') this.paymentProof = '',
      @JsonKey(name: 'status') this.status = '',
      @JsonKey(name: 'flag_message') this.flagMessage = '',
      @JsonKey(name: 'is_needaudit') this.isNeedAudit = true,
      @JsonKey(name: 'is_needapprove') this.isNeedApprove = true,
      @JsonKey(name: 'is_audited') this.isAudited = true,
      @JsonKey(name: 'auditor') this.auditor = '',
      @JsonKey(name: 'audit_datetime') this.auditDatetime = '',
      @JsonKey(name: 'is_approved') this.isApprove = false,
      @JsonKey(name: 'approver') this.approver = '',
      @JsonKey(name: 'approve_datetime') this.approveDatetime = '',
      @JsonKey(name: 'payer') this.payer = '',
      @JsonKey(name: 'cancel_reason') this.cancelReason = ''});

  factory _$ResponseTrxFiatGetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseTrxFiatGetModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_trxfiat')
  final int? idTrxFiat;
  @override
  @JsonKey(name: 'id_order')
  final int? idOrder;
  @override
  @JsonKey(name: 'digitalasset_price_set')
  final double? digitalAssetPriceSet;
  @override
  @JsonKey(name: 'digitalasset_price_actual')
  final double? digitalAssetPriceActual;
  @override
  @JsonKey(name: 'datetime_create')
  final String? datetimeCreate;
  @override
  @JsonKey(name: 'datetime_payment')
  final String? datetimePayment;
  @override
  @JsonKey(name: 'datetime_complete')
  final String? datetimeComplete;
  @override
  @JsonKey(name: 'order_side')
  final String? orderSide;
  @override
  @JsonKey(name: 'payment_channel')
  final String? paymentChannel;
  @override
  @JsonKey(name: 'payment_autosettle')
  final bool? paymentAutoSettle;
  @override
  @JsonKey(name: 'payment_callbacklog')
  final String? paymentCallbackLog;
  @override
  @JsonKey(name: 'payment_value_set')
  final double? paymentValueSet;
  @override
  @JsonKey(name: 'payment_value_actual')
  final double? paymentValueActual;
  @override
  @JsonKey(name: 'payment_value_fee')
  final double? paymentValueFee;
  @override
  @JsonKey(name: 'payment_account_src_actual')
  final String? paymentAccountSrcActual;
  @override
  @JsonKey(name: 'payment_account_des_actual')
  final String? paymentAccountDesActual;
  @override
  @JsonKey(name: 'payment_currency')
  final String? paymentCurrency;
  @override
  @JsonKey(name: 'payment_proof')
  final String? paymentProof;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'flag_message')
  final String? flagMessage;
  @override
  @JsonKey(name: 'is_needaudit')
  final bool? isNeedAudit;
  @override
  @JsonKey(name: 'is_needapprove')
  final bool? isNeedApprove;
  @override
  @JsonKey(name: 'is_audited')
  final bool? isAudited;
  @override
  @JsonKey(name: 'auditor')
  final String? auditor;
  @override
  @JsonKey(name: 'audit_datetime')
  final String? auditDatetime;
  @override
  @JsonKey(name: 'is_approved')
  final bool? isApprove;
  @override
  @JsonKey(name: 'approver')
  final String? approver;
  @override
  @JsonKey(name: 'approve_datetime')
  final String? approveDatetime;
  @override
  @JsonKey(name: 'payer')
  final String? payer;
  @override
  @JsonKey(name: 'cancel_reason')
  final String cancelReason;

  @override
  String toString() {
    return 'ResponseTrxFiatGetModel(idTrxFiat: $idTrxFiat, idOrder: $idOrder, digitalAssetPriceSet: $digitalAssetPriceSet, digitalAssetPriceActual: $digitalAssetPriceActual, datetimeCreate: $datetimeCreate, datetimePayment: $datetimePayment, datetimeComplete: $datetimeComplete, orderSide: $orderSide, paymentChannel: $paymentChannel, paymentAutoSettle: $paymentAutoSettle, paymentCallbackLog: $paymentCallbackLog, paymentValueSet: $paymentValueSet, paymentValueActual: $paymentValueActual, paymentValueFee: $paymentValueFee, paymentAccountSrcActual: $paymentAccountSrcActual, paymentAccountDesActual: $paymentAccountDesActual, paymentCurrency: $paymentCurrency, paymentProof: $paymentProof, status: $status, flagMessage: $flagMessage, isNeedAudit: $isNeedAudit, isNeedApprove: $isNeedApprove, isAudited: $isAudited, auditor: $auditor, auditDatetime: $auditDatetime, isApprove: $isApprove, approver: $approver, approveDatetime: $approveDatetime, payer: $payer, cancelReason: $cancelReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseTrxFiatGetModelImpl &&
            (identical(other.idTrxFiat, idTrxFiat) ||
                other.idTrxFiat == idTrxFiat) &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder) &&
            (identical(other.digitalAssetPriceSet, digitalAssetPriceSet) ||
                other.digitalAssetPriceSet == digitalAssetPriceSet) &&
            (identical(
                    other.digitalAssetPriceActual, digitalAssetPriceActual) ||
                other.digitalAssetPriceActual == digitalAssetPriceActual) &&
            (identical(other.datetimeCreate, datetimeCreate) ||
                other.datetimeCreate == datetimeCreate) &&
            (identical(other.datetimePayment, datetimePayment) ||
                other.datetimePayment == datetimePayment) &&
            (identical(other.datetimeComplete, datetimeComplete) ||
                other.datetimeComplete == datetimeComplete) &&
            (identical(other.orderSide, orderSide) ||
                other.orderSide == orderSide) &&
            (identical(other.paymentChannel, paymentChannel) ||
                other.paymentChannel == paymentChannel) &&
            (identical(other.paymentAutoSettle, paymentAutoSettle) ||
                other.paymentAutoSettle == paymentAutoSettle) &&
            (identical(other.paymentCallbackLog, paymentCallbackLog) ||
                other.paymentCallbackLog == paymentCallbackLog) &&
            (identical(other.paymentValueSet, paymentValueSet) ||
                other.paymentValueSet == paymentValueSet) &&
            (identical(other.paymentValueActual, paymentValueActual) ||
                other.paymentValueActual == paymentValueActual) &&
            (identical(other.paymentValueFee, paymentValueFee) ||
                other.paymentValueFee == paymentValueFee) &&
            (identical(
                    other.paymentAccountSrcActual, paymentAccountSrcActual) ||
                other.paymentAccountSrcActual == paymentAccountSrcActual) &&
            (identical(
                    other.paymentAccountDesActual, paymentAccountDesActual) ||
                other.paymentAccountDesActual == paymentAccountDesActual) &&
            (identical(other.paymentCurrency, paymentCurrency) ||
                other.paymentCurrency == paymentCurrency) &&
            (identical(other.paymentProof, paymentProof) ||
                other.paymentProof == paymentProof) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.flagMessage, flagMessage) ||
                other.flagMessage == flagMessage) &&
            (identical(other.isNeedAudit, isNeedAudit) ||
                other.isNeedAudit == isNeedAudit) &&
            (identical(other.isNeedApprove, isNeedApprove) ||
                other.isNeedApprove == isNeedApprove) &&
            (identical(other.isAudited, isAudited) ||
                other.isAudited == isAudited) &&
            (identical(other.auditor, auditor) || other.auditor == auditor) &&
            (identical(other.auditDatetime, auditDatetime) ||
                other.auditDatetime == auditDatetime) &&
            (identical(other.isApprove, isApprove) ||
                other.isApprove == isApprove) &&
            (identical(other.approver, approver) ||
                other.approver == approver) &&
            (identical(other.approveDatetime, approveDatetime) ||
                other.approveDatetime == approveDatetime) &&
            (identical(other.payer, payer) || other.payer == payer) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idTrxFiat,
        idOrder,
        digitalAssetPriceSet,
        digitalAssetPriceActual,
        datetimeCreate,
        datetimePayment,
        datetimeComplete,
        orderSide,
        paymentChannel,
        paymentAutoSettle,
        paymentCallbackLog,
        paymentValueSet,
        paymentValueActual,
        paymentValueFee,
        paymentAccountSrcActual,
        paymentAccountDesActual,
        paymentCurrency,
        paymentProof,
        status,
        flagMessage,
        isNeedAudit,
        isNeedApprove,
        isAudited,
        auditor,
        auditDatetime,
        isApprove,
        approver,
        approveDatetime,
        payer,
        cancelReason
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseTrxFiatGetModelImplCopyWith<_$ResponseTrxFiatGetModelImpl>
      get copyWith => __$$ResponseTrxFiatGetModelImplCopyWithImpl<
          _$ResponseTrxFiatGetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseTrxFiatGetModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseTrxFiatGetModel implements ResponseTrxFiatGetModel {
  const factory _ResponseTrxFiatGetModel(
      {@JsonKey(name: 'id_trxfiat') final int? idTrxFiat,
      @JsonKey(name: 'id_order') final int? idOrder,
      @JsonKey(name: 'digitalasset_price_set')
      final double? digitalAssetPriceSet,
      @JsonKey(name: 'digitalasset_price_actual')
      final double? digitalAssetPriceActual,
      @JsonKey(name: 'datetime_create') final String? datetimeCreate,
      @JsonKey(name: 'datetime_payment') final String? datetimePayment,
      @JsonKey(name: 'datetime_complete') final String? datetimeComplete,
      @JsonKey(name: 'order_side') final String? orderSide,
      @JsonKey(name: 'payment_channel') final String? paymentChannel,
      @JsonKey(name: 'payment_autosettle') final bool? paymentAutoSettle,
      @JsonKey(name: 'payment_callbacklog') final String? paymentCallbackLog,
      @JsonKey(name: 'payment_value_set') final double? paymentValueSet,
      @JsonKey(name: 'payment_value_actual') final double? paymentValueActual,
      @JsonKey(name: 'payment_value_fee') final double? paymentValueFee,
      @JsonKey(name: 'payment_account_src_actual')
      final String? paymentAccountSrcActual,
      @JsonKey(name: 'payment_account_des_actual')
      final String? paymentAccountDesActual,
      @JsonKey(name: 'payment_currency') final String? paymentCurrency,
      @JsonKey(name: 'payment_proof') final String? paymentProof,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'flag_message') final String? flagMessage,
      @JsonKey(name: 'is_needaudit') final bool? isNeedAudit,
      @JsonKey(name: 'is_needapprove') final bool? isNeedApprove,
      @JsonKey(name: 'is_audited') final bool? isAudited,
      @JsonKey(name: 'auditor') final String? auditor,
      @JsonKey(name: 'audit_datetime') final String? auditDatetime,
      @JsonKey(name: 'is_approved') final bool? isApprove,
      @JsonKey(name: 'approver') final String? approver,
      @JsonKey(name: 'approve_datetime') final String? approveDatetime,
      @JsonKey(name: 'payer') final String? payer,
      @JsonKey(name: 'cancel_reason')
      final String cancelReason}) = _$ResponseTrxFiatGetModelImpl;

  factory _ResponseTrxFiatGetModel.fromJson(Map<String, dynamic> json) =
      _$ResponseTrxFiatGetModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_trxfiat')
  int? get idTrxFiat;
  @override
  @JsonKey(name: 'id_order')
  int? get idOrder;
  @override
  @JsonKey(name: 'digitalasset_price_set')
  double? get digitalAssetPriceSet;
  @override
  @JsonKey(name: 'digitalasset_price_actual')
  double? get digitalAssetPriceActual;
  @override
  @JsonKey(name: 'datetime_create')
  String? get datetimeCreate;
  @override
  @JsonKey(name: 'datetime_payment')
  String? get datetimePayment;
  @override
  @JsonKey(name: 'datetime_complete')
  String? get datetimeComplete;
  @override
  @JsonKey(name: 'order_side')
  String? get orderSide;
  @override
  @JsonKey(name: 'payment_channel')
  String? get paymentChannel;
  @override
  @JsonKey(name: 'payment_autosettle')
  bool? get paymentAutoSettle;
  @override
  @JsonKey(name: 'payment_callbacklog')
  String? get paymentCallbackLog;
  @override
  @JsonKey(name: 'payment_value_set')
  double? get paymentValueSet;
  @override
  @JsonKey(name: 'payment_value_actual')
  double? get paymentValueActual;
  @override
  @JsonKey(name: 'payment_value_fee')
  double? get paymentValueFee;
  @override
  @JsonKey(name: 'payment_account_src_actual')
  String? get paymentAccountSrcActual;
  @override
  @JsonKey(name: 'payment_account_des_actual')
  String? get paymentAccountDesActual;
  @override
  @JsonKey(name: 'payment_currency')
  String? get paymentCurrency;
  @override
  @JsonKey(name: 'payment_proof')
  String? get paymentProof;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'flag_message')
  String? get flagMessage;
  @override
  @JsonKey(name: 'is_needaudit')
  bool? get isNeedAudit;
  @override
  @JsonKey(name: 'is_needapprove')
  bool? get isNeedApprove;
  @override
  @JsonKey(name: 'is_audited')
  bool? get isAudited;
  @override
  @JsonKey(name: 'auditor')
  String? get auditor;
  @override
  @JsonKey(name: 'audit_datetime')
  String? get auditDatetime;
  @override
  @JsonKey(name: 'is_approved')
  bool? get isApprove;
  @override
  @JsonKey(name: 'approver')
  String? get approver;
  @override
  @JsonKey(name: 'approve_datetime')
  String? get approveDatetime;
  @override
  @JsonKey(name: 'payer')
  String? get payer;
  @override
  @JsonKey(name: 'cancel_reason')
  String get cancelReason;
  @override
  @JsonKey(ignore: true)
  _$$ResponseTrxFiatGetModelImplCopyWith<_$ResponseTrxFiatGetModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
