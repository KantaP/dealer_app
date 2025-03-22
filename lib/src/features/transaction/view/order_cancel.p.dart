import 'dart:convert';

import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/transaction_information_buy.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/transaction_information_sell.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/user_bank_information.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/item_sliver_padding.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/payment.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/order_cancel.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

import '../../../model/cloudfunction/order_function/bank_account_value.m.dart';
import '../../../model/cloudfunction/trxdigitalasset_function/trxdigitalasset_get.m.dart';
import '../../../model/cloudfunction/trxfiat_function/trxfiat_get.m.dart';
import '../../../widgets/custom_future.dart';

class OrderCancelView extends CustomView<OrderCancelViewModel> {
  final int idOrder;
  final String refCode;

  const OrderCancelView({
    required OrderCancelViewModel viewModel,
    super.key,
    required this.idOrder,
    required this.refCode,
  }) : super.model(viewModel);

  @override
  ViewState<OrderCancelView, OrderCancelViewModel> createState() =>
      _OrderCancelViewState(viewModel);
}

class _OrderCancelViewState
    extends ViewState<OrderCancelView, OrderCancelViewModel> {
  _OrderCancelViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  void didPush() {
    // TODO: implement didPush
    super.didPush();
    print(widget.idOrder);
  }

  @override
  Widget build(BuildContext context) {
    return CustomFuture(
      future: viewModel.getOrder(widget.idOrder, widget.refCode),
      customLoading: DefaultLayout(
        appBar: _buildAppBar(),
        slivers: const [
          SliverFillRemaining(
            child: Loading(),
          )
        ],
        extendBody: false,
        physics: const NeverScrollableScrollPhysics(),
      ),
      customError: DefaultLayout(
        appBar: _buildAppBar(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: const Icon(Icons.refresh),
                ),
                Text(
                  'Please try again.',
                  style: paragraph2Style,
                )
              ],
            ),
          )
        ],
        extendBody: false,
        physics: const NeverScrollableScrollPhysics(),
      ),
      builder: (_, snapshot) => WillPopScope(
        onWillPop: () => viewModel.goToHistory(),
        child: DefaultLayout(
          appBar: _buildAppBar(),
          slivers: [
            _buildTransactionIdSection(snapshot),
            _buildDivider(),
            _buildWarningSection(snapshot),
            _buildDivider(),
            _buildTransactionInformation(snapshot),
            _buildFulllDivider(),
            _buildUserPaymentInformation(snapshot),
            // _buildFulllDivider(),
            // _buildActionButtons(snapshot),
          ],
          physics: const BouncingScrollPhysics(),
          extendBody: true,
          safeAreaBottom: true,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const ItemSliverPadding(
      child: SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: Spacing.spacing20,
            ),
            Divider(
              color: dividerColor,
            ),
            SizedBox(
              height: Spacing.spacing20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionIdSection(
      AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    return ItemSliverPadding(
      child: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateTimeUtils.dateTimeFormat(
                  DateTime.parse(snapshot.data!.order?.datetimeCreate ??
                      DateTime.now().toString()),
                  'dd-MM-yyyy, HH:mm'),
              style: paragraph2Style?.copyWith(color: darkGreyColor),
            ),
            Text(
              '${S.of(context).transactionId}: ${snapshot.data!.order?.refCode ?? 'n/a'}',
              style: paragraph1RegularStyle?.copyWith(color: midGreyColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWarningSection(AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    return ItemSliverPadding(
      child: SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).orderCancelDescription,
              style: titleStyle,
            ),
            const SizedBox(
              height: Spacing.spacing10,
            ),
            Text(
              S.of(context).orderCancelReasonLabel,
              style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
            ),
            Text(
              snapshot.data!.order?.cancelReason ?? 'n/a',
              style: paragraph1LightStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionInformation(
      AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    final order = snapshot.data!.order;
    final trxFiat = snapshot.data?.trxfiat ?? const ResponseTrxFiatGetModel();
    final trxDigitalAsset = snapshot.data?.trxdigitalasset ??
        const ResponseTrxDigitalAssetGetModel();
    if (order == null) return Container();
    final symbols = order.listedPair!.split('/');
    final base = symbols[0];
    return ItemSliverPadding(
      child: SliverToBoxAdapter(
        child: (order.orderSide == ExchangeMode.sell.name)
            ? TransactionInformationSell(
                orderSide: order.orderSide ?? '',
                coinAmount: order.orderValueCryptoSet ?? 0.00,
                fiatAmount: order.orderValueFiatSet ?? 0.00,
                listPair: order.listedPair ?? '',
                networkFee: order.digitalAssetFeeSet,
                transactionFee: 0.00,
                uom: symbols[0],
                coinAmountActual: trxDigitalAsset.paymentValueActual ?? 0.00,
                fiatAmountActual: trxFiat.paymentValueActual ?? 0.00,
                status: order.status ?? '',
                baseCurrentPrice: order.digitalAssetPriceSet ?? 0.00,
              )
            : TransactionInformationBuy(
                orderSide: order.orderSide ?? '',
                coinAmount: order.orderValueCryptoSet ?? 0.00,
                fiatAmount: order.orderValueFiatSet ?? 0.00,
                listPair: order.listedPair ?? '',
                networkFee: order.digitalAssetFeeSet,
                transactionFee: 0.00,
                uom: symbols[0],
                coinAmountActual: trxDigitalAsset.paymentValueActual ?? 0.00,
                fiatAmountActual: trxFiat.paymentValueActual ?? 0.00,
                status: order.status ?? '',
                baseCurrentPrice: order.digitalAssetPriceSet ?? 0.00,
              ),
      ),
    );
  }

  Widget _buildFulllDivider() {
    return const SliverToBoxAdapter(child: CustomDivider());
  }

  Widget _buildUserPaymentInformation(
      AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    final bankDecode = snapshot.data!.order?.bankAccountNo ?? '';
    final bankData = (bankDecode.isEmpty)
        ? const BankAccountValueModel()
        : BankAccountValueModel.fromJson(jsonDecode(bankDecode));
    final orderSide = snapshot.data!.order?.orderSide ?? '';
    if (orderSide == ExchangeMode.buy.name) {
      return ItemSliverPadding(
        child: SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
                top: Spacing.spacing10, bottom: Spacing.spacing10),
            child:
                _buildHowToPay(snapshot.data!.trxfiat?.paymentChannel ?? 'n/a'),
          ),
        ),
      );
    } else {
      return ItemSliverPadding(
        child: SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
                top: Spacing.spacing10, bottom: Spacing.spacing10),
            child: UserBankInformation(
              bankName: bankData.bankName,
              bankAccountName: bankData.bankAccountName,
              bankAccountNo: bankData.bankAccountNo,
            ),
          ),
        ),
      );
    }
  }

  Widget _buildActionButtons(AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    return ItemSliverPadding(
      child: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: Spacing.spacing20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  viewModel.goToHistory();
                },
                child: Text(
                  S.of(context).viewHistoryButton,
                ),
              ),
              const SizedBox(
                height: Spacing.spacing10,
              ),
              InkWell(
                onTap: () {
                  viewModel.goBack();
                },
                child: Center(
                  child: Text(
                    S.of(context).backtoHomeButton,
                    style: textInButtonStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return DefaultAppBar(
      title: S.of(context).orderCancelTitle,
      textHilightColor: redColor,
      centerTitle: true,
    );
  }

  Widget _buildHowToPay(String paymentChannel) {
    if (paymentChannel == 'n/a') return Container();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).waitingPaymentHowtoPayLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Row(
          children: [
            (paymentChannel == OrderBuyPaymentChannel.bank.name)
                ? Image.asset(PaymentStaticValue.payments[2].icon)
                : Image.asset(PaymentStaticValue.payments[0].icon),
            const SizedBox(
              width: 5,
            ),
            Text(
              (paymentChannel == OrderBuyPaymentChannel.bank.name)
                  ? PaymentStaticValue.payments[2].label
                  : PaymentStaticValue.payments[0].label,
              style: paragraph1LightStyle,
            ),
          ],
        )
      ],
    );
  }
}
