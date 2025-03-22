import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/suiteable_question.vm.dart';
import 'package:aconnec_1109_x/src/model/suiteable_question.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_checkbox_field.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

class SuiteableQuestionView extends CustomView<SuiteableQuestionViewModel> {
  const SuiteableQuestionView(
      {required SuiteableQuestionViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SuiteableQuestionViewState createState() =>
      _SuiteableQuestionViewState(viewModel);
}

class _SuiteableQuestionViewState
    extends ViewState<SuiteableQuestionView, SuiteableQuestionViewModel> {
  _SuiteableQuestionViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.listenState();
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
                  text: S.current.suiteableQuestionHeadline,
                  hilightStyle: headline4BoldStyle?.merge(
                    const TextStyle(color: blueColor),
                  ),
                  normalStyle: headline4LightStyle,
                ),
              ),
            ),
            const SliverPadding(
                padding: EdgeInsets.only(top: Spacing.spacing20)),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
              sliver: SliverToBoxAdapter(
                child: Text(
                  S.current.suiteableQuestionDescription,
                  style: paragraph2Style?.copyWith(color: darkGreyColor),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FutureBuilder<List<SuiteableQuestionModel>>(
                      future: viewModel.loadQuestions(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) {
                          return Container();
                        }
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final e = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Spacing.spacing24),
                              child: _buildQuestion(e),
                            );
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
                    StreamBuilder<SuiteableQuestionFormState>(
                      stream: viewModel.formState,
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) return Container();
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: Spacing.spacing24,
                              right: Spacing.spacing24,
                              top: Spacing.spacing10),
                          child: ElevatedButton(
                            onPressed: (snapshot.data!.userChoices.length < 13)
                                ? null
                                : () {
                                    viewModel.submit();
                                  },
                            child: Text(
                              S.current.confirmButton,
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
        StreamBuilder<SuiteableQuestionPageState>(
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

  Widget _buildQuestion(SuiteableQuestionModel e) {
    if (e.multiple == true) {
      return StreamBuilder<SuiteableQuestionFormState>(
        stream: viewModel.formState,
        builder: (context, stateSnapshot) {
          return CustomCheckboxField(
            label: '${e.id}.${e.question?.th}',
            values: e.answers
                .map((e) => CheckboxValue(
                    title: e.answer?.th,
                    value: '${e.id.toString()}_${e.point.toString()}'))
                .toList(),
            onSelect: (selected) {
              final split = selected.value.toString().split('_');
              viewModel.selectAnswer(
                id: e.id,
                answerId: split[0],
                point: int.parse(split[1]),
                type: 'checkbox',
              );
            },
            selected: viewModel.generateCheckboxValue(e.id.toString()),
          );
        },
      );
    }
    if (e.selectedItem == true) {
      return StreamBuilder<SuiteableQuestionFormState>(
        stream: viewModel.formState,
        builder: (context, formSnapshot) {
          return Padding(
            padding: const EdgeInsets.only(bottom: Spacing.spacing10),
            child: CustomTextField(
              label: '${e.id}.${e.question?.th}',
              placeholder:
                  S.current.kycSuiteTestSelectSourceOfFundCountryPlaceholder,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Image.asset(
                  AssetIcons.arrowRight,
                  width: 16,
                  height: 16,
                ),
              ),
              readOnly: true,
              controller: viewModel.sourceOfFundController,
              onTap: () {
                viewModel.onSelectItem(e.id);
              },
              errorText: null,
            ),
          );
        },
      );
    }
    return StreamBuilder<SuiteableQuestionFormState>(
      stream: viewModel.formState,
      builder: (context, stateSnapshot) {
        return CustomRadioField(
          label: '${e.id}.${e.question?.th}',
          values: e.answers
              .map((e) => RadioValue(
                  title: e.answer?.th,
                  value: '${e.id.toString()}_${e.point.toString()}'))
              .toList(),
          onSelect: (selected) {
            final split = selected.value.toString().split('_');

            viewModel.selectAnswer(
              id: e.id,
              answerId: split[0],
              point: int.parse(split[1].toString()),
            );
          },
          selected: viewModel.generateRadioValue(e.id.toString()),
        );
      },
    );
  }
}
