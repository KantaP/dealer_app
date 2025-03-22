import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/confirm_order_detail_card.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:flutter/material.dart';

class TransactionInformationSell extends StatelessWidget {
  const TransactionInformationSell({
    super.key,
    required this.orderSide,
    required this.fiatAmount,
    required this.coinAmount,
    required this.transactionFee,
    required this.networkFee,
    required this.listPair,
    required this.uom,
    this.fiatAmountActual = 0.00,
    this.coinAmountActual = 0.00,
    required this.status,
    required this.baseCurrentPrice,
  });

  final String orderSide;
  final double fiatAmount;
  final double coinAmount;
  final double transactionFee;
  final double networkFee;
  final String listPair;
  final String uom;
  final double fiatAmountActual;
  final double coinAmountActual;
  final String status;
  final double baseCurrentPrice;

  @override
  Widget build(BuildContext context) {
    final symbols = listPair.split('/');
    final base = symbols[0];
    final quote = symbols[1];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).waitingPaymentTransactionSectorLabel,
          style: titleStyle,
        ),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        Row(
          children: [
            Text(
              S.of(context).sell,
              style: paragraph1RegularStyle?.copyWith(
                color: redColor,
              ),
            ),
            const SizedBox(
              width: 5,
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
              width: 5,
            ),
            Text(
              base.toUpperCase(),
              style: paragraph1RegularStyle,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ConfirmOrderDetailCard(
              label: S.of(context).pay,
              image: SizedBox(
                width: 40,
                height: 40,
                child: StorageImage(
                  storagePath: FirebaseStorageValue.coinRef,
                  fileName: '$base.png',
                ),
              ),
              amount: coinAmount.toUom(''),
              currency: base.toUpperCase(),
            ),
            Image.asset(AssetIcons.arrowRight24),
            ConfirmOrderDetailCard(
              label: S.of(context).recieve,
              image: Image.asset(AssetIcons.baht40),
              amount: (status == OrderStatus.completed.name)
                  ? fiatAmount.toCurrency()
                  : fiatAmount.toApprox(),
              currency: quote.toUpperCase(),
              side: 'quote',
            ),
          ],
        ),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.current.coinPriceLabel.replaceAll('@value', base),
              style: paragraph1LightStyle,
            ),
            Text(
              baseCurrentPrice.toThb(),
              style: paragraph1LightStyle,
            ),
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
              style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
            ),
            Text(
              fiatAmount.toThb(),
              style: paragraph1LightStyle,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).transactionFee,
              style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
            ),
            Text(
              transactionFee.toThb(),
              style: paragraph1LightStyle,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Visibility(
        //   visible: (status == TransactionPaymentStatus.complete.name),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         S.of(context).paymentNetworkFeeText,
        //         style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        //       ),
        //       Text(
        //         networkFee.toApproxUom(uom),
        //         style: paragraph1LightStyle,
        //       )
        //     ],
        //   ),
        // ),
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
                color: darkGreyColor,
                decoration:
                    (coinAmountActual > 0 && coinAmountActual != coinAmount)
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),
            Text(
              coinAmount.toUom(uom),
              style: paragraph1LightStyle?.copyWith(
                decoration:
                    (coinAmountActual > 0 && coinAmountActual != coinAmount)
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            )
          ],
        ),
        Visibility(
          visible: coinAmountActual > 0 && coinAmountActual != coinAmount,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Actual Pay',
                style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
              ),
              Text(
                coinAmountActual.toUom(uom),
                style: paragraph1LightStyle,
              )
            ],
          ),
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
                color: darkGreyColor,
                decoration:
                    (fiatAmountActual > 0 && fiatAmountActual != fiatAmount)
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),
            Text(
              (status == OrderStatus.completed.name)
                  ? fiatAmount.toThb()
                  : fiatAmount.toApproxThb(),
              style: paragraph1LightStyle?.copyWith(
                decoration:
                    (fiatAmountActual > 0 && fiatAmountActual != fiatAmount)
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            )
          ],
        ),
        Visibility(
          visible: fiatAmountActual > 0 && fiatAmountActual != fiatAmount,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Actual Receive',
                style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
              ),
              Text(
                fiatAmountActual.toThb(),
                style: paragraph1LightStyle,
              )
            ],
          ),
        ),
        const SizedBox(
          height: Spacing.spacing20,
        ),
      ],
    );
  }
}
