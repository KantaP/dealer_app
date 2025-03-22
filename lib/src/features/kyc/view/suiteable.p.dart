import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:aconnec_1109_x/src/widgets/warning_text_box.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/suiteable.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SuiteableView extends CustomView<SuiteableViewModel> {
  final KycFinalViewModel _kycViewModel;

  const SuiteableView(this._kycViewModel,
      {required SuiteableViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SuiteableViewState createState() => _SuiteableViewState(viewModel);
}

class _SuiteableViewState extends ViewState<SuiteableView, SuiteableViewModel> {
  _SuiteableViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycViewModel(widget._kycViewModel);
    viewModel.onSuiteableTestValue();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildScoreContent(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: Spacing.spacing40),
          child: CustomDivider(),
        ),
        _buildScoreDescription(),
        // Padding(
        //   padding: const EdgeInsets.only(top: 20.0),
        //   child: Text(
        //     S.current.kycSuiteableListOfAvailableInvestment,
        //     style: titleStyle,
        //   ),
        // ),
        // const SizedBox(
        //   height: 21,
        // ),
        // ..._availableInvestment(),
        const SizedBox(
          height: 21,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Expanded(
            //   child: OutlinedButton(
            //     onPressed: () {},
            //     child: Text(
            //       S.current.backButton,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   width: 21,
            // ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.next();
                  },
                  child: Text(
                    S.current.confirmButton,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        )
      ],
    );
  }

  Widget _buildScoreContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          HilightText(
            text: S.current.kycSuiteableHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: Spacing.spacing40,
          ),
          Center(
            child: Text(
              S.current.kycSuiteableScoreHeadline,
              style: titleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Center(
              child: StreamBuilder<SuiteablePageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  return CircularPercentIndicator(
                    radius: 85.0,
                    lineWidth: 10.0,
                    percent: 1.0,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (snapshot.data!.iwtScore).toString(),
                          style: headline1Style,
                        ),
                        Text(
                          '/35',
                          style: paragraph1RegularStyle?.copyWith(height: 0.05),
                        )
                      ],
                    ),
                    progressColor: viewModel
                        .getProgressColor(snapshot.data!.suiteableType),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Text(
                S.current.kycSuiteableResultHeadline,
                style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
              ),
            ),
          ),
          Container(
            width: 264,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: midGreyColor),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Center(
                  child: Text(
                    S.current.kycSuiteableResultContent,
                    style: paragraph1RegularStyle,
                  ),
                ),
                Center(
                  child: StreamBuilder<SuiteablePageState>(
                    stream: viewModel.state,
                    builder: (context, snapshot) {
                      return Text(
                        viewModel
                            .choiceText(snapshot.data?.suiteableType ?? ''),
                        style: paragraph1RegularStyle?.copyWith(fontSize: 24),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0),
          //   child: Center(
          //     child: GestureDetector(
          //       onTap: () {
          //         viewModel.gotoQuestion();
          //       },
          //       child: Text(
          //         S.current.kycSuiteableQuestionLinkButton,
          //         style: paragraph1LightStyle?.copyWith(
          //             color: blueColor, decoration: TextDecoration.underline),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildScoreDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: StreamBuilder<SuiteablePageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (snapshot.hasData == false) return Container();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).suiteTestResultInvestTitle,
                style: titleStyle,
              ),
              const SizedBox(
                height: Spacing.spacing20,
              ),
              ...viewModel.investAdvices[snapshot.data?.suiteableType]!
                  .map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: Spacing.spacing10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\u2022',
                        style: paragraph1RegularStyle?.copyWith(
                            color: darkGreyColor),
                      ),
                      const SizedBox(
                        width: Spacing.spacing10,
                      ),
                      Flexible(
                        child: Text(
                          e,
                          style: paragraph1RegularStyle?.copyWith(
                            color: darkGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              const SizedBox(
                height: Spacing.spacing10,
              ),
              WarningTextBox(text: S.of(context).suiteTestInvestWarningMessage)
            ],
          );
        },
      ),
    );
  }

  // List<Widget> _availableInvestment() {
  //   return [
  //     Text(
  //       '\u2022 ตราสารหนี้',
  //       style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
  //     )
  //   ];
  // }
}
