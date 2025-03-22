import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/payment_completed.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

class PaymentCompletedView extends CustomView<PaymentCompletedViewModel> {
  const PaymentCompletedView(
      {required PaymentCompletedViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  State<PaymentCompletedView> createState() =>
      _PaymentCompletedViewState(viewModel);
}

class _PaymentCompletedViewState
    extends ViewState<PaymentCompletedView, PaymentCompletedViewModel> {
  _PaymentCompletedViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: _buildPaymentCompletedContent(),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentCompletedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        Image.asset(AssetIcons.clock40),
        const SizedBox(
          height: 5,
        ),
        Text(
          S.of(context).paymentCompletedTitle,
          style: titleStyle?.copyWith(color: yellowText),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          S.of(context).paymentCompletedDesc,
          style: paragraph2Style?.copyWith(color: midGreyColor),
          textAlign: TextAlign.center,
        ),
        Text(
          '01-12-2022 , 12:30',
          style: paragraph2LightStyle?.copyWith(color: darkGreyColor),
        ),
        Text(
          '${S.of(context).paymentCompletedTransactionIdLabel}: 123456',
          style: paragraph2Style?.copyWith(
            color: midGreyColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const DottedLine(
          dashColor: midGreyColor,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).buy,
              style: paragraph1RegularStyle?.copyWith(color: greenColor),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(AssetIcons.gasta24),
            const SizedBox(
              width: 5,
            ),
            Text(
              S.of(context).gasth,
              style: paragraph1RegularStyle,
            )
          ],
        ),
        Text(
          '97.087378 GASTH',
          style: headline4Style?.copyWith(color: blueColor),
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          S.of(context).paymentCompletedHint,
          style: paragraph2Style?.copyWith(color: darkGreyColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            S.of(context).viewHistoryButton,
          ),
        ),
      ),
    );
  }
}
