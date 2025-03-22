import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/knowledge_question.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/knowledge_question.vm.dart';
import 'package:aconnec_1109_x/src/model/knowledge_question.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

import '../../../core/navigator_service.dart';

class KnowledgeQuestionView extends CustomView<KnowledgeQuestionViewModel> {
  const KnowledgeQuestionView(
      {required KnowledgeQuestionViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _KnowledgeQuestionViewState createState() =>
      _KnowledgeQuestionViewState(viewModel);
}

class _KnowledgeQuestionViewState
    extends ViewState<KnowledgeQuestionView, KnowledgeQuestionViewModel> {
  _KnowledgeQuestionViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultLayout(
          safeAreaBottom: true,
          appBar: const SliverAppBar(
            automaticallyImplyLeading: false,
          ),
          slivers: [
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
              sliver: SliverToBoxAdapter(
                child: HilightText(
                  text: S.current.knowledgeQuestionHeadline,
                  hilightStyle: headline4BoldStyle?.merge(
                    const TextStyle(color: blueColor),
                  ),
                  normalStyle: headline4LightStyle,
                ),
              ),
            ),
            // const SliverPadding(padding: EdgeInsets.only(top: 20)),
            // SliverPadding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            //   sliver: SliverToBoxAdapter(
            //     child: Text(
            //       S.current.knowledgeQuestionDescription,
            //       style: paragraph2Style?.copyWith(color: darkGreyColor),
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              // hasScrollBody: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FutureBuilder<List<KnowledgeQuestionModel>>(
                      future: viewModel.loadKnowledge(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) return Container();
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return _buildQuestion(snapshot.data![index], index);
                          },
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Spacing.spacing20),
                              child: CustomDivider(),
                            );
                          },
                        );
                      },
                    ),
                    StreamBuilder<KnowledgeQuestionFormState>(
                      stream: viewModel.formState,
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) return Container();
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: Spacing.spacing10,
                              left: Spacing.spacing24,
                              right: Spacing.spacing24),
                          child: ElevatedButton(
                            onPressed: snapshot.data!.userChoices.length < 10
                                ? null
                                : () {
                                    viewModel.onSubmit();
                                  },
                            child: Text(
                              S.current.submitButton,
                            ),
                          ),
                        );
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
          physics: const BouncingScrollPhysics(),
          extendBody: true,
        ),
        StreamBuilder<KnowledgeQuestionPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data?.isLoading ?? false,
              child: const Loading(),
            );
          },
        )
      ],
    );
  }

  Widget _buildQuestion(KnowledgeQuestionModel e, int index) {
    final answers = [
      e.choice1,
      e.choice2,
      e.choice3,
    ];
    return StreamBuilder<KnowledgeQuestionFormState>(
      stream: viewModel.formState,
      builder: (context, stateSnapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
          child: CustomRadioField(
            label: '${index + 1}. ${e.question}',
            values: answers
                .map((e) =>
                    RadioValue(title: e, value: answers.indexOf(e).toString()))
                .toList(),
            onSelect: (selected) {
              viewModel.selectAnswer(
                id: e.id.toString(),
                answerId: selected.value ?? '-1',
                point: viewModel.compareAnswer(
                        int.parse(selected.value ?? '-1'), e.answer)
                    ? 1
                    : 0,
              );
            },
            selected: viewModel.generateRadioValue(
              e.id.toString(),
            ),
          ),
        );
      },
    );
  }
}
