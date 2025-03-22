import 'dart:convert';

import 'package:aconnec_1109_x/src/constants/banks.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/payment.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bank_function/bay_qr_request.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/bank_account_value.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:aconnec_1109_x/src/widgets/timer_warning_text.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/utilities/prompt_pay_qr_code/prompt_pay_qr_code.dart';
import 'package:aconnec_1109_x/src/widgets/utilities/prompt_pay_qr_code/prompt_pay_qr_code_static.dart';
import 'package:aconnec_1109_x/src/widgets/warning_text_box.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/company_data.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_payment.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/waiting_payment.vm.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/widget/confirm_order_detail_card.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/currency.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dotted_container.dart';
import 'package:aconnec_1109_x/src/widgets/dotted_upload_result.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image_auth.dart';

import '../../../widgets/dotted_upload_preview.dart';

class WaitingPaymentView extends CustomView<WaitingPaymentViewModel> {
  final int idOrder;
  final String refCode;

  const WaitingPaymentView({
    required WaitingPaymentViewModel viewModel,
    super.key,
    required this.idOrder,
    required this.refCode,
  }) : super.model(viewModel);

  @override
  ViewState<WaitingPaymentView, WaitingPaymentViewModel> createState() =>
      _WaitingPaymentViewState(viewModel);
}

