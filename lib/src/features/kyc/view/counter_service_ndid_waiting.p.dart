import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/aconnec_ndid_waiting.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/counter_service_ndid_waiting.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/qr_image.dart';
import 'package:flutter/material.dart';

import '../../../core/navigator_service.dart';

class CounterServiceNdidWaitingView
    extends CustomView<CounterServiceNdidWaitingViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;
  const CounterServiceNdidWaitingView(this.kycLevel2ViewModel,
      {super.key, required CounterServiceNdidWaitingViewModel viewModel})
      : super.model(viewModel);

  @override
  ViewState<CounterServiceNdidWaitingView, CounterServiceNdidWaitingViewModel>
      createState() => _CounterServiceWaitingViewState(viewModel);
}

class _CounterServiceWaitingViewState extends ViewState<
    CounterServiceNdidWaitingView, CounterServiceNdidWaitingViewModel> {
  _CounterServiceWaitingViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
    viewModel.setContext(context);
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.onValueRefResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HilightText(
                  text: S.of(context).ndidAconnecWaitingHeadline,
                  hilightStyle: headline4BoldStyle?.merge(
                    const TextStyle(color: blueColor),
                  ),
                  normalStyle: headline4LightStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    S.of(context).ndidAconnecWaitingContent,
                    style:
                        paragraph1RegularStyle?.copyWith(color: darkGreyColor),
                  ),
                ),
                // const SizedBox(
                //   height: Spacing.spacing20,
                // ),
                StreamBuilder<AconnecNdidWatingPageState>(
                  stream: viewModel.state,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return Text(
                      S.of(context).ndidAconnectWaitingRef.replaceAll(
                          '@value', snapshot.data!.ndidRefResponse.refId),
                      style: paragraph1RegularStyle,
                    );
                  },
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20.0),
                //   child: _buildQrCode(),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildWarning(),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 20.0),
                //   child: Text(
                //     S.of(context).ndidAconnectWaitingWarning1,
                //     style: paragraph2LightStyle?.copyWith(color: darkGreyColor),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    S.of(context).ndidAconnectWaitingWarning2,
                    style: paragraph2LightStyle?.copyWith(color: darkGreyColor),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: outlineAlertButtonStyle,
              onPressed: () {
                viewModel.cancelDialogAlert();
              },
              child: Text(
                S.current.bankNdidCancellationButton,
                style: textInButtonStyle?.copyWith(color: redColor),
              ),
            ),
          ),
          SizedBox(
            height: paddingBottom(),
          )
        ],
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
            Assets.svgImages.clock.svg(),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<AconnecNdidTimerState>(
                    stream: viewModel.timerState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      return Text(
                        S.of(context).ndidAconnectWaitingQrWarning.replaceAll(
                              '@value',
                              DateTimeUtils.durationFormatHourMinuteSecond(
                                snapshot.data?.countdown ?? const Duration(),
                              ),
                            ),
                        style: paragraph2LightStyle?.copyWith(
                            color: darkBlueColor.withOpacity(0.5)),
                      );
                    },
                  ),
                  // Text(
                  //   S.current.ndidAconnectWaitingQrExpiredDate,
                  //   style: paragraph2MediumStyle?.merge(
                  //     const TextStyle(color: darkBlueColor),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrCode() {
    return Container(
      // height: 272,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          BorderRadiusSet.radius10,
        ),
        border: Border.all(
          color: midGreyColor,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: Spacing.spacing20),
        child: Center(
          child: QrCustomImage(
            data: '12345',
            size: 232,
          ),
        ),
      ),
    );
  }
}
