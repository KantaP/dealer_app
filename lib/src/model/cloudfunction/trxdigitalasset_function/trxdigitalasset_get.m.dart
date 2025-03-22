import 'package:freezed_annotation/freezed_annotation.dart';

part 'trxdigitalasset_get.m.freezed.dart';
part 'trxdigitalasset_get.m.g.dart';

@freezed
class ResponseTrxDigitalAssetGetModel with _$ResponseTrxDigitalAssetGetModel {
  const factory ResponseTrxDigitalAssetGetModel({
    @JsonKey(name: 'id_trxdigitalasset') @Default(0) int? idTrxDigitalAsset,
    @JsonKey(name: 'id_order') @Default(0) int? idOrder,
    @JsonKey(name: 'digitalasset_price_set')
    @Default(0)
    double? digitalAssetPriceSet,
    @JsonKey(name: 'digitalasset_price_actual')
    @Default(0)
    double? digitalAssetPriceAcutal,
    @JsonKey(name: 'datetime_create') @Default('') String? datetimeCreate,
    @JsonKey(name: 'datetime_payment') @Default('') String? datetimePayment,
    @JsonKey(name: 'datetime_complete') @Default('') String? datetimeComplete,
    @JsonKey(name: 'order_side') @Default('') String? orderSide,
    @JsonKey(name: 'payment_channel') @Default('') String? paymentChannel,
    @JsonKey(name: 'payment_autosettle') @Default(true) bool? paymentAutoSettle,
    @JsonKey(name: 'payment_callbacklog')
    @Default('')
    String? paymentCallbackLog,
    @JsonKey(name: 'payment_value_set') @Default(0) double paymentValueSet,
    @JsonKey(name: 'payment_value_actual')
    @Default(0)
    double paymentValueActual,
    @JsonKey(name: 'payment_value_fee') @Default(0) double paymentValueFee,
    @JsonKey(name: 'payment_wallet_scr_actual')
    @Default('')
    String? paymentWalletScrActual,
    @JsonKey(name: 'payment_wallet_des_actual')
    @Default('')
    String? paymentWalletDesActual,
    @JsonKey(name: 'payment_currency') @Default('') String? paymentCurrency,
    @JsonKey(name: 'payment_proof') @Default('') String? paymentProof,
    @JsonKey(name: 'status') @Default('') String? status,
    @JsonKey(name: 'flag_message') @Default('') String? flagMessage,
    @JsonKey(name: 'is_needaudit') @Default(true) bool? isNeedAudit,
    @JsonKey(name: 'is_needapprove') @Default(true) bool? isNeedApprove,
    @JsonKey(name: 'is_audited') @Default(true) bool? isAudited,
    @JsonKey(name: 'auditor') @Default('') String? auditor,
    @JsonKey(name: 'audit_datetime') @Default('') String? auditDatetime,
    @JsonKey(name: 'is_approved') @Default(false) bool? isApprove,
    @JsonKey(name: 'approver') @Default('') String? approver,
    @JsonKey(name: 'approve_datetime') @Default('') String? approveDatetime,
    @JsonKey(name: 'payer') @Default('') String? payer,
    @JsonKey(name: 'cancel_reason') @Default('') String? cancelReason,
  }) = _ResponseTrxDigitalAssetGetModel;

  factory ResponseTrxDigitalAssetGetModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseTrxDigitalAssetGetModelFromJson(json);
}
