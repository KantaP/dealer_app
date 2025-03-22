import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/knowledge_question.st.dart';
import 'package:aconnec_1109_x/src/model/knowledge_question.m.dart';
import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/knowledge_result.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/knowledge_result.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

class KnowledgeResultView extends CustomView<KnowledgeResultViewModel> {
  final KycFinalViewModel kycViewModel;

  const KnowledgeResultView(this.kycViewModel,
      {required KnowledgeResultViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _KnowledgeResultViewState createState() =>
      _KnowledgeResultViewState(viewModel);
}

class _KnowledgeResultViewState
    extends ViewState<KnowledgeResultView, KnowledgeResultViewModel> {
  _KnowledgeResultViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.getKnowledgeAnswers();
    viewModel.setKycViewModel(widget.kycViewModel);
    viewModel.setContext(context);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    viewModel.getKnowledgeAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.preKnowledgeTestHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Center(
              child: Text(
                S.current.kycSuiteableScoreHeadline,
                style: titleStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Center(
              child: StreamBuilder<KnowledgeResultPageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final int score = snapshot.data?.score ?? 0;
                    final double progress = (score / 10);
                    return CircularPercentIndicator(
                      radius: 85.0,
                      lineWidth: 10.0,
                      percent: progress,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            snapshot.data?.score.toString() ?? '0',
                            style: headline1Style,
                          ),
                          Text(
                            '/10',
                            style:
                                paragraph1RegularStyle?.copyWith(height: 0.05),
                          )
                        ],
                      ),
                      progressColor: blueColor,
                    );
                  }
                  return Container();
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
            child: StreamBuilder<KnowledgeResultPageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset((snapshot.data!.score > 5)
                                ? AssetIcons.success
                                : AssetIcons.failed),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.5),
                              child: Text(
                                (snapshot.data!.score > 5)
                                    ? S.current.knowledgeResultSuccess
                                    : S.current.knowledgeResultFailed,
                                style: headline4LightStyle?.copyWith(
                                    color: (snapshot.data!.score > 5)
                                        ? lightGreenColor
                                        : redColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: Spacing.spacing10,
                        ),
                        Text(
                          S.of(context).knowledgeTestResultMoreInformationLabel,
                          style: paragraph2Style,
                          textAlign: TextAlign.center,
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.openCryptoAcademyLink();
                          },
                          child: Text(
                            S.current.knowledgeInformation1,
                            style: paragraph2Style?.copyWith(color: blueColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.openSmartToInvestLink();
                          },
                          child: Text(
                            S.current.knowledgeInformation2,
                            style: paragraph2Style?.copyWith(color: blueColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                }),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0),
          //   child: Center(
          //     child: GestureDetector(
          //       onTap: () {
          //         viewModel.gotoQuestions();
          //       },
          //       child: Text(
          //         S.current.knowledgeReTestLinkButton,
          //         style: paragraph1LightStyle?.copyWith(
          //             color: blueColor, decoration: TextDecoration.underline),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          CustomFuture(
            future: viewModel.loadKnowledge(),
            customLoading: Container(),
            builder: (_, snapshot) => Expanded(
              child: Column(
                children: List.generate(
                  snapshot.data!.length,
                  (index) => _buildQuestion(snapshot.data![index], index),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: Spacing.spacing40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.next();
                  },
                  child: Text(
                    S.current.nextButton,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }

  Widget _buildQuestion(Map<String, dynamic> e, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: Spacing.spacing20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // (e['user_select'] == e['correct_answer'])
            //     ? const Icon(
            //         Icons.check,
            //         color: greenColor,
            //       )
            //     : const Icon(
            //         Icons.close,
            //         color: redColor,
            //       ),
            // const SizedBox(
            //   width: Spacing.spacing4,
            // ),
            Flexible(
              child: Text(
                '${index + 1}. ${e['question']}',
                style: paragraph2Style,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                (e['user_select'] == e['choice1'])
                    ? Icon(
                        Icons.radio_button_checked_outlined,
                        color: (e['user_select'] == e['correct_answer'])
                            ? greenColor
                            : redColor,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        color: darkGreyColor,
                      ),
                const SizedBox(
                  width: Spacing.spacing10,
                ),
                Flexible(
                  child: Text(
                    e['choice1'],
                    style: paragraph2Style?.copyWith(
                        color: ((e['user_select'] == e['choice1'] &&
                                    e['user_select'] == e['correct_answer']) ||
                                e['correct_answer'] == e['choice1'])
                            ? greenColor
                            : e['user_select'] == e['choice1'] &&
                                    e['user_select'] != e['correct_answer']
                                ? redColor
                                : blackColor),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: Spacing.spacing6,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                (e['user_select'] == e['choice2'])
                    ? Icon(
                        Icons.radio_button_checked_outlined,
                        color: (e['user_select'] == e['correct_answer'])
                            ? greenColor
                            : redColor,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        color: darkGreyColor,
                      ),
                const SizedBox(
                  width: Spacing.spacing10,
                ),
                Flexible(
                  child: Text(
                    e['choice2'],
                    style: paragraph2Style?.copyWith(
                        color: ((e['user_select'] == e['choice2'] &&
                                    e['user_select'] == e['correct_answer']) ||
                                e['correct_answer'] == e['choice2'])
                            ? greenColor
                            : e['user_select'] == e['choice2'] &&
                                    e['user_select'] != e['correct_answer']
                                ? redColor
                                : blackColor),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: Spacing.spacing6,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                (e['user_select'] == e['choice3'])
                    ? Icon(
                        Icons.radio_button_checked_outlined,
                        color: (e['user_select'] == e['correct_answer'])
                            ? greenColor
                            : redColor,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        color: darkGreyColor,
                      ),
                const SizedBox(
                  width: Spacing.spacing10,
                ),
                Flexible(
                    child: Text(
                  e['choice3'],
                  style: paragraph2Style?.copyWith(
                      color: ((e['user_select'] == e['choice3'] &&
                                  e['user_select'] == e['correct_answer']) ||
                              e['correct_answer'] == e['choice3'])
                          ? greenColor
                          : e['user_select'] == e['choice3'] &&
                                  e['user_select'] != e['correct_answer']
                              ? redColor
                              : blackColor),
                ))
              ],
            )
          ],
        ),
        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       'คำตอบ:',
        //       style: paragraph2Style,
        //     ),
        //     const SizedBox(
        //       width: Spacing.spacing4,
        //     ),
        //     Flexible(
        //       child: Text(
        //         '${e['user_select']}',
        //         style: paragraph2Style?.copyWith(
        //             color: (e['user_select'] == e['correct_answer']
        //                 ? greenColor
        //                 : redColor)),
        //         overflow: TextOverflow.clip,
        //       ),
        //     ),
        //   ],
        // ),
        // Visibility(
        //   visible: e['user_select'] != e['correct_answer'],
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: Spacing.spacing10),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           'คำตอบที่ถูกต้อง:',
        //           style: paragraph2Style,
        //         ),
        //         const SizedBox(
        //           width: Spacing.spacing4,
        //         ),
        //         Flexible(
        //           child: Text(
        //             '${e['correct_answer']}',
        //             style: paragraph2Style?.copyWith(color: greenColor),
        //             overflow: TextOverflow.clip,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        Container(
          height: 2,
          width: double.infinity,
          color: lightGrey1Color,
        ),
      ],
    );
  }
}
