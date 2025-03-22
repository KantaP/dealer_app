import 'dart:convert';

import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/payment.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/slip_order_sell.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/bank_account_value.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxdigitalasset_function/trxdigitalasset_get.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxfiat_function/trxfiat_get.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/item_sliver_padding.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/order_completed.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

import '../../../widgets/layouts/default_layout.dart';
import '../../../widgets/loading.dart';
import 'widget/slip_order_buy.dart';
import 'widget/transaction_information_buy.dart';
import 'widget/transaction_information_sell.dart';
import 'widget/user_bank_information.dart';

class OrderCompletedView extends CustomView<OrderCompletedViewModel> {
  final int idOrder;
  final String refCode;

  const OrderCompletedView({
    required OrderCompletedViewModel viewModel,
    super.key,
    required this.idOrder,
    required this.refCode,
  }) : super.model(viewModel);

  @override
  ViewState<OrderCompletedView, OrderCompletedViewModel> createState() =>
      _OrderCompletedViewState(viewModel);
}

class _OrderCompletedViewState
    extends ViewState<OrderCompletedView, OrderCompletedViewModel> {
  _OrderCompletedViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
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
        child: Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildSlipForSave(snapshot: snapshot),
                  ],
                ),
              ),
            ),
            DefaultLayout(
              appBar: _buildAppBar(),
              slivers: [
                _buildTransactionIdSection(snapshot),
                _buildDivider(),
                _buildTransactionInformation(snapshot),
                _buildFulllDivider(),
                _buildUserPaymentInformation(snapshot),
                _buildFulllDivider(),
                _buildActionButtons(snapshot),
              ],
              physics: const BouncingScrollPhysics(),
              extendBody: true,
              safeAreaBottom: true,
            )
          ],
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

  Widget _buildTransactionInformation(
      AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    final order = snapshot.data!.order;
    final trxFiat = snapshot.data?.trxfiat ?? const ResponseTrxFiatGetModel();
    final trxDigitalAsset = snapshot.data?.trxdigitalasset ??
        const ResponseTrxDigitalAssetGetModel();
    if (order == null) return Container();
    final symbols = order.listedPair!.split('/');

    return ItemSliverPadding(
      child: SliverToBoxAdapter(
        child: (order.orderSide == ExchangeMode.sell.name)
            ? TransactionInformationSell(
                orderSide: order.orderSide ?? '',
                coinAmount: trxDigitalAsset.paymentValueActual ?? 0.00,
                fiatAmount: trxFiat.paymentValueActual ?? 0.00,
                listPair: order.listedPair ?? '',
                networkFee: order.digitalAssetFeeSet,
                transactionFee: 0.00,
                uom: symbols[0],
                coinAmountActual: trxDigitalAsset.paymentValueActual ?? 0.00,
                fiatAmountActual: trxFiat.paymentValueActual ?? 0.00,
                status: order.status ?? '',
                baseCurrentPrice: order.digitalassetPriceActual ?? 0.00,
              )
            : TransactionInformationBuy(
                orderSide: order.orderSide ?? '',
                coinAmount: trxDigitalAsset.paymentValueActual ?? 0.00,
                fiatAmount: trxFiat.paymentValueActual ?? 0.00,
                listPair: order.listedPair ?? '',
                networkFee: order.digitalAssetFeeSet,
                transactionFee: 0.00,
                uom: symbols[0],
                coinAmountActual: trxDigitalAsset.paymentValueActual ?? 0.00,
                fiatAmountActual: trxFiat.paymentValueActual ?? 0.00,
                status: order.status ?? '',
                baseCurrentPrice: order.digitalassetPriceActual ?? 0.00,
              ),
      ),
    );
  }

  Widget _buildFulllDivider() {
    return const SliverToBoxAdapter(child: CustomDivider());
  }

  Widget _buildUserPaymentInformation(
      AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
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
      try {
        final bankDecode = snapshot.data!.order?.bankAccountNo ?? '';
        final bankData = (bankDecode.isEmpty)
            ? const BankAccountValueModel()
            : BankAccountValueModel.fromJson(jsonDecode(bankDecode));
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
      } catch (e) {
        return const ItemSliverPadding(
          child: SliverToBoxAdapter(),
        );
      }
    }
  }

  Widget _buildActionButtons(AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    return ItemSliverPadding(
      child: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: Spacing.spacing20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  viewModel
                      .shareSlipPayment(snapshot.data!.order?.refCode ?? 'n/a');
                },
                child: Text(
                  S.of(context).saveSlipButton,
                ),
              ),
              const SizedBox(
                height: Spacing.spacing10,
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
                  border: Border.all(color: darkGreyColor),
                ),
                padding: const EdgeInsets.all(Spacing.spacing16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      label: 'ระบุ email ที่ต้องการรับใบเสร็จ',
                      controller: viewModel.emailController,
                      placeholder: 'xxx@xxx.com',
                    ),
                    OutlinedButton(
                      onPressed: () {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(viewModel.emailController.text);

                        if (emailValid) {
                          DialogUtils.customShowDialog(
                              context: context,
                              dialog: (context) => _buildAlertDialog());
                        } else {
                          DialogUtils.customShowDialog(
                              context: context,
                              dialog: (context) => _buildCheckEmailDialog());
                        }
                      },
                      child: const Text(
                        'ขอใบเสร็จ',
                      ),
                    ),
                  ],
                ),
              ),

              // InkWell(
              //   onTap: () {
              //     viewModel.backToHome();
              //   },
              //   child: Center(
              //     child: Text(
              //       S.of(context).backtoHomeButton,
              //       style: textInButtonStyle,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertDialog() {
    return CustomDialogAlert(
      descriptions: Text(
        'ใบเสร็จที่ส่งไปยังอีเมล์ที่ท่านระบุแล้ว',
        style: titleStyle,
      ),
      title: const Text(''),
      submitButton: ElevatedButton(
        onPressed: () {
          NavigationService.back(NavigationResult(null));
        },
        child: const Text('ตกลง'),
      ),
    );
  }

  Widget _buildCheckEmailDialog() {
    return CustomDialogAlert(
      descriptions: Text(
        'กรุณาตรวจสอบอีเมล์ของท่าน',
        style: titleStyle,
      ),
      title: const Text(''),
      submitButton: ElevatedButton(
        onPressed: () {
          NavigationService.back(NavigationResult(null));
        },
        child: const Text('ตกลง'),
      ),
    );
  }

  Widget _buildAppBar() {
    return DefaultAppBar(
      // automaticallyImplyLeading: false,
      title: S.of(context).orderCompletedNavTitle,
      textHilightColor: greenColor,
      centerTitle: true,
    );
  }

  Widget _buildHowToPay(String paymentChannel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).waitingPaymentHowtoPayLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        (paymentChannel == 'n/a')
            ? Text(
                'n/a',
                style: paragraph1LightStyle,
              )
            : Row(
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

  Widget _buildSlipForSave(
      {required AsyncSnapshot<ResponseOrderFullModel?> snapshot}) {
    final orderSide = snapshot.data!.order?.orderSide ?? 'n/a';

    return RepaintBoundary(
      key: viewModel.slipForSaveKey,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.paymentSlipBg.provider(),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            right: 10,
            left: 10,
            bottom: 10,
          ),
          child: orderSide == ExchangeMode.buy.name
              ? SlipOrderBuy(
                  data: snapshot.data!,
                )
              : SlipOrderSell(data: snapshot.data!),
        ),
      ),
    );
  }
}
