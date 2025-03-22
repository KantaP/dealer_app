// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pure_fiat_create.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PureFiatCreateRequestModelImpl _$$PureFiatCreateRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PureFiatCreateRequestModelImpl(
      idUser: json['id_user'] as String? ?? '',
      paymentChannel: json['payment_channel'] as String? ?? 'QR',
      autoSettle: json['payment_autosettle'] as bool? ?? true,
      currency: json['payment_currency'] as String? ?? 'THB',
      paymentType: json['payment_type'] as String? ?? 'ndid',
      paymentValue: (json['payment_value_actual'] as num?)?.toDouble() ?? 0,
      accountDestination: json['payment_account_des_actual'] as String? ?? '',
      valueFee: (json['payment_value_fee'] as num?)?.toDouble() ?? 0,
      accountSource: json['payment_account_src_actual'] as String? ?? '',
      needApprove: json['is_needapprove'] as bool? ?? true,
      needAudit: json['is_needaudit'] as bool? ?? true,
      refCode: json['refcode'] as String? ?? '',
      qrData: json['payment_qrdata'] as String? ?? '',
    );

Map<String, dynamic> _$$PureFiatCreateRequestModelImplToJson(
        _$PureFiatCreateRequestModelImpl instance) =>
    <String, dynamic>{
      'id_user': instance.idUser,
      'payment_channel': instance.paymentChannel,
      'payment_autosettle': instance.autoSettle,
      'payment_currency': instance.currency,
      'payment_type': instance.paymentType,
      'payment_value_actual': instance.paymentValue,
      'payment_account_des_actual': instance.accountDestination,
      'payment_value_fee': instance.valueFee,
      'payment_account_src_actual': instance.accountSource,
      'is_needapprove': instance.needApprove,
      'is_needaudit': instance.needAudit,
      'refcode': instance.refCode,
      'payment_qrdata': instance.qrData,
    };

_$PureFiatCreateResponseModelImpl _$$PureFiatCreateResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PureFiatCreateResponseModelImpl(
      idPurefiat: json['id_purefiat'] as int? ?? 0,
      refcode: json['refcode'] as String? ?? '',
    );

Map<String, dynamic> _$$PureFiatCreateResponseModelImplToJson(
        _$PureFiatCreateResponseModelImpl instance) =>
    <String, dynamic>{
      'id_purefiat': instance.idPurefiat,
      'refcode': instance.refcode,
    };
