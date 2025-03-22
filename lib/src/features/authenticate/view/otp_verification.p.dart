import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/otp_verification.st.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/otp_verification.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends CustomView<OtpVerificationViewModel> {
  final String phoneNumber;
  final String mode;

  const OtpVerificationPage(
      {required OtpVerificationViewModel viewModel,
      required this.phoneNumber,
      required this.mode,
      Key? key})
      : super.model(viewModel, key: key);

  @override
  _OtpVerificationPageState createState() =>
      _OtpVerificationPageState(viewModel);
}

class _OtpVerificationPageState
    extends ViewState<OtpVerificationPage, OtpVerificationViewModel> {
  _OtpVerificationPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setContext(context);
    viewModel.listenState();
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.updateState(<String, dynamic>{
      OtpVerificationFields.mode: widget.mode,
      OtpVerificationFields.isLoading: false,
    });
    viewModel.updateFormState(<String, dynamic>{
      OtpVerificationFormFields.phoneNumber: widget.phoneNumber,
    });
    viewModel.verifyPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WillPopScope(
          onWillPop: () => viewModel.onWillPop(),
          child: DefaultLayout(
            statusBarColor: whiteColor,
            extendBody: true,
            physics: const BouncingScrollPhysics(),
            appBar: _AppBar(viewModel),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: _buildLayout(),
              )
            ],
          ),
        ),
        StreamBuilder<OtpVerificationState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data?.isLoading ?? false,
              child: const Loading(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _widgetContent(),
          StreamBuilder<OtpVerificationFormState>(
            stream: viewModel.formState,
            builder: (context, snapshot) {
              return OtpFieldForm(
                onSubmit: viewModel.onChangedOtp,
                errorState: snapshot.data?.errorState,
                autoFocus: snapshot.data?.verificationId.isNotEmpty ?? false,
                controller: viewModel.otpController,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _widgetContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Spacing.spacing45),
          child: Image.asset(AssetImages.dataSecurity),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: Spacing.spacing40, bottom: Spacing.spacing10),
          child: Text(
            S.of(context).otpVerificationHeadline,
            style: headline2Style,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            child: StreamBuilder<OtpVerificationFormState>(
              stream: viewModel.formState,
              builder: (context, snapshot) {
                if (snapshot.hasData == false) return Container();
                return Text(
                  S
                      .of(context)
                      .otpVerificationContent
                      .replaceAll('@value', snapshot.data!.phoneNumber),
                  style: titleStyle?.copyWith(color: darkGreyColor),
                  textAlign: TextAlign.center,
                  softWrap: true,
                );
              },
            ),
          ),
        ),
        StreamBuilder<OtpVerificationTimerState>(
          stream: viewModel.timerState,
          builder: (context, snapshot) {
            int time = snapshot.data?.time ?? 0;
            return Padding(
              padding: const EdgeInsets.only(
                  top: Spacing.spacing40, bottom: Spacing.spacing40),
              child: Text.rich(
                TextSpan(
                  text: S.of(context).otpVerificationDidNotGetCode,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: blueColor,
                    color: (time == 0)
                        ? blueColor
                        : const Color(0xFF16171D).withOpacity(0.3),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (time == 0) viewModel.verifyPhoneNumber();
                    },
                  children: <TextSpan>[
                    TextSpan(
                      text: time > 0 ? '  $time ${S.of(context).second}' : '',
                      style: paragraph1RegularStyle?.copyWith(
                          decoration: TextDecoration.none, color: blackColor),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            );
          },
        )
      ],
    );
  }
}

class OtpFieldForm extends StatelessWidget {
  final Function(String) onSubmit;
  final String? errorState;
  final bool autoFocus;
  final TextEditingController controller;
  const OtpFieldForm(
      {Key? key,
      required this.onSubmit,
      this.errorState,
      required this.autoFocus,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PinCodeTextField(
          length: 6,
          appContext: context,
          keyboardType: TextInputType.number,
          textStyle: headline4Style,
          pinTheme: PinTheme(
            selectedColor: blueColor,
            inactiveColor: midGreyColor,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            fieldHeight: 50,
            fieldWidth: 46,
            activeColor: blueColor,
          ),
          onChanged: (String value) {},
          onCompleted: (value) {
            onSubmit(value);
          },
          controller: controller,
        ),
        Visibility(
          visible: errorState != null && errorState!.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Text(
                errorState ?? '',
                style: paragraph2Style?.copyWith(color: redColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar(this.viewModel);
  final double height = 40.0;
  final OtpVerificationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: height,
      title: StreamBuilder(
        stream: viewModel.state,
        builder: (context, AsyncSnapshot<OtpVerificationState> snapshot) {
          return Text(
            S.of(context).otpVerificationTitle,
          );
        },
      ),
    );
  }
}
