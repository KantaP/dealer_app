import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/main/bindings/main_bottom_app_bar.binding.dart';
import 'package:aconnec_1109_x/src/features/main/view/di/main.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_toreceive_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_payment_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_receive_coin_arguments.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_new.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../widgets/loading/placeholder.dart';

Future<void> showOrderMenuModalBottomSheet() {
  return showCupertinoModalPopup(
    context: NavigationService.navigatorKey.currentContext!,
    barrierColor: Colors.transparent,
    builder: (_) => OrderMenuModal(),
  );
}

class OrderMenuModal extends StatelessWidget {
  const OrderMenuModal({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = MainBottomAppBarBinding.mainBottomAppBarViewModel;
    final viewModel = MainBottomAppBarBinding.orderMenuModalViewModel;
    return CustomStreamBuilder(
      stream: mainViewModel.state,
      builder: (_, snapshot) => Visibility(
        visible: snapshot.data!.openOrderMenu,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: Spacing.spacing4),
          constraints: const BoxConstraints(minHeight: 200),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BorderRadiusSet.radius12),
            color: whiteColor,
            border: Border.all(width: 1, color: blueColor.withOpacity(0.2)),
            boxShadow: [outlineBoxShadow],
          ),
          padding: const EdgeInsets.only(
            top: Spacing.spacing16,
            right: Spacing.spacing16,
            left: Spacing.spacing16,
            bottom: 0,
          ),
          child: CustomFuture(
            future: viewModel.orderCheck(),
            customLoading: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: Spacing.spacing8),
                  child:
                      ContentPlaceholder(lineType: ContentLineType.threeLines),
                ),
              )..add(
                  SizedBox(
                    height: paddingBottom() + kToolbarHeight,
                  ),
                ),
            ),
            builder: (_, snapshot) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                snapshot.data != null
                    ? _buildPendingOrder(snapshot)
                    : Container(),
                IgnorePointer(
                  ignoring: (snapshot.data != null),
                  child: Container(
                      decoration: BoxDecoration(
                        color: (snapshot.data != null)
                            ? darkGreyColor.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(BorderRadiusSet.radius8),
                      ),
                      margin: EdgeInsets.only(
                          top: (snapshot.data != null) ? Spacing.spacing10 : 0),
                      child: _buildBuyMenu()),
                ),
                const Divider(
                  thickness: 1.5,
                  color: lightGrey1Color,
                ),
                _buildTransactionMenu(),
                SizedBox(
                  height: paddingBottom() + kToolbarHeight,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBuyMenu() {
    final viewModel = MainBottomAppBarBinding.orderMenuModalViewModel;
    return GestureDetector(
      onTap: () => viewModel.goToExchange(),
      child: Container(
        padding: const EdgeInsets.all(Spacing.spacing16),
        child: Row(
          children: [
            Assets.vectorIcons.orderBuy.svg(width: 40),
            const SizedBox(
              width: Spacing.spacing8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.current.buySellFloatingMenuLabel,
                  style: paragraph1RegularStyle?.copyWith(
                      color: blueColor, decoration: TextDecoration.none),
                ),
                Text(
                  S.current.buySellFloatingMenuSubtitle,
                  style: paragraph2Style?.copyWith(
                      color: darkGreyColor, decoration: TextDecoration.none),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionMenu() {
    final viewModel = MainBottomAppBarBinding.orderMenuModalViewModel;
    return GestureDetector(
      onTap: () => viewModel.goToHistory(),
      child: Container(
        padding: const EdgeInsets.all(Spacing.spacing16),
        child: Row(
          children: [
            Assets.vectorIcons.orderHistory.svg(width: 40),
            const SizedBox(
              width: Spacing.spacing8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.current.HistoryMenuLabel,
                  style: paragraph1RegularStyle?.copyWith(
                      color: blueColor, decoration: TextDecoration.none),
                ),
                Text(
                  S.current.HistoryMenuSubtitle,
                  style: paragraph2Style?.copyWith(
                      color: darkGreyColor, decoration: TextDecoration.none),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPendingOrder(AsyncSnapshot<ResponseOrderGetModel?> snapshot) {
    Color boxColor = darkGreyColor;
    final order = snapshot.data ?? const ResponseOrderGetModel();
    final orderSide = order.orderSide ?? 'n/a';
    if (orderSide.toLowerCase() == ExchangeMode.buy.name) {
      boxColor = lightGreenColor;
    } else {
      boxColor = redColor;
    }

    final listedPair = order.listedPair ?? 'n/a';
    final symbols = listedPair.split('/');

    return GestureDetector(
      onTap: () {
        if (order.status == OrderStatus.toreceive.name) {
          NavigationService.navigatorKey.currentState!.pushNamed(
              RoutesConstant.orderToReceive,
              arguments: OrderToreceiveArgumentsScreen(
                  idOrder: order.idOrder!, refCode: order.refCode!));
        } else if (order.status == OrderStatus.topay.name) {
          if (orderSide == ExchangeMode.buy.name) {
            NavigationService.navigatorKey.currentState!.pushNamed(
                RoutesConstant.waitingPayment,
                arguments: WaitingPaymentArgumentsScreen(
                    idOrder: order.idOrder!, refCode: order.refCode!));
          } else {
            NavigationService.navigatorKey.currentState!.pushNamed(
                RoutesConstant.waitReceiveCoin,
                arguments: WaitingReceiveCoinArgumentsScreen(
                    idOrder: order.idOrder!, refCode: order.refCode!));
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusSet.radius8),
          color: const Color.fromRGBO(0, 80, 181, 0.5),
        ),
        padding: const EdgeInsets.all(Spacing.spacing16),
        child: Row(
          children: [
            Container(
              constraints: const BoxConstraints(minHeight: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BorderRadiusSet.radius8),
                color: boxColor,
              ),
              padding: const EdgeInsets.all(Spacing.spacing8),
              child: Text(
                orderSide,
                style: paragraph2Style?.copyWith(
                    color: whiteColor, decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(
              width: Spacing.spacing8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${S.current.OpenedTransaction} [$listedPair]',
                    style: paragraph1LightStyle?.copyWith(
                      color: blueColor,
                    ),
                  ),
                  Text(
                    '${order.orderValueCryptoSet!.toUom(symbols[0])} for ${order.orderValueFiatSet!.toUom(symbols[1])}',
                    style: paragraph1LightStyle,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
