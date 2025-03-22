import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_cancel_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_completed_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_toreceive_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_payment_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_receive_coin_arguments.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.order});

  final ResponseOrderGetModel order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        gotOrderDetail();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Spacing.spacing10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTransactionTitle(),
            const SizedBox(
              height: Spacing.spacing20,
            ),
            _buildTransactionCoinPrice(),
            _buildTransactionId(),
            // _buildTransactionSpent(),
            // _buildTransactionReceive(),
            // _buildTransactionIpAddress(),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionTitle() {
    final symbols = order.listedPair!.split('/');
    final base = symbols[0];
    return Row(
      children: [
        Text(
          (order.orderSide == PaymentSide.buy.name)
              ? S.of(NavigationService.navigatorKey.currentContext!).buy
              : S.of(NavigationService.navigatorKey.currentContext!).sell,
          style: paragraph1RegularStyle?.copyWith(
              color: (order.orderSide == PaymentSide.buy.name)
                  ? greenColor
                  : redColor),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: StorageImage(
            storagePath: FirebaseStorageValue.coinRef,
            fileName: '$base.png',
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          order.listedPair!.toUpperCase(),
          style: paragraph1RegularStyle,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                order.status!,
                style: paragraph1RegularStyle?.copyWith(color: midGreyColor),
              ),
              const SizedBox(
                width: 5,
              ),
              Assets.icons.arrowRight.image(width: 16, height: 16)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTransactionCoinPrice() {
    final symbols = order.listedPair!.split('/');
    final base = symbols[0];
    return Row(
      children: [
        Text(
          S.current.coinPriceLabel.replaceAll('@value', base),
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
        const SizedBox(
          width: Spacing.spacing10,
        ),
        Text(
          order.status == OrderStatus.completed.name
              ? order.digitalassetPriceActual!.toThb()
              : order.digitalAssetPriceSet!.toThb(),
          style: paragraph2Style,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                DateTimeUtils.dateTimeFormat(
                    DateTime.parse(order.datetimeCreate), 'dd-MM-yyyy, HH:mm'),
                style: paragraph2LightStyle?.copyWith(color: midGreyColor),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTransactionId() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transaction Id: ',
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
        Text(
          order.refCode!,
          style: paragraph2Style,
        )
      ],
    );
  }

  Widget _buildTransactionSpent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Spent',
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
        Text(
          (order.orderSide == PaymentSide.buy.name)
              ? order.orderValueFiatSet!.toThb()
              : order.digitalassetPriceActual!.toUom(order.digitalassetType!),
          style: paragraph2Style,
        )
      ],
    );
  }

  Widget _buildTransactionReceive() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'You Receive',
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
        Text(
          (order.orderSide == PaymentSide.buy.name)
              ? order.orderValueCryptoSet!.toUom(order.digitalassetType!)
              : order.orderValueFiatSet!.toThb(),
          style: paragraph2Style,
        )
      ],
    );
  }

  Widget _buildTransactionIpAddress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'IP Address',
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
        Text(
          '127.0.0.1',
          style: paragraph2Style,
        )
      ],
    );
  }

  void gotOrderDetail() {
    if (order.status == OrderStatus.pending.name) {
      if (order.orderSide == ExchangeMode.buy.name) {
        NavigationService.navigatorKey.currentState!.pushReplacementNamed(
          RoutesConstant.waitingPayment,
          arguments: WaitingPaymentArgumentsScreen(
              idOrder: order.idOrder!, refCode: order.refCode!),
        );
      } else {
        NavigationService.navigatorKey.currentState!.pushReplacementNamed(
          RoutesConstant.waitReceiveCoin,
          arguments: WaitingReceiveCoinArgumentsScreen(
              idOrder: order.idOrder!, refCode: order.refCode!),
        );
      }
    }
    if (order.status == OrderStatus.topay.name) {
      if (order.orderSide == ExchangeMode.buy.name) {
        NavigationService.navigatorKey.currentState!.pushReplacementNamed(
          RoutesConstant.waitingPayment,
          arguments: WaitingPaymentArgumentsScreen(
              idOrder: order.idOrder!, refCode: order.refCode!),
        );
      } else {
        NavigationService.navigatorKey.currentState!.pushReplacementNamed(
          RoutesConstant.waitReceiveCoin,
          arguments: WaitingReceiveCoinArgumentsScreen(
              idOrder: order.idOrder!, refCode: order.refCode!),
        );
      }
    }
    if (order.status == OrderStatus.toreceive.name) {
      NavigationService.navigatorKey.currentState!.pushReplacementNamed(
        RoutesConstant.orderToReceive,
        arguments: OrderToreceiveArgumentsScreen(
            idOrder: order.idOrder!, refCode: order.refCode!),
      );
    }
    if (order.status == OrderStatus.cancelled.name) {
      NavigationService.navigatorKey.currentState!.pushReplacementNamed(
        RoutesConstant.orderCancel,
        arguments: OrderCancelArgumentsScreen(
            idOrder: order.idOrder!, refCode: order.refCode!),
      );
    }
    if (order.status == OrderStatus.completed.name) {
      NavigationService.navigatorKey.currentState!.pushReplacementNamed(
        RoutesConstant.orderCompleted,
        arguments: OrderCompletedArgumentsScreen(
            idOrder: order.idOrder!, refCode: order.refCode!),
      );
    }
  }
}
