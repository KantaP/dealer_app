import 'package:freezed_annotation/freezed_annotation.dart';

part 'pure_fiat_create.m.freezed.dart';
part 'pure_fiat_create.m.g.dart';

@freezed
class PureFiatCreateRequestModel with _$PureFiatCreateRequestModel {
  const factory PureFiatCreateRequestModel({
    @Default('') @JsonKey(name: 'id_user') String idUser,
    @Default('QR') @JsonKey(name: 'payment_channel') String paymentChannel,
    @Default(true) @JsonKey(name: 'payment_autosettle') bool autoSettle,
    @Default('THB') @JsonKey(name: 'payment_currency') String currency,
    @Default('ndid') @JsonKey(name: 'payment_type') String paymentType,
    @Default(0) @JsonKey(name: 'payment_value_actual') double paymentValue,
    @Default('')
    @JsonKey(name: 'payment_account_des_actual')
    String accountDestination,
    @Default(0) @JsonKey(name: 'payment_value_fee') double valueFee,
    @Default('')
    @JsonKey(name: 'payment_account_src_actual')
    String accountSource,
    @Default(true) @JsonKey(name: 'is_needapprove') bool needApprove,
    @Default(true) @JsonKey(name: 'is_needaudit') bool needAudit,
    @Default('') @JsonKey(name: 'refcode') String refCode,
    @Default('') @JsonKey(name: 'payment_qrdata') String qrData,
  }) = _PureFiatCreateRequestModel;

  factory PureFiatCreateRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PureFiatCreateRequestModelFromJson(json);
}

@freezed
class PureFiatCreateResponseModel with _$PureFiatCreateResponseModel {
  const factory PureFiatCreateResponseModel({
    @Default(0) @JsonKey(name: 'id_purefiat') int idPurefiat,
    @Default('') @JsonKey(name: 'refcode') String refcode,
  }) = _PureFiatCreateResponseModel;

  factory PureFiatCreateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PureFiatCreateResponseModelFromJson(json);
}
