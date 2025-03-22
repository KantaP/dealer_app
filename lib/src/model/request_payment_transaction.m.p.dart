import 'package:aconnec_1109_x/src/model/request_payment_transaction.m.dart';
import 'package:aconnec_1109_x/src/model/coin_detail.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/utilities/convert.dart';

class PaymentTransactionModelPersistence
    implements ModelJson<PaymentTransactionModel> {
  @override
  List<PaymentTransactionModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  PaymentTransactionModel fromJson(Map<String, dynamic> json) {
    return PaymentTransactionModel(
      ref: json[PaymentTransactionModelFiedls.ref] ?? '',
      selectedPayment:
          json[PaymentTransactionModelFiedls.selectedPayment] ?? '',
      selectedBank: json[PaymentTransactionModelFiedls.selectedBank] ?? '',
      transactionFee: ConvertUtils.convertToDouble(
          json[PaymentTransactionModelFiedls.transactionFee]),
      total: ConvertUtils.convertToDouble(
          json[PaymentTransactionModelFiedls.total]),
      bahtAmount: ConvertUtils.convertToDouble(
          json[PaymentTransactionModelFiedls.bahtAmount]),
      gastaAmount: ConvertUtils.convertToDouble(
          json[PaymentTransactionModelFiedls.gastaAmount]),
      vouchers:
          List<String>.from(json[PaymentTransactionModelFiedls.vouchers] ?? []),
      accepted:
          List<bool>.from(json[PaymentTransactionModelFiedls.accepted] ?? []),
      note: json[PaymentTransactionModelFiedls.note] ?? '',
      status: json[PaymentTransactionModelFiedls.status] ?? '',
      createdAt: json[PaymentTransactionModelFiedls.createdAt] ?? '',
      updatedAt: json[PaymentTransactionModelFiedls.updatedAt] ?? '',
      uploasdSlip: json[PaymentTransactionModelFiedls.uploadSlip] ?? false,
      selectedBankNumber:
          json[PaymentTransactionModelFiedls.selectedBankNumber] ?? '',
      selectedBankName:
          json[PaymentTransactionModelFiedls.selectedBankName] ?? '',
      transactionType:
          json[PaymentTransactionModelFiedls.transactionType] ?? '',
      coinOrigin: ExchangeCoinDetailModelPersistence()
          .fromJson(json[PaymentTransactionModelFiedls.coinOrigin]),
      coinSwap: ExchangeCoinDetailModelPersistence()
          .fromJson(json[PaymentTransactionModelFiedls.coinSwap]),
    );
  }

  @override
  Map<String, dynamic> toJson(PaymentTransactionModel json) {
    return {
      PaymentTransactionModelFiedls.ref: json.ref,
      PaymentTransactionModelFiedls.selectedPayment: json.selectedPayment,
      PaymentTransactionModelFiedls.selectedBank: json.selectedBank,
      PaymentTransactionModelFiedls.transactionFee: json.transactionFee,
      PaymentTransactionModelFiedls.total: json.total,
      PaymentTransactionModelFiedls.bahtAmount: json.bahtAmount,
      PaymentTransactionModelFiedls.gastaAmount: json.gastaAmount,
      PaymentTransactionModelFiedls.vouchers: json.vouchers,
      PaymentTransactionModelFiedls.accepted: json.accepted,
      PaymentTransactionModelFiedls.note: json.note,
      PaymentTransactionModelFiedls.status: json.status,
      PaymentTransactionModelFiedls.createdAt: json.createdAt,
      PaymentTransactionModelFiedls.updatedAt: json.updatedAt,
      PaymentTransactionModelFiedls.uploadSlip: json.uploadSlip,
      PaymentTransactionModelFiedls.selectedBankNumber: json.selectedBankNumber,
      PaymentTransactionModelFiedls.selectedBankName: json.selectedBankName,
      PaymentTransactionModelFiedls.transactionType: json.transactionType,
      PaymentTransactionModelFiedls.coinOrigin:
          ExchangeCoinDetailModelPersistence().toJson(json.coinOrigin),
      PaymentTransactionModelFiedls.coinSwap:
          ExchangeCoinDetailModelPersistence().toJson(json.coinSwap),
    };
  }
}

class PaymentTransactionTrackingModelPersistence
    implements ModelJson<PaymentTransactionTrackingModel> {
  @override
  List<PaymentTransactionTrackingModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  PaymentTransactionTrackingModel fromJson(Map<String, dynamic> json) {
    return PaymentTransactionTrackingModel(
      ref: json[PaymentTransactionTrackingModelFields.ref],
      status: json[PaymentTransactionTrackingModelFields.status],
      createdAt: json[PaymentTransactionTrackingModelFields.createdAt],
    );
  }

  @override
  Map<String, dynamic> toJson(PaymentTransactionTrackingModel json) {
    return {
      PaymentTransactionTrackingModelFields.ref: json.ref,
      PaymentTransactionTrackingModelFields.createdAt: json.createdAt,
      PaymentTransactionTrackingModelFields.status: json.status,
    };
  }
}
