import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/bank_ndid_waiting.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/bank_ndid_waiting.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

import '../../../core/navigator_service.dart';

class BankNdidWaitingView extends CustomView<BankNdidWaitingViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const BankNdidWaitingView(this.kycLevel2ViewModel,
      {required BankNdidWaitingViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<BankNdidWaitingView, BankNdidWaitingViewModel> createState() =>
      _BankNdidWaitingViewState(viewModel);
}

class _BankNdidWaitingViewState
    extends ViewState<BankNdidWaitingView, BankNdidWaitingViewModel> {
  _BankNdidWaitingViewState(super.viewModel);

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
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamBuilder<BankNdidWaitingPageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  String text = '';
                  if (snapshot.data!.ndidRefResponse.type ==
                      NdidType.public.name) {
                    text = S.current.bankNdidWaitingHeadline.replaceAll(
                        '[idp]', snapshot.data!.ndidRefResponse.idpName);
                  } else if (snapshot.data!.ndidRefResponse.type ==
                      NdidType.agent.name) {
                    text = S.current.agentNdidWatingHeadline.replaceAll(
                        '[idp]', snapshot.data!.ndidRefResponse.idpName);
                  }

                  return HilightText(
                    text: text,
                    hilightStyle: headline4BoldStyle?.merge(
                      const TextStyle(color: blueColor),
                    ),
                    normalStyle: headline4LightStyle,
                  );
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 20.0),
              //   child: StreamBuilder<BankNdidWaitingPageState>(
              //       stream: viewModel.state,
              //       builder: (context, snapshot) {
              //         if (snapshot.hasData == false) return Container();
              //         String text = '';
              //         if (snapshot.data!.ndidRefResponse.type ==
              //             NdidType.public.name) {
              //           text = S.current.bankNdidWaitingDesc;
              //         } else if (snapshot.data!.ndidRefResponse.type ==
              //             NdidType.agent.name) {
              //           text = S.current.agentNdidWAtingDesc;
              //         }
              //         return Text(
              //           text,
              //           style: paragraph1RegularStyle?.copyWith(
              //               color: darkGreyColor),
              //         );
              //       }),
              // ),
              const SizedBox(
                height: Spacing.spacing20,
              ),
              StreamBuilder<BankNdidWaitingPageState>(
                  stream: viewModel.state,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return Text(
                      '${S.of(context).bankNdidRefLabel} ${snapshot.data?.ndidRefResponse.refId ?? ''}',
                      style: paragraph1RegularStyle,
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: _buildWarning(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  S.of(context).bankNdidInfoCancellation,
                  style: paragraph2LightStyle?.copyWith(color: darkGreyColor),
                ),
              ),
              // const Spacer(),
              const SizedBox(
                height: Spacing.spacing40,
              ),
            ],
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
            SvgPicture.asset(AssetSvg.clock),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.bankNdidVerifyIn,
                    style: paragraph2MediumStyle?.merge(
                      const TextStyle(color: darkBlueColor),
                    ),
                  ),
                  StreamBuilder<BankNdidTimerState>(
                      stream: viewModel.timerState,
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) return Container();
                        if (snapshot.data!.type == NdidType.public.name) {
                          return Text(
                            DateTimeUtils.durationFormatMinuteSecond(
                                snapshot.data?.countdown ?? const Duration()),
                            style: paragraph2LightStyle?.copyWith(
                                color: darkBlueColor.withOpacity(0.5)),
                          );
                        }
                        if (snapshot.data!.type == NdidType.agent.name) {
                          return Text(
                            DateTimeUtils.durationFormatHourMinuteSecond(
                                snapshot.data?.countdown ?? const Duration()),
                            style: paragraph2LightStyle?.copyWith(
                                color: darkBlueColor.withOpacity(0.5)),
                          );
                        }
                        return Container();
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
