import 'dart:convert';

import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/bank_account_value.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxdigitalasset_function/trxdigitalasset_get.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxfiat_function/trxfiat_get.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class SlipOrderSell extends StatelessWidget {
  const SlipOrderSell({super.key, required this.data});

  final ResponseOrderFullModel data;

  @override
  Widget build(BuildContext context) {
    final order = data.order ?? const ResponseOrderGetModel();
    final trxFiat = data.trxfiat ?? const ResponseTrxFiatGetModel();
    final trxDigital =
        data.trxdigitalasset ?? const ResponseTrxDigitalAssetGetModel();
    final symbols = order.listedPair!.split('/');
    final base = symbols[0];
    final bankDecode = data.order?.bankAccountNo ?? '';
    final bankData = (bankDecode.isEmpty)
        ? const BankAccountValueModel()
        : BankAccountValueModel.fromJson(jsonDecode(bankDecode));
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Spacing.spacing10),
          child: Center(
            child: Assets.images.paymentSlipHeader2.image(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: Spacing.spacing12,
              left: Spacing.spacing10,
              right: Spacing.spacing10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(0, 1),
                  color: blueColor.withOpacity(0.1),
                )
              ],
              image: DecorationImage(
                image: Assets.images.paymentSlipPaper.provider(),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: Spacing.spacing20,
                      ),
                      const DottedLine(
                        dashColor: midGreyColor,
                      ),
                      const SizedBox(
                        height: Spacing.spacing16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.svgImages.paymentSuccess.svg(),
                          const SizedBox(
                            width: Spacing.spacing4,
                          ),
                          Text(
                            'Order Completed',
                            style: titleStyle?.copyWith(color: greenColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: Spacing.spacing6,
                      ),
                      Center(
                        child: Text(
                          DateTimeUtils.dateTimeFormat(
                              DateTime.parse(order.datetimeCreate),
                              'dd-MM-yyyy, HH:mm'),
                          style:
                              paragraph2Style?.copyWith(color: darkGreyColor),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${S.of(context).transactionId} : ${order.refCode}',
                          style:
                              paragraph2Style?.copyWith(color: darkGreyColor),
                        ),
                      ),
                      const SizedBox(
                        height: Spacing.spacing16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            order.orderSide ?? 'n/a',
                            style: paragraph1RegularStyle?.copyWith(
                              color: redColor,
                            ),
                          ),
                          const SizedBox(
                            width: Spacing.spacing4,
                          ),
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: StorageImage(
                              storagePath: FirebaseStorageValue.coinRef,
                              fileName: '$base.png',
                            ),
                          ),
                          const SizedBox(
                            width: Spacing.spacing4,
                          ),
                          Text(
                            base,
                            style: paragraph1RegularStyle,
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          trxDigital.paymentValueActual.toUom(base),
                          style: headline4Style?.copyWith(color: blueColor),
                        ),
                      ),
                      const SizedBox(
                        height: Spacing.spacing16,
                      ),
                      const DottedLine(
                        dashColor: midGreyColor,
                      ),
                      const SizedBox(
                        height: Spacing.spacing16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$base price',
                            style: paragraph1LightStyle,
                          ),
                          Text(
                            order.digitalAssetPriceSet!.toThb(),
                            style: paragraph1LightStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: Spacing.spacing20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).waitingReceiveCoinAmountLabel,
                            style: paragraph1LightStyle?.copyWith(
                                color: darkGreyColor),
                          ),
                          Text(
                            trxFiat.paymentValueActual!.toThb(),
                            style: paragraph1LightStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Spacing.spacing10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).transactionFee,
                            style: paragraph1LightStyle?.copyWith(
                                color: darkGreyColor),
                          ),
                          Text(
                            0.00.toThb(),
                            style: paragraph1LightStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: Spacing.spacing10,
                      ),
                      const Divider(
                        color: midGreyColor,
                      ),
                      const SizedBox(
                        height: Spacing.spacing10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).confirmOrderTotalPayLabel,
                            style: paragraph1LightStyle?.copyWith(
                                color: darkGreyColor),
                          ),
                          Text(
                            trxDigital.paymentValueActual.toUom(base),
                            style: paragraph1LightStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: Spacing.spacing10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).confirmOrderTotalRecieveLabel,
                            style: paragraph1LightStyle?.copyWith(
                                color: darkGreyColor),
                          ),
                          Text(
                            trxFiat.paymentValueActual!.toThb(),
                            style: paragraph1LightStyle,
                          )
                        ],
                      ),
                      // const SizedBox(
                      //   height: Spacing.spacing16,
                      // ),
                      // const DottedLine(
                      //   dashColor: midGreyColor,
                      // ),
                      // const SizedBox(
                      //   height: Spacing.spacing16,
                      // ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       S.of(context).howtoPay,
                      //       style: paragraph1LightStyle?.copyWith(
                      //           color: darkGreyColor),
                      //     ),
                      //     UserBankInformation(
                      //       bankName: bankData.bankName,
                      //       bankAccountName: bankData.bankAccountName,
                      //       bankAccountNo: bankData.bankAccountNo,
                      //     )
                      //   ],
                      // ),
                      const SizedBox(
                        height: Spacing.spacing20,
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: blueColor,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                  child: Assets.images.paymentSlipFooter.image(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