class _WaitingPaymentViewState
    extends ViewState<WaitingPaymentView, WaitingPaymentViewModel> {
  _WaitingPaymentViewState(super.viewModel);

  @override
  void initState() {
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
        CustomFuture(
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
          builder: (_, snapshot) {
            return _buildContent(snapshot.data!);
          },
        ),
        StreamBuilder<WaitingPaymentPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) return Container();
            return Visibility(
                visible: snapshot.data!.isLoading, child: const Loading());
          },
        ),
      ],
    );
  }

  Widget _buildTimerWarning(ResponseOrderFullModel? snapshot) {
    final expireTime = DateTime.parse(snapshot!.order!.datetimeCreate)
        .add(Duration(minutes: snapshot.order?.topayExpireTime ?? 0));
    return TimerWarningText(
      dateTimeExpire: expireTime,
      onExpire: () => viewModel.autoRecheck(widget.idOrder, widget.refCode),
    );
  }

  Widget _buildTransactionId(String refCode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).waitingPaymentTransactionIdLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Flexible(
          child: Text(
            refCode,
            style: paragraph1LightStyle,
            overflow: TextOverflow.clip,
          ),
        )
      ],
    );
  }

  Widget _buildHowToPay(double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).waitingPaymentHowtoPayLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Row(
          children: [
            (amount > 2000000)
                ? Image.asset(PaymentStaticValue.payments[2].icon)
                : Image.asset(PaymentStaticValue.payments[0].icon),
            const SizedBox(
              width: 5,
            ),
            Text(
              (amount > 2000000)
                  ? PaymentStaticValue.payments[2].label
                  : PaymentStaticValue.payments[0].label,
              style: paragraph1LightStyle,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildStatus(String status) {
    String statusString = '';
    if (status == 'init') {
      statusString = 'รอชำระเงิน';
    } else if (status == 'customer_paid') {
      statusString = 'กำลังตรวจสอบ';
    } else if (status == 'complete') {
      statusString = 'ตรวจสอบเสร็จสิ้น';
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

  Widget _buildTransactionInformation({
    required double fiatAmount,
    required double digitalAssetAmount,
    required String listPair,
    required double networkFee,
    required double baseCurrentPrice,
  }) {
    final symbols = listPair.split('/');
    final base = symbols[0];
    return ExpandableNotifier(
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
                      S.of(context).buy,
                      style:
                          paragraph1RegularStyle?.copyWith(color: greenColor),
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
                      image: Image.asset(AssetIcons.baht40),
                      amount: fiatAmount.toCurrency(),
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
                          fileName: '$base.png',
                        ),
                      ),
                      amount: digitalAssetAmount.toApproxUom(''),
                      currency: base,
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
                      S.of(context).confirmOrderPurchaseLabel,
                      style:
                          paragraph1LightStyle?.copyWith(color: darkGreyColor),
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       S.of(context).transactionFee,
                //       style:
                //           paragraph1LightStyle?.copyWith(color: darkGreyColor),
                //     ),
                //     Text(
                //       0.00.toThb(),
                //       style: paragraph1LightStyle,
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: Spacing.spacing10,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).paymentNetworkFeeText,
                      style:
                          paragraph1LightStyle?.copyWith(color: darkGreyColor),
                    ),
                    Text(
                      networkFee.toApproxUom(base),
                      style: paragraph1LightStyle,
                    )
                  ],
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPay({
    required double fiatAmount,
    required double digitalAssetAmount,
    required String listedPair,
  }) {
    final split = listedPair.split('/');
    final base = split[0];
    return Column(
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
            Text(
              fiatAmount.toThb(),
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
              style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
            ),
            Text(
              digitalAssetAmount.toApproxUom(base),
              style: paragraph1LightStyle,
            )
          ],
        ),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        WarningTextBox(text: S.of(context).coinAmountWarningText),
        const SizedBox(
          height: Spacing.spacing20,
        )
      ],
    );
  }

  Widget _buildBankCautionBox(String bankAccountNo) {
    //convert bankaccount to json
    final decode = jsonDecode(bankAccountNo);
    final BankAccountValueModel bankData =
        BankAccountValueModel.fromJson(decode);
    return WarningTextBox(
      text:
          '''${S.of(context).waitingPaymentCriticalHint1}\n${S.of(context).waitingPaymentCriticalHint2.replaceAll('%bankName%', 'ธนาคาร ${bankData.bankName}').replaceAll('%bankNumber%', bankData.bankAccountNo)}\n${S.of(context).waitingPaymentCriticalHint3}''',
    );
  }

  Widget _buildPromptPayQrCode(String ref, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: midGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomFuture(
                        future: viewModel.checkPurefiat(),
                        customLoading: Container(),
                        builder: (_, purefiat) {
                          if (purefiat.data!.refcode.isEmpty) {
                            return PromptPayQrCodeView(
                              data: BayQrRequestModel(
                                ref1: ref,
                                amount: amount.toStringAsFixed(2),
                                type: QrPaymentType.trxfiat.name,
                                terminalId: PureFiatType.trxfiat.name,
                              ),
                            );
                          } else {
                            return PromptPayQrCodeStatic(
                              qrData: purefiat.data!.paymentQrData,
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: Spacing.spacing10,
                      ),
                      Text(
                        S.of(context).dealerAconnect,
                        style: paragraph1RegularStyle,
                      ),
                      // Text(
                      //   '${S.of(context).waitingPaymentTransactionIdLabel}: $ref',
                      //   style: paragraph2LightStyle?.copyWith(
                      //     color: darkGreyColor,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      HilightText(
                        text:
                            // '${S.current.paymentAmountText} %${snapshot.data?.transactionDetail.total ?? '0'}% บาท',
                            '%${CurrencyUtils.toTHB(amount)}%',
                        hilightStyle: headline4BoldStyle?.merge(
                          const TextStyle(color: blueColor),
                        ),
                        normalStyle: titleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        viewModel.qrSave(widget.refCode);
                      },
                      child: Assets.svgImages.downloadButton.svg(),
                    ),
                    // const SizedBox(
                    //   height: Spacing.spacing10,
                    // ),
                    // SvgPicture.asset(AssetSvg.shareButton),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).waitingPaymentNoteLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        StreamBuilder<WaitingPaymentPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) return Container();
            return Text(
              snapshot.data!.transactionDetail.note.isEmpty
                  ? '-'
                  : snapshot.data!.transactionDetail.note,
              style: paragraph2LightStyle,
            );
          },
        )
      ],
    );
  }

  Widget _buildButtons() {
    return Column(
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
      ],
    );
  }

  Widget _buildBankDetail() {
    final bankData = BankData.bankList
        .where((e) => e.code == CompanyData.bankCode.toLowerCase())
        .first;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: whitePurpleColor)),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.spacing10),
        child: Row(
          children: [
            Image.asset(bankData.image, width: 50, height: 50),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${S.of(context).bankName}: ',
                        style: paragraph2LightStyle,
                      ),
                      TextSpan(
                        text: CompanyData.bankNameTh,
                        style: paragraph2Style,
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${S.of(context).bankAccountName}: ',
                        style: paragraph2LightStyle,
                      ),
                      TextSpan(
                        text: CompanyData.bankAccountNameTh,
                        style: paragraph2Style,
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${S.of(context).bankNumber}: ',
                        style: paragraph2LightStyle,
                      ),
                      TextSpan(
                        text: CompanyData.bankAccountNumber,
                        style: paragraph2Style,
                      )
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: InkWell(
                onTap: () {
                  viewModel.copyBankAccountNumberToClipboard();
                },
                child: Image.asset(AssetIcons.copy24),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSlip() {
    return StreamBuilder<WaitingPaymentUploadSlipFormState>(
      stream: viewModel.formState,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        return CustomDottedContainer(
          onTapUpload: () {
            viewModel.onSelectSlip();
          },
          uploadPlaceholder: S.of(context).uploadSlip,
          content: (snapshot.data!.slipPath.isNotEmpty)
              ? DottedUploadResult(
                  imagePath: snapshot.data!.slipPath,
                  onRemove: () {
                    viewModel.onRemoveSlip();
                  },
                )
              : null,
        );
      },
    );
  }

  Widget _buildPreviewSlip() {
    return StreamBuilder<WaitingPaymentPageState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        final fileName = 'slip_payment_${widget.refCode}';

        return CustomDottedContainer(
          onTapUpload: () {
            viewModel.onSelectSlip();
          },
          uploadPlaceholder: S.of(context).uploadSlip,
          content: (snapshot.data!.slipUploaded)
              ? DottedUploadPreview(
                  image: StorageImageAuth(
                    storagePath: FirebaseStorageValue.slipPaymentRef,
                    fileName: fileName,
                  ),
                )
              : null,
        );
      },
    );
  }

  Widget _buildSlipHint() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        S.of(context).uploadSlipHint,
        style: paragraph2Style?.copyWith(color: hintTextColor),
      ),
    );
  }

  Widget _buildSlipSubmitButton() {
    return StreamBuilder<WaitingPaymentPageState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        return Visibility(
          visible: snapshot.data!.slipUploaded == false,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: StreamBuilder<WaitingPaymentUploadSlipFormState>(
              stream: viewModel.formState,
              builder: (context, snapshot) {
                if (snapshot.hasData == false) return Container();
                return ElevatedButton(
                  onPressed: (snapshot.data!.slipPath.isEmpty)
                      ? null
                      : () {
                          viewModel.uploadSlip(widget.idOrder, widget.refCode);
                        },
                  child: Text(S.of(context).uploadSlipSubmitButton),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return DefaultAppBar(
      pinned: true,
      title: S.of(context).waitingPaymentTitle,
      centerTitle: true,
    );
  }

  Widget _buildCheckTimer(ResponseOrderFullModel? snapshot) {
    final trxFiat = snapshot!.trxfiat;
    if (trxFiat != null) {
      if (trxFiat.status == 'init') {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
          sliver: SliverToBoxAdapter(
            child: _buildTimerWarning(snapshot),
          ),
        );
      }
    }
    return const SliverToBoxAdapter();
  }

  Widget _buildContent(ResponseOrderFullModel data) {
    return WillPopScope(
      onWillPop: () => viewModel.goToHistory(),
      child: DefaultLayout(
        appBar: _buildAppBar(),
        slivers: [
          CustomStreamBuilder(
            stream: viewModel.orderState,
            builder: (_, snapshot) =>
                _buildCheckTimer(snapshot.data!.orderFull),
            silver: true,
          ),
          const SliverPadding(padding: EdgeInsets.only(top: Spacing.spacing20)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: SliverToBoxAdapter(
              child: (data.order!.orderValueFiatSet! > 2000000)
                  ? _buildBankDetail()
                  : RepaintBoundary(
                      key: viewModel.qrSaveKey,
                      child: _buildPromptPayQrCode(
                        data.order!.refCode!,
                        data.order!.orderValueFiatSet!.toDouble(),
                      ),
                    ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: SliverToBoxAdapter(
              child: _buildBankCautionBox(data.order!.bankAccountNo ?? ''),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: SliverToBoxAdapter(
              child: _buildTransactionId(data.order!.refCode!),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: SliverToBoxAdapter(
              child: _buildHowToPay(data.order!.orderValueFiatSet!.toDouble()),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: SliverToBoxAdapter(
              child: CustomStreamBuilder(
                stream: viewModel.orderState,
                builder: (_, orderSnapshot) => _buildStatus(
                    orderSnapshot.data!.orderFull.trxfiat?.status ?? ''),
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          const SliverToBoxAdapter(
            child: Divider(color: midGreyColor),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: SliverToBoxAdapter(
              child: _buildTransactionInformation(
                fiatAmount: data.order?.orderValueFiatSet ?? 0.00,
                digitalAssetAmount: data.order?.orderValueCryptoSet ?? 0.00,
                listPair: data.order?.listedPair ?? '',
                networkFee: data.order?.digitalAssetFeeSet ?? 0.00,
                baseCurrentPrice: data.order?.digitalAssetPriceSet ?? 0.00,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: SliverToBoxAdapter(
              child: _buildTotalPay(
                fiatAmount: data.order?.orderValueFiatSet ?? 0.00,
                digitalAssetAmount: data.order?.orderValueCryptoSet ?? 0.00,
                listedPair: data.order?.listedPair ?? '',
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: SliverToBoxAdapter(
              child: Visibility(
                visible: data.order!.orderValueFiatSet! > 2000000,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StreamBuilder<WaitingPaymentPageState>(
                          stream: viewModel.state,
                          builder: (_, snapshot) {
                            if (snapshot.hasData == false) return Container();
                            if (snapshot.data!.slipUploaded == true) {
                              return _buildPreviewSlip();
                            }
                            if (snapshot.data!.slipUploaded == false) {
                              return _buildUploadSlip();
                            }
                            return Container();
                          }),
                      _buildSlipHint(),
                      _buildSlipSubmitButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 30)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            sliver: SliverToBoxAdapter(
              child: _buildButtons(),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 30))
        ],
        physics: const BouncingScrollPhysics(),
        extendBody: true,
      ),
    );
  }
}
