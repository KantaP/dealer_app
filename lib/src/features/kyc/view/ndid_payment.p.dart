import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/ndid_payment.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_payment.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/currency.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/gasta_wallet.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/qr_image.dart';
import 'package:aconnec_1109_x/src/widgets/segment_item.dart';

class NdidPaymentView extends CustomView<NdidPaymentViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const NdidPaymentView(this.kycLevel2ViewModel,
      {required NdidPaymentViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<NdidPaymentView, NdidPaymentViewModel> createState() =>
      _NdidPaymentViewState(viewModel);
}

class _NdidPaymentViewState
    extends ViewState<NdidPaymentView, NdidPaymentViewModel> {
  _NdidPaymentViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
  }

  @override
  void didPush() {
    super.didPush();
    Future.delayed(const Duration(milliseconds: 500), () {
      viewModel.countdownStart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildQrForSave(),
        Container(
          color: whiteColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HilightText(
                  text: S.current.ndidPaymentHeadline,
                  hilightStyle: headline4BoldStyle?.merge(
                    const TextStyle(color: blueColor),
                  ),
                  normalStyle: headline4LightStyle,
                ),
                //Warning Text
                StreamBuilder<NdidPaymentPageState>(
                  stream: viewModel.state,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return Visibility(
                      visible: snapshot.data?.qrData != null,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: _buildWarning(),
                      ),
                    );
                  },
                ),
                //Status
                // Padding(
                //   padding: const EdgeInsets.only(top: 20.0),
                //   child: _buildStatus(),
                // ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Divider(
                    color: midGreyColor,
                  ),
                ),
                StreamBuilder<NdidPaymentPageState>(
                  stream: viewModel.state,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: (snapshot.data!.paymentSelectedIndex == 0)
                            ? _buildQrCodeItems()
                            : _buildGastaItems(),
                      );
                    }
                    return Container();
                  },
                ),
                SizedBox(
                  height: paddingBottom(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSegments() {
    return Container(
      decoration: BoxDecoration(
        color: lightGrey1Color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              child: StreamBuilder<NdidPaymentPageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  return SegmentItem(
                    onTap: () {
                      viewModel.updateState(
                        {NdidPaymentPageStateFields.paymentSelectedIndex: 0},
                      );
                    },
                    active: (snapshot.data?.paymentSelectedIndex == 0),
                    title: S.of(context).qrPromptpayText,
                  );
                },
              ),
            ),
            Expanded(
              child: StreamBuilder<NdidPaymentPageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  return SegmentItem(
                    onTap: () {
                      viewModel.updateState(
                        {NdidPaymentPageStateFields.paymentSelectedIndex: 1},
                      );
                    },
                    active: (snapshot.data?.paymentSelectedIndex == 1),
                    title: S.of(context).gastaPaymentText,
                    icon: SvgPicture.asset(AssetSvg.gasta),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWarning() {
    return Container(
      decoration: BoxDecoration(
          color: blueColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            SvgPicture.asset(AssetSvg.clock),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<NdidPaymentTimerState>(
                      stream: viewModel.timerState,
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) return Container();
                        return HilightText(
                          text:
                              '${S.current.paymentWarning1Text} %${DateTimeUtils.durationFormatMinuteSecond(snapshot.data?.countdown ?? const Duration())}%',
                          hilightStyle: paragraph2MediumStyle?.merge(
                            const TextStyle(color: blueColor),
                          ),
                          normalStyle:
                              paragraph1LightStyle?.copyWith(color: blueColor),
                        );
                      }),
                  const SizedBox(
                    height: Spacing.spacing10,
                  ),
                  StreamBuilder<NdidPaymentPageState>(
                    stream: viewModel.state,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      return Text(
                        '${S.of(context).dueText} ${DateTimeUtils.dateTimeFormat(viewModel.expireAt, 'dd-MM-yyyy HH:mm')}',
                        style: paragraph3Style?.copyWith(
                            color: darkBlueColor.withOpacity(0.5)),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).paymentStatusText,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.circle,
              color: yellowColor,
              size: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              S.of(context).paymentPendingText,
              style: paragraph1LightStyle,
            )
          ],
        )
      ],
    );
  }

  Widget _buildAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).paymentYouWillPayText,
          style: titlePageStyle?.copyWith(color: darkGreyColor),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              CurrencyUtils.toTHB(150),
              style: titlePageStyle?.copyWith(color: blueColor),
            )
          ],
        )
      ],
    );
  }

  Widget _buildPromptPayQrCode() {
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
                      StreamBuilder<NdidPaymentPageState>(
                        stream: viewModel.state,
                        builder: (_, snapshot) {
                          if (snapshot.hasData == false) return Container();

                          if (snapshot.data!.qrData.isEmpty) {
                            // print(snapshot.data!.content);
                            return Center(
                              child: GestureDetector(
                                onTap: () {
                                  viewModel.countdownStart();
                                },
                                child: const Icon(Icons.refresh),
                              ),
                            );
                          }
                          return SizedBox(
                            height: 232,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Assets.images.propmtPay.image(height: 20),
                                  const SizedBox(
                                    height: Spacing.spacing20,
                                  ),
                                  QrCustomImage(
                                      size: 150, data: snapshot.data!.qrData)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: Spacing.spacing10,
                      ),
                      Text(
                        S.of(context).dealerAconnect,
                        style: paragraph1RegularStyle,
                      ),
                      StreamBuilder<NdidPaymentPageState>(
                          stream: viewModel.state,
                          builder: (context, snapshot) {
                            if (snapshot.hasData == false) return Container();
                            return Text(
                              'Ref No. ${snapshot.data!.refNo}',
                              style: paragraph2LightStyle?.copyWith(
                                  color: darkGreyColor),
                            );
                          }),
                      HilightText(
                        text: '${S.current.paymentAmountText} %130% บาท',
                        hilightStyle: headline4BoldStyle?.merge(
                          const TextStyle(color: blueColor),
                        ),
                        normalStyle: titleStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Assets.svgImages.downloadButton.svg(),
                      onPressed: () {
                        viewModel.exportQrCode();
                      },
                    ),
                    // SvgPicture.asset(AssetSvg.downloadButton),
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

  Widget _buildPropmtPayWarning() {
    return HilightText(
      text: S.current.paymentWarning2Text,
      hilightStyle: paragraph2MediumStyle,
      normalStyle: paragraph2LightStyle,
    );
  }

  List<Widget> _buildQrCodeItems() {
    return [
      //Client will pay
      // Padding(
      //   padding: const EdgeInsets.only(top: 20.0),
      //   child: _buildAmount(),
      // ),
      //if select pp qrcode
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: _buildPromptPayQrCode(),
      ),
      //if select pp qrcode
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).ndidPaymentChannelLabel,
              style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.svgImages.propmtpay.svg(),
                Text(
                  S.of(context).qrPromptpayText,
                  style: paragraph1LightStyle,
                )
              ],
            )
          ],
        ),
      ),

      //if select pp qrcode
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: outlineAlertButtonStyle,
            onPressed: () {
              viewModel.promptpayCancelAlert(context);
            },
            child: Text(
              S.current.paymentCancellationButton,
              style: textInButtonStyle?.copyWith(color: redColor),
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildGastaItems() {
    return [
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: _buildaconnec_1109_x(),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: _buildGastaAmount(),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: _buildAddressName(),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: _buildNdidServiceFee(),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: _buildTransferFee(),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: _buildNetworkFee(),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: _buildPromotion(),
      ),
      const Padding(
        padding: EdgeInsets.only(
          top: 20.0,
        ),
        child: Divider(
          color: midGreyColor,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: _buildTotalAmount(),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              viewModel.paymentConfirmationAlert(context);
            },
            child: Text(
              S.current.paymentPaynowButtonText,
              style: textInButtonStyle?.copyWith(color: whiteColor),
            ),
          ),
        ),
      ),
    ];
  }

  Widget _buildaconnec_1109_x() {
    return const GastaWallet();
  }

  Widget _buildGastaAmount() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: blueColor.withOpacity(0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'NTV of GASTH',
              style: paragraph1LightStyle,
            ),
            Text(
              CurrencyUtils.toTHB(1),
              style: paragraph1LightStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAddressName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).paymentGastaAddressNameText,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Text(
          S.of(context).dealerAconnect,
          style: paragraph1LightStyle,
        )
      ],
    );
  }

  Widget _buildNdidServiceFee() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).paymentNdidServiceFeeText,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Text(
          '140.000000 GASTH',
          style: paragraph1LightStyle,
        )
      ],
    );
  }

  Widget _buildTransferFee() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).paymentTransferFeeText,
              style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
            ),
            Text(
              '0.420000 GASTH',
              style: paragraph1LightStyle,
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AssetSvg.paymentInfo),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                S.of(context).paymentTransferFeeWarningText,
                style: noticeText?.copyWith(color: midGreyColor),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildNetworkFee() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).paymentNetworkFeeText,
              style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
            ),
            Text(
              '0.500000 GASTH',
              style: paragraph1LightStyle,
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AssetSvg.paymentInfo),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                S.of(context).paymentNetworkFeeWarningText,
                style: noticeText?.copyWith(color: midGreyColor),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildPromotion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).paymentPromotionText,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Text(
          '-35.230000 GASTH',
          style: paragraph1LightStyle,
        )
      ],
    );
  }

  Widget _buildTotalAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).paymentTotalAmount,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Text(
          '105.690000 GASTH',
          style: paragraph1LightStyle,
        )
      ],
    );
  }

  Widget _buildQrForSave() {
    return RepaintBoundary(
      key: viewModel.slipForSaveKey,
      child: CustomStreamBuilder(
        stream: viewModel.state,
        builder: (_, snapshot) => Container(
          color: whiteColor,
          // height: 232,
          child: Padding(
            padding: const EdgeInsets.all(Spacing.spacing24),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.propmtPay.image(height: 20),
                  const SizedBox(
                    height: Spacing.spacing20,
                  ),
                  QrCustomImage(
                    size: MediaQuery.of(context).size.width,
                    data: snapshot.data?.qrData ?? '',
                  ),
                  const SizedBox(
                    height: Spacing.spacing10,
                  ),
                  Text(
                    S.of(context).dealerAconnect,
                    style: paragraph1RegularStyle,
                  ),
                  Text(
                    'Ref No. ${snapshot.data!.refNo}',
                    style: paragraph2LightStyle?.copyWith(color: darkGreyColor),
                  ),
                  HilightText(
                    text: '${S.current.paymentAmountText} %130% บาท',
                    hilightStyle: headline4BoldStyle?.merge(
                      const TextStyle(color: blueColor),
                    ),
                    normalStyle: titleStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
