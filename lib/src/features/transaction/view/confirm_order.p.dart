import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/confirm_order_arguments.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/model/network.m.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:aconnec_1109_x/src/widgets/warning_gray_text_box.dart';
import 'package:aconnec_1109_x/src/widgets/warning_text_box.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/banks.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/confirm_order.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/confirm_order.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/confirm_order_detail_card.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_checkbox_field.dart';
import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:rxdart/streams.dart';

import '../../../model/request_user_bank_account.m.dart';

class ConfirmOrderView extends CustomView<ConfirmOrderViewModel> {
  final ConfirmOrderArgumentsScreen arguments;

  const ConfirmOrderView({
    required ConfirmOrderViewModel viewModel,
    super.key,
    required this.arguments,
  }) : super.model(viewModel);

  @override
  ViewState<ConfirmOrderView, ConfirmOrderViewModel> createState() =>
      _ConfirmOrderViewState(viewModel);
}

class _ConfirmOrderViewState
    extends ViewState<ConfirmOrderView, ConfirmOrderViewModel> {
  _ConfirmOrderViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  void didPush() {
    super.didPush();
    final arguments = widget.arguments;
    final network = NetworkModel(
      networkName: 'Testnet',
      description: 'Fee 5.0000 GASTH (~5.15 THB)\nArrival time ~ 5 mins',
      networkCode: 'Testnet',
    );
    viewModel.updateFormState(<String, dynamic>{
      ConfirmOrderFormStateFields.bahtAmount: arguments.baseTotal,
      ConfirmOrderFormStateFields.coinAmount: arguments.quoteTotal,
      ConfirmOrderFormStateFields.totalAmount: arguments.baseTotal,
      ConfirmOrderFormStateFields.mode: arguments.mode,
      ConfirmOrderFormStateFields.uom: arguments.symbol,
      ConfirmOrderFormStateFields.networkCode: network.networkName
    });

    viewModel.argumentSubject.setValue(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultLayout(
          appBar: DefaultAppBar(
            // automaticallyImplyLeading: false,
            title: S.of(context).confirmOrderTitle,
            centerTitle: true,
          ),
          statusBarColor: whiteColor,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                  left: Spacing.spacing24,
                  right: Spacing.spacing24,
                  top: Spacing.spacing20),
              sliver: SliverToBoxAdapter(
                child: _buildDetailSection(),
              ),
            ),
            SliverToBoxAdapter(
              child: StreamBuilder<ConfirmOrderFormState>(
                stream: viewModel.formState,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  if (snapshot.data!.mode == ExchangeMode.buy.name) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: Spacing.spacing20,
                        ),
                        const CustomDivider(),
                        const SizedBox(
                          height: Spacing.spacing12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Spacing.spacing24,
                          ),
                          child: _buildWalletAddressSection(),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
            const SliverPadding(
                padding: EdgeInsets.only(top: Spacing.spacing20)),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 12)),
            SliverPadding(
              padding: const EdgeInsets.only(
                  left: Spacing.spacing24, right: Spacing.spacing24),
              sliver: SliverToBoxAdapter(
                child: StreamBuilder<ConfirmOrderFormState>(
                    stream: viewModel.formState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      if (snapshot.data!.mode == ExchangeMode.buy.name) {
                        return _buildBuyPaymentSection();
                      }
                      return _buildSellReceiveSection();
                    }),
              ),
            ),
            // const SliverPadding(padding: EdgeInsets.only(top: Spacing.spacing10)),
            // const SliverToBoxAdapter(
            //   child: CustomDivider(),
            // ),
            // const SliverPadding(padding: EdgeInsets.only(top: Spacing.spacing10)),
            // SliverPadding(
            //   padding: const EdgeInsets.only(left: Spacing.spacing24, right: Spacing.spacing24),
            //   sliver: SliverToBoxAdapter(
            //     child: _buildNoteSection(),
            //   ),
            // ),
            const SliverPadding(
                padding: EdgeInsets.only(top: Spacing.spacing10)),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            const SliverPadding(
                padding: EdgeInsets.only(top: Spacing.spacing10)),
            _buildPriceDetail(),
            SliverPadding(
              padding: const EdgeInsets.only(
                  left: Spacing.spacing24, right: Spacing.spacing24),
              sliver: SliverToBoxAdapter(
                child: StreamBuilder<ConfirmOrderFormState>(
                  builder: (_, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return Visibility(
                      visible: snapshot.data!.mode == ExchangeMode.buy.name,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Spacing.spacing20),
                            child: CustomDivider(),
                          ),
                          _buildConditionSection(),
                        ],
                      ),
                    );
                  },
                  stream: viewModel.formState,
                ),
              ),
            ),
            const SliverPadding(
                padding: EdgeInsets.only(top: Spacing.spacing10)),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            const SliverPadding(
                padding: EdgeInsets.only(top: Spacing.spacing20)),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
              sliver: SliverToBoxAdapter(
                child: _buildSubmitSection(),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 32))
          ],
          physics: const BouncingScrollPhysics(),
          extendBody: true,
        ),
        StreamBuilder<ConfirmOrderPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) return Container();
            return Visibility(
                visible: snapshot.data!.isLoading, child: const Loading());
          },
        )
      ],
    );
  }

  Widget _buildDetailSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomStreamBuilder(
          stream: viewModel.formState,
          builder: (_, snapshot) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                (snapshot.data!.mode == ExchangeMode.buy.name)
                    ? S.of(context).buy
                    : S.of(context).sell,
                style: paragraph1RegularStyle?.copyWith(
                    color: (snapshot.data!.mode == ExchangeMode.buy.name)
                        ? greenColor
                        : redColor),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 24,
                height: 24,
                child: StorageImage(
                  storagePath: FirebaseStorageValue.coinRef,
                  fileName: '${widget.arguments.coinData.getBaseSymbol()}.png',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              StreamBuilder<ConfirmOrderArgumentsScreen?>(
                stream: viewModel.argumentSubject.state(),
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  if (snapshot.data == null) return Container();
                  final symbols = snapshot.data!.symbol.split('/');
                  return Text(
                    symbols[0],
                    style: paragraph1RegularStyle,
                  );
                },
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder<ConfirmOrderFormState>(
          stream: viewModel.formState,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) return Container();
            if (snapshot.data!.mode == ExchangeMode.buy.name) {
              return _buildBuySwapDetail(
                  quoteAmount: snapshot.data!.bahtAmount,
                  baseAmount: snapshot.data!.coinAmount);
            }
            return _buildSellSwapDetail(
              quoteAmount: snapshot.data!.bahtAmount,
              baseAmount: snapshot.data!.coinAmount,
            );
          },
        ),
        const SizedBox(
          height: Spacing.spacing20,
        ),
      ],
    );
  }

  Widget _buildPriceDetail() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.current.coinPriceLabel.replaceAll(
                      '@value', widget.arguments.coinData.getBaseSymbol()),
                  style: paragraph1LightStyle,
                ),
                Text(
                  (widget.arguments.mode == ExchangeMode.buy.name)
                      ? widget.arguments.coinPrice.getBuyValue().toThb()
                      : widget.arguments.coinPrice.getSellValue().toThb(),
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
                StreamBuilder<ConfirmOrderFormState>(
                    stream: viewModel.formState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      return Text(
                        (snapshot.data!.mode == ExchangeMode.sell.name)
                            ? S.of(context).confirmOrderReceiveLabel
                            : S.of(context).confirmOrderPurchaseLabel,
                        style: paragraph1LightStyle?.copyWith(
                            color: darkGreyColor),
                      );
                    }),
                StreamBuilder<ConfirmOrderFormState>(
                    stream: viewModel.formState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      return Text(
                        snapshot.data!.bahtAmount.toThb(),
                        style: paragraph1LightStyle,
                      );
                    })
              ],
            ),
            const SizedBox(
              height: Spacing.spacing10,
            ),
            Visibility(
              visible: widget.arguments.mode == ExchangeMode.sell.name,
              child: Padding(
                padding: const EdgeInsets.only(bottom: Spacing.spacing10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).transactionFee,
                      style:
                          paragraph1LightStyle?.copyWith(color: darkGreyColor),
                    ),
                    Text(
                      0.00.toThb(),
                      style: paragraph1LightStyle,
                    )
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: Spacing.spacing10,
            // ),
            StreamBuilder<ConfirmOrderFormState>(
                stream: viewModel.formState,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  return Visibility(
                    visible: snapshot.data!.mode == ExchangeMode.buy.name,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).paymentNetworkFeeText,
                          style: paragraph1LightStyle?.copyWith(
                              color: darkGreyColor),
                        ),
                        Flexible(
                          child: Text(
                            widget.arguments.coinPrice
                                .getFeeValue()
                                .toApproxUom(
                                  widget.arguments.coinData.getBaseSymbol(),
                                ),
                            style: paragraph1LightStyle,
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                  );
                }),
            const SizedBox(
              height: Spacing.spacing10,
            ),
            const Divider(
              color: dividerColor,
            ),
            const SizedBox(
              height: Spacing.spacing10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).confirmOrderTotalPayLabel,
                  style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
                ),
                StreamBuilder<ConfirmOrderFormState>(
                    stream: viewModel.formState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      return Text(
                        (snapshot.data!.mode == ExchangeMode.buy.name)
                            ? snapshot.data!.bahtAmount.toThb()
                            : snapshot.data!.coinAmount.toUom(
                                widget.arguments.coinData.getBaseSymbol()),
                        style: paragraph1LightStyle,
                      );
                    })
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
                  style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
                ),
                StreamBuilder<ConfirmOrderFormState>(
                  stream: viewModel.formState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return Text(
                      (snapshot.data!.mode == ExchangeMode.buy.name)
                          ? snapshot.data!.coinAmount.toApproxUom(
                              widget.arguments.coinData.getBaseSymbol(),
                            )
                          : widget.arguments.baseTotal.toApproxThb(),
                      style: paragraph1LightStyle,
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: Spacing.spacing10,
            ),
            StreamBuilder<ConfirmOrderFormState>(
              stream: viewModel.formState,
              builder: (context, snapshot) {
                if (snapshot.hasData == false) return Container();
                if (snapshot.data!.mode == ExchangeMode.buy.name) {
                  return _buildBuyWarningMessage();
                }
                if (snapshot.data!.mode == ExchangeMode.sell.name) {
                  return _buildSellWarningMessage();
                }
                return Container();
              },
            ),
            const SizedBox(
              height: Spacing.spacing20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuyPaymentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHowToPay(),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: dividerColor,
        ),
        const SizedBox(
          height: 5,
        ),
        _buildBankSelected(),
        const SizedBox(
          height: 5,
        ),
        // const Divider(
        //   color: dividerColor,
        // ),
        // const SizedBox(
        //   height: 5,
        // ),
        // _buildCouponSelect()
      ],
    );
  }

  Widget _buildSellReceiveSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBankSelected(),
        // const SizedBox(
        //   height: 5,
        // ),
        // const Divider(
        //   color: dividerColor,
        // ),
        // const SizedBox(
        //   height: 5,
        // ),
        // _buildCouponSelect()
      ],
    );
  }

  Widget _buildNoteSection() {
    return CustomTextField(
      label: S.of(context).note,
      controller: viewModel.noteControlelr,
      onChanged: (value) {
        viewModel.updateFormState({
          ConfirmOrderFormStateFields.note: value,
        });
      },
      maxlength: 50,
    );
  }

  Widget _buildConditionSection() {
    return StreamBuilder<ConfirmOrderFormState>(
      stream: viewModel.formState,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCheckboxField(
              label: S.of(context).confirmPaymentConditionTitle,
              values: [
                CheckboxValue(
                    title: S.of(context).confirmPaymentCondition1, value: '1'),
                CheckboxValue(
                    title: S.of(context).confirmPaymentCondition2, value: '2'),
                CheckboxValue(
                    title: S.of(context).confirmPaymentCondition3, value: '3'),
              ],
              onSelect: (value) {
                viewModel.toggleCondition(value);
              },
              selected: snapshot.data!.conditionSelected,
              checkboxTextStyle: paragraph2Style?.copyWith(color: blueColor),
            ),
            // Text(
            //   S.of(context).whatIsCondition,
            //   style: notiveTextUnderline,
            // )
          ],
        );
      },
    );
  }

  Widget _buildSubmitSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<ConfirmOrderFormState>(
                stream: viewModel.formState,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return const Text('');
                  return Text(
                    S.of(context).youWillPay,
                    style: titlePageStyle?.copyWith(color: darkGreyColor),
                  );
                }),
            StreamBuilder<ConfirmOrderFormState>(
              stream: viewModel.formState,
              builder: (context, snapshot) {
                if (snapshot.hasData == false) return Container();
                return Text(
                  (snapshot.data!.mode == ExchangeMode.buy.name)
                      ? snapshot.data!.totalAmount.toThb()
                      : snapshot.data!.coinAmount
                          .toUom(widget.arguments.coinData.getBaseSymbol()),
                  style: titlePageStyle?.copyWith(color: blueColor),
                );
              },
            )
          ],
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        CustomStreamBuilder(
          stream: CombineLatestStream.combine2(
              viewModel.formState, viewModel.state, (a, b) => [a, b]),
          builder: (context, snapshot) {
            return ElevatedButton(
                onPressed: (viewModel.validate() == false)
                    ? null
                    : () {
                        viewModel.preSubmit(context);
                      },
                child: Text(S.of(context).confirmButton));
          },
        )
      ],
    );
  }

  Widget _buildSellHint() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: yellowColor.withOpacity(0.5),
            border: Border.all(width: 1, color: yellowColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
            child: Text(
              S.of(context).sellHint,
              style: paragraph2Style?.copyWith(color: yellowText),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        Container(
          decoration: BoxDecoration(
            color: yellowColor.withOpacity(0.5),
            border: Border.all(width: 1, color: yellowColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
            child: Text(
              S.of(context).sellWarning,
              style: paragraph2Style?.copyWith(color: yellowText),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBuySwapDetail(
      {required double quoteAmount, required double baseAmount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ConfirmOrderDetailCard(
          label: S.of(context).pay,
          image: Image.asset(AssetIcons.baht40),
          amount: quoteAmount.toCurrency(),
          currency: CurrencySwapType.thb.name.toUpperCase(),
        ),
        Image.asset(AssetIcons.arrowRight24),
        ConfirmOrderDetailCard(
          label: S.of(context).recieve,
          image: SizedBox(
            width: 40,
            height: 40,
            child: StorageImage(
              storagePath: FirebaseStorageValue.coinRef,
              fileName: '${widget.arguments.coinData.getBaseSymbol()}.png',
            ),
          ),
          amount: baseAmount.toApproxUom(''),
          currency: widget.arguments.coinData.getBaseSymbol(),
          side: 'quote',
        ),
      ],
    );
  }

  Widget _buildSellSwapDetail(
      {required double quoteAmount, required double baseAmount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ConfirmOrderDetailCard(
          label: S.of(context).pay,
          image: StorageImage(
            storagePath: FirebaseStorageValue.coinRef,
            fileName: '${widget.arguments.coinData.getBaseSymbol()}.png',
          ),
          amount: baseAmount.toUom(''),
          currency: widget.arguments.coinData.getBaseSymbol(),
        ),
        Image.asset(AssetIcons.arrowRight24),
        ConfirmOrderDetailCard(
          label: S.of(context).recieve,
          image: Image.asset(AssetIcons.baht40),
          amount: quoteAmount.toApprox(),
          currency: widget.arguments.coinData.getQuoteSymbol(),
          side: 'quote',
        ),
      ],
    );
  }

  Widget _buildWalletAddressSection() {
    return Column(
      children: [
        CustomTextField(
          label: S.of(context).walletAddressLabel,
          suffixIcon: GestureDetector(
            onTap: () {
              viewModel.gotoQrCodeScanner();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Assets.svgImages.scan.svg(),
            ),
          ),
          controller: viewModel.walletAddressTextController,
          maxLines: 1,
          onChanged: (value) {
            viewModel.updateState({
              ConfirmOrderFormStateFields.walletAddress: value,
            });
          },
        ),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        InkWell(
          onTap: () {
            // viewModel.gotoSelectNetwork();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<ConfirmOrderFormState>(
                stream: viewModel.formState,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return const Text('');
                  return Text(
                    S.of(context).walletNetworkLabel,
                    style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
                  );
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StreamBuilder<ConfirmOrderFormState>(
                    stream: viewModel.formState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      return Text(
                        (snapshot.data!.networkCode.isEmpty)
                            ? S.of(context).walletNetWorkPlaceholder
                            : snapshot.data!.networkCode,
                        style: paragraph2Style,
                      );
                    },
                  ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  // Assets.icons.arrowRight.image()
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBuyWarningMessage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WarningTextBox(text: S.of(context).buyWarningMessage1),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        WarningGrayTextBox(
          text: S.of(context).buyWarningMessage2,
        )
      ],
    );
  }

  Widget _buildSellWarningMessage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WarningTextBox(text: S.of(context).sellWarningMessage1),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        WarningGrayTextBox(
          text: S.of(context).sellWarningMessage2,
        )
      ],
    );
  }

  Widget _buildQrPromptPayText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.icons.qr24.image(),
        const SizedBox(
          width: Spacing.spacing10,
        ),
        Flexible(
          child: Text(
            'QR พร้อมเพย์',
            style: paragraph2Style,
            overflow: TextOverflow.clip,
          ),
        )
      ],
    );
  }

  Widget _buildBankTransaferText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.icons.swap24.image(),
        const SizedBox(
          width: Spacing.spacing10,
        ),
        Flexible(
          child: Text(
            'โอนผ่านบัญชีธนาคาร',
            style: paragraph2Style,
            overflow: TextOverflow.clip,
          ),
        )
      ],
    );
  }

  Widget _buildSellBankSelected(
    ConfirmOrderFormState? data,
    List<BankItemModel> bankData,
    UserBankAccountModel selectedBank,
  ) {
    return Visibility(
      visible: data!.mode == ExchangeMode.sell.name && bankData.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(top: Spacing.spacing20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    S.of(context).bankName,
                    style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
                  ),
                ),
                Row(
                  children: [
                    (bankData.isNotEmpty)
                        ? Image.asset(bankData[0].image)
                        : Container(),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      (selectedBank.bankName.isNotEmpty)
                          ? selectedBank.bankName
                          : '',
                      style: paragraph2Style,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    S.of(context).bankAccountName,
                    style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
                  ),
                ),
                Text(
                  (selectedBank.bankAccountName.isNotEmpty)
                      ? selectedBank.bankAccountName
                      : '',
                  style: paragraph2Style,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    S.of(context).bankNumber,
                    style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
                  ),
                ),
                Text(
                  (selectedBank.bankAccountNumber.isNotEmpty)
                      ? selectedBank.bankAccountNumber
                      : '',
                  style: paragraph2Style,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHowToPay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).howtoPay,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        StreamBuilder<ConfirmOrderFormState>(
          stream: viewModel.formState,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) return const Text('');
            if (snapshot.data!.totalAmount > 2000000) {
              return _buildBankTransaferText();
            }
            return _buildQrPromptPayText();
          },
        ),
      ],
    );
  }

  Widget _buildBankSelected() {
    return InkWell(
      onTap: () {
        viewModel.selectBankAccount();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StreamBuilder<ConfirmOrderFormState>(
            stream: viewModel.formState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return const Text('');
              return Text(
                (snapshot.data!.mode == ExchangeMode.buy.name)
                    ? S.of(context).confirmOrderBankAccountTransansferLabel
                    : S.of(context).recievedAccount,
                style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
              );
            },
          ),
          StreamBuilder<ConfirmOrderFormState>(
            stream: viewModel.formState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return const Text('');
              if (snapshot.data!.selectedBank.bankAccountNumber.isEmpty) {
                return Row(
                  children: [
                    Text(
                      S.of(context).selectBankRecievedSelectPlaceholder,
                      style: paragraph2Style,
                    ),
                    const SizedBox(
                      width: Spacing.spacing10,
                    ),
                    Assets.icons.arrowRight.image(),
                  ],
                );
              }
              final bankData = BankData.bankList
                  .where((e) => e.code == snapshot.data!.selectedBank.bankCode)
                  .first;
              return Row(
                children: [
                  // Text(
                  //   snapshot.data!.selectedBank.bankCode.toUpperCase(),
                  //   style: paragraph2Style,
                  // ),
                  Image.asset(bankData.image, width: 24, height: 24),
                  const SizedBox(
                    width: Spacing.spacing10,
                  ),
                  Text(
                    snapshot.data!.selectedBank.bankAccountNumber,
                    style: paragraph2Style,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCouponSelect() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).couponLabel,
            style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).couponPlaceholder,
                style: paragraph2Style,
              ),
              const SizedBox(
                width: 10,
              ),
              Assets.icons.arrowRight.image()
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildBuyBankSelected() {
  //   return
  // }
}
