import 'dart:convert';

import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_receive_coin.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/waiting_receive_coin.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/confirm_order_detail_card.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/share_deposit_address_slip.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bitgo/get_deposit_wallet.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/bank_account_value.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxdigitalasset_function/trxdigitalasset_get.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:aconnec_1109_x/src/widgets/qr_image.dart';
import 'package:aconnec_1109_x/src/widgets/sliver_space.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:aconnec_1109_x/src/widgets/timer_warning_text.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/warning_text_box.dart';
import 'package:aconnec_1109_x/src/widgets/warning_text_box_custom.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class WaitingReceiveCoinView extends CustomView<WaitingReceiveCoinViewModel> {
  final int idOrder;
  final String refCode;

  const WaitingReceiveCoinView({
    super.key,
    required WaitingReceiveCoinViewModel viewModel,
    required this.idOrder,
    required this.refCode,
  }) : super.model(viewModel);

  @override
  ViewState<WaitingReceiveCoinView, WaitingReceiveCoinViewModel>
      createState() => _WaitingReceiveCoinViewState(viewModel);
}

class _WaitingReceiveCoinViewState
    extends ViewState<WaitingReceiveCoinView, WaitingReceiveCoinViewModel> {
  _WaitingReceiveCoinViewState(super.viewModel);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.intervalCheckOrder(widget.idOrder, widget.refCode);
  }

  @override
  void didPushNext() {
    super.didPushNext();
    viewModel.cancelCheckOrder();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    viewModel.intervalCheckOrder(widget.idOrder, widget.refCode);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildShareLayout(),
        CustomFuture(
          future: viewModel.getOrder(widget.idOrder, widget.refCode),
          customLoading: _buildLoadingContent(),
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
          builder: (_, snapshot) {
            return _buildMainContent(snapshot);
          },
        ),
      ],
    );
  }

  Widget _buildCheckTimer(ResponseOrderFullModel? snapshot) {
    final trxDigitalasset =
        snapshot?.trxdigitalasset ?? const ResponseTrxDigitalAssetGetModel();
    if (trxDigitalasset.status == 'customer_wait') {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
        sliver: SliverToBoxAdapter(
          child: _buildTimerWarning(snapshot!),
        ),
      );
    }
    return const SliverToBoxAdapter();
  }

  Widget _buildTimerWarning(ResponseOrderFullModel data) {
    final expireTime = DateTime.parse(data.order!.datetimeCreate)
        .add(Duration(minutes: data.order?.topayExpireTime ?? 0));
    return TimerWarningText(
      dateTimeExpire: expireTime,
      onExpire: () => viewModel.autoRecheck(widget.idOrder, widget.refCode),
    );
  }

  Widget _buildSelectAddress(AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    final symbols = snapshot.data!.order!.listedPair!.split('/');
    final base = symbols[0];
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
          border: Border.all(color: midGreyColor),
        ),
        padding: const EdgeInsets.all(Spacing.spacing20),
        child: Column(
          children: <Widget>[
            _buildCoinName(baseSymbol: base),
            const SizedBox(
              height: Spacing.spacing18,
            ),
            // _buildSelectNetwork(),
            // const SizedBox(
            //   height: Spacing.spacing18,
            // ),
            // _buildEmptyReceiveAddressSection(),
            _buildReceiveAddressSection(snapshot),
          ],
        ),
      ),
    );
  }

  Widget _buildCoinName({required String baseSymbol}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
          border: Border.all(color: midGreyColor),
          color: lightGrey2Color),
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.spacing8,
        horizontal: Spacing.spacing10,
      ),
      child: Row(
        children: [
          //mock image
          SizedBox(
            width: 24,
            height: 24,
            child: StorageImage(
              storagePath: FirebaseStorageValue.coinRef,
              fileName: '$baseSymbol.png',
            ),
          ),
          const SizedBox(
            width: Spacing.spacing10,
          ),
          Text(
            baseSymbol,
            style: paragraph2Style,
          )
        ],
      ),
    );
  }

  Widget _buildSelectNetwork() {
    return GestureDetector(
      onTap: () {
        viewModel.gotoSelectNetwork();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).waitingReceiveCoinNetworkLabel,
            style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<WaitingReceiveCoinFormState>(
                stream: viewModel.formState,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  return Text(
                    (snapshot.data!.selectedNetwork.isNotEmpty)
                        ? snapshot.data!.selectedNetwork
                        : S.of(context).waitingReceiveCoinNetworkPlacholder,
                    style: paragraph2Style,
                  );
                },
              ),
              const SizedBox(
                width: 6,
              ),
              Assets.icons.arrowRight.image(height: 16)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTitleTotalPay({required String baseSymbol}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).waitingReceiveCoinTotalPayLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        StreamBuilder<WaitingReceiveCoinFormState>(
            stream: viewModel.formState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return Text(
                snapshot.data!.orderDetail!.order!.orderValueCryptoSet!
                    .toUom(baseSymbol),
                style: headline4BoldStyle?.copyWith(color: blueColor),
              );
            }),
      ],
    );
  }

  Widget _buildCreatedAddress() {
    return OutlinedButton(
      onPressed: () {
        viewModel.createAddress();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.svgImages.addAddress.svg(),
          const SizedBox(
            width: Spacing.spacing10,
          ),
          Text(
            S.of(context).waitingReceiveCoinAddAddressLabel,
            style: textInButtonStyle?.copyWith(color: blueColor),
          )
        ],
      ),
    );
  }

  Widget _buildWarningBox() {
    return SliverToBoxAdapter(
      child: WarningTextBoxCustom(
        child: Column(
          children: [
            Text(
              S.of(context).waitingReceiveCoinWarningTitle,
              style: paragraph2MediumStyle?.copyWith(color: yellowColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Spacing.spacing10,
            ),
            Text(
              S.of(context).waitingReceiveCoinWarningContent,
              style: paragraph2Style?.copyWith(color: yellowColor),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBankDetail() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  S.of(context).waitingReceiveCoinTransactionIdLabel,
                  style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
                ),
              ),
              Flexible(
                child: StreamBuilder<WaitingReceiveCoinFormState>(
                  stream: viewModel.formState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return Text(
                      snapshot.data!.orderDetail!.order?.refCode ?? '',
                      style: paragraph1LightStyle,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.right,
                    );
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          Text(
            S.of(context).waitingReceiveCoinBankDetailSection,
            style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  S.of(context).waitingReceiveCoinBankNameLabel,
                  style: paragraph2Style?.copyWith(color: darkGreyColor),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Assets.icons.kbankLogo50.image(width: 24, height: 24),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    StreamBuilder<WaitingReceiveCoinFormState>(
                      stream: viewModel.formState,
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) return Container();

                        try {
                          final decode = jsonDecode(snapshot
                              .data!.orderDetail!.order!.bankAccountNo!);
                          final bankAccount =
                              BankAccountValueModel.fromJson(decode);
                          return Text(
                            bankAccount.bankName,
                            style: paragraph1LightStyle,
                            overflow: TextOverflow.clip,
                          );
                        } catch (e) {
                          return Text(
                            'n/a',
                            style: paragraph1LightStyle,
                          );
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  S.of(context).waitingReceiveCoinBankOwnerNameLabel,
                  style: paragraph2Style?.copyWith(color: darkGreyColor),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StreamBuilder<WaitingReceiveCoinFormState>(
                      stream: viewModel.formState,
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) return Container();

                        try {
                          final decode = jsonDecode(snapshot
                              .data!.orderDetail!.order!.bankAccountNo!);
                          final bankAccount =
                              BankAccountValueModel.fromJson(decode);
                          return Text(
                            bankAccount.bankAccountName,
                            style: paragraph1LightStyle,
                            overflow: TextOverflow.clip,
                          );
                        } catch (e) {
                          return Text(
                            'n/a',
                            style: paragraph1LightStyle,
                          );
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  S.of(context).waitingReceiveCoinBankNumberLabel,
                  style: paragraph2Style?.copyWith(color: darkGreyColor),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StreamBuilder<WaitingReceiveCoinFormState>(
                      stream: viewModel.formState,
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) return Container();

                        try {
                          final decode = jsonDecode(snapshot
                              .data!.orderDetail!.order!.bankAccountNo!);
                          final bankAccount =
                              BankAccountValueModel.fromJson(decode);
                          return Text(
                            bankAccount.bankAccountNo,
                            style: paragraph1LightStyle,
                            overflow: TextOverflow.clip,
                          );
                        } catch (e) {
                          return Text(
                            'n/a',
                            style: paragraph1LightStyle,
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          CustomStreamBuilder(
            stream: viewModel.formState,
            builder: (_, snapshot) => _buildStatus(
                snapshot.data!.orderDetail?.trxdigitalasset?.status ?? ''),
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          const Divider(
            height: 1,
            color: midGreyColor,
          )
        ],
      ),
    );
  }

  Widget _buildTransactionInformation({
    required double fiatAmount,
    required double digitalAssetAmount,
    required String listPair,
    required double baseCurrentPrice,
  }) {
    final symbols = listPair.split('/');
    final base = symbols[0];
    final quote = symbols[1];
    return SliverToBoxAdapter(
      child: ExpandableNotifier(
        controller: viewModel.expandableController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expandable(
              collapsed: InkWell(
                onTap: () {
                  viewModel.expandableController.toggle();
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: Spacing.spacing20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).waitingPaymentTransactionSectorLabel,
                        style: titleStyle,
                      ),
                      Assets.svgImages.arrowUp.svg()
                    ],
                  ),
                ),
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      viewModel.expandableController.toggle();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).waitingPaymentTransactionSectorLabel,
                          style: titleStyle,
                        ),
                        Assets.svgImages.arrowDown.svg()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Spacing.spacing20,
                  ),
                  Row(
                    children: [
                      Text(
                        S.of(context).sell,
                        style:
                            paragraph1RegularStyle?.copyWith(color: redColor),
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
                      )
                    ],
                  ),
                  const SizedBox(
                    height: Spacing.spacing20,
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
                        amount: digitalAssetAmount.toUom(''),
                        currency: base,
                      ),
                      Image.asset(AssetIcons.arrowRight24),
                      ConfirmOrderDetailCard(
                        label: S.of(context).recieve,
                        image: Image.asset(AssetIcons.baht40),
                        amount: fiatAmount.toApprox(),
                        currency: quote,
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
                        fiatAmount.toThb(),
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
                  // Visibility(
                  //   visible: true,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         S.of(context).paymentNetworkFeeText,
                  //         style: paragraph1LightStyle?.copyWith(
                  //             color: darkGreyColor),
                  //       ),
                  //       Text(
                  //         CurrencyUtils.toTHB(0),
                  //         style: paragraph1LightStyle,
                  //       )
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: Spacing.spacing10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoinAmountWarning() {
    return SliverToBoxAdapter(
        child: WarningTextBox(text: S.of(context).coinAmountWarningText));
  }

  Widget _buildInputTxtId() {
    return SliverToBoxAdapter(
      child: DottedBorder(
        color: darkGreyColor,
        dashPattern: const [8, 4],
        borderPadding: const EdgeInsets.all(2),
        radius: const Radius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Spacing.spacing10, vertical: Spacing.spacing24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const IntrinsicWidth(
                  child: CustomTextField(
                    outline: false,
                    label: '',
                    placeholder: 'เมื่อโอนเหรียญแล้ว ให้ใส่ TX ID ที่นี่',
                    maxLines: 1,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ระบุหมายเลข TX ID / TX ID Link'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton(
            style: outlineAlertButtonStyle,
            onPressed: () {
              viewModel.goToCancelOrder(widget.idOrder, widget.refCode);
            },
            child: Text(
              S.of(context).cancelOrderButton,
            ),
          ),
          // const SizedBox(
          //   height: Spacing.spacing20,
          // ),
          // Center(
          //   child: GestureDetector(
          //     onTap: () {
          //       viewModel.backToHome();
          //     },
          //     child: Text(S.of(context).backtoHomeButton),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Widget _buildEmptyReceiveAddressSection() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       _buildTitleTotalPay(),
  //       const SizedBox(
  //         height: Spacing.spacing18,
  //       ),
  //       _buildCreatedAddress()
  //     ],
  //   );
  // }

  Widget _buildReceiveAddressSection(
      AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildReceiveAddressQrCode(snapshot),

        // const SizedBox(
        //   height: Spacing.spacing18,
        // ),
        // _buildShareDetail()
      ],
    );
  }

  Widget _buildReceiveAddressQrCode(
      AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    final symbols = snapshot.data!.order!.listedPair!.split('/');
    final base = symbols[0];
    return CustomFuture(
      future: viewModel.loadDepositAddress(
          request: RequestGetDepositWalletModel(
              digitalAssetSymbol: base.toLowerCase())),
      customLoading: const SizedBox(
        height: 232,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      builder: (_, snapshot) {
        return Column(
          children: [
            SizedBox(
              height: 232,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QrCustomImage(
                      size: 150,
                      data: snapshot.data?.depositAddress ?? '',
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: Spacing.spacing18,
            ),
            _buildTitleTotalPay(baseSymbol: base),
            const SizedBox(
              height: Spacing.spacing18,
            ),
            _buildReceiveAddress(snapshot.data?.depositAddress ?? 'n/a'),
          ],
        );
      },
    );
    // return DepositWalletAddressQrCode(
    //   viewModel: getIt<DepositWalletAddressQrCodeViewModel>(),
    //   request: const RequestGetDepositWalletModel(digitalAssetSymbol: 'tbtc'),
    // );
  }

  Widget _buildShareDetail() {
    return OutlinedButton(
      onPressed: () {
        viewModel.shareDepositAddress();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.svgImages.share.svg(color: blueColor),
          const SizedBox(
            width: Spacing.spacing10,
          ),
          Text(
            S.of(context).waitingReceiveCoinShareDetailLabel,
            style: textInButtonStyle?.copyWith(color: blueColor),
          )
        ],
      ),
    );
  }

  Widget _buildReceiveAddress(String address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).waitingReceiveCoinDepositAddressLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                address,
                style: paragraph2LightStyle,
                overflow: TextOverflow.clip,
              ),
            ),
            const SizedBox(width: Spacing.spacing4),
            _buildCopyAddressButton(address)
          ],
        )
      ],
    );
  }

  Widget _buildCopyAddressButton(String address) {
    return GestureDetector(
      onTap: () {
        viewModel.copyAddressToClipboard(address);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusSet.radius16),
          color: lightGrey1Color,
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacing12, vertical: Spacing.spacing10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.icons.copy24.image(),
            const SizedBox(
              width: Spacing.spacing10,
            ),
            Text(
              'Copy',
              style: paragraph2Style,
            )
          ],
        ),
      ),
    );
  }

  _buildShareLayout() {
    return RepaintBoundary(
      key: viewModel.shareKey,
      child: const ShareDepositAddressSlip(),
    );
  }

  Widget _buildAppBar() {
    return DefaultAppBar(
      pinned: true,
      title: S.of(context).waitingPaymentTitle,
      centerTitle: true,
    );
  }

  Widget _buildLoadingContent() {
    return DefaultLayout(
      appBar: _buildAppBar(),
      slivers: const [
        SliverFillRemaining(
          child: Loading(),
        )
      ],
      extendBody: false,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildMainContent(AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    return WillPopScope(
      onWillPop: () => viewModel.goToHistory(),
      child: DefaultLayout(
        appBar: _buildAppBar(),
        slivers: [
          const SliverSpace(
            height: Spacing.spacing10,
          ),
          CustomStreamBuilder(
            stream: viewModel.formState,
            builder: (_, snapshot) {
              if (snapshot.hasData == false) return Container();
              return _buildCheckTimer(
                  snapshot.data!.orderDetail ?? ResponseOrderFullModel());
            },
            silver: true,
          ),
          const SliverSpace(
            height: Spacing.spacing20,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: _buildSelectAddress(snapshot),
          ),
          const SliverSpace(
            height: Spacing.spacing20,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: _buildBankDetail(),
          ),
          const SliverSpace(
            height: Spacing.spacing20,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: _buildTransactionInformation(
              fiatAmount: snapshot.data!.order?.orderValueFiatSet ?? 0.00,
              digitalAssetAmount:
                  snapshot.data!.order?.orderValueCryptoSet ?? 0.00,
              listPair: snapshot.data!.order?.listedPair ?? '',
              baseCurrentPrice:
                  snapshot.data!.order?.digitalAssetPriceSet ?? 0.00,
            ),
          ),
          _buildTransactionInformationTotal(snapshot),
          const SliverSpace(
            height: Spacing.spacing20,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: _buildCoinAmountWarning(),
          ),
          const SliverSpace(
            height: Spacing.spacing20,
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
          //   sliver: _buildInputTxtId(),
          // ),
          // const SliverSpace(
          //   height: Spacing.spacing20,
          // ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: _buildButtons(),
          ),
        ],
        physics: const BouncingScrollPhysics(),
        extendBody: true,
        safeAreaBottom: true,
      ),
    );
  }

  Widget _buildTransactionInformationTotal(
      AsyncSnapshot<ResponseOrderFullModel?> snapshot) {
    final symbols = snapshot.data!.order!.listedPair!.split('/');
    final base = symbols[0];
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
                ),
                StreamBuilder<WaitingReceiveCoinFormState>(
                  stream: viewModel.formState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return Text(
                      snapshot.data!.orderDetail!.order!.orderValueCryptoSet!
                          .toUom(base),
                      style: paragraph1LightStyle,
                    );
                  },
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
                  style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
                ),
                StreamBuilder<WaitingReceiveCoinFormState>(
                  stream: viewModel.formState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return Text(
                      snapshot.data!.orderDetail!.order!.orderValueFiatSet!
                          .toApproxThb(),
                      style: paragraph1LightStyle,
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: Spacing.spacing20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatus(String status) {
    String statusString = status;
    if (status == 'customer_paid') {
      statusString = 'กำลังตรวจสอบ';
    } else if (status == 'completed') {
      statusString = 'ตรวจสอบเสร็จสิ้น';
    } else if (status == 'customer_wait') {
      statusString = 'รอการโอนสินทรัพย์';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).waitingPaymentStatusLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: Spacing.spacing10,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: yellowColor),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              statusString,
              style: paragraph1LightStyle,
            ),
          ],
        )
      ],
    );
  }
}
