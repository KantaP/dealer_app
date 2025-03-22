import 'dart:io';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/fund.vm.dart';
import 'package:aconnec_1109_x/src/model/politic_question.m.dart';
import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/address.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/fund.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/enums/form_type.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class KycFundForm extends StatelessWidget {
  final Map<String, TextEditingController> fundFormControllers;
  final Map<String, TextEditingController> workingAddressFormControllers;
  final Function() nextStep;
  final Function() backStep;
  final Function(AddressFormType formType) onSelectProvince;
  final Function(AddressFormType formType) onSelectDistrict;
  final Function(AddressFormType formType) onSelectSubDistrict;
  // final Function() onSelectOccupations;
  final Stream<KycFundFormState> fundFormState;
  final Stream<KycAddressFormState> workingAddressFormState;
  final Function(dynamic value) updateFundFormState;
  final Function(dynamic value) updateWorkingAddressFormState;
  final Function(String controllerName, {List<Enum> validateTypes})
      onValidateFundFormInput;
  final Function(String controllerName, {List<Enum> validateTypes})
      onValidateWorkingAddressFormInput;
  final Function() onUploadAnotherJobDocument;
  final Function() onUploadAnotherJobAssetDocument;
  final Widget nextButtonText;

  final KycFundViewModel viewModel;

  const KycFundForm({
    super.key,
    required this.nextStep,
    required this.backStep,
    required this.fundFormControllers,
    required this.onSelectProvince,
    required this.onSelectDistrict,
    required this.onSelectSubDistrict,
    // required this.onSelectOccupations,
    required this.fundFormState,
    required this.updateFundFormState,
    required this.workingAddressFormControllers,
    required this.updateWorkingAddressFormState,
    required this.onValidateWorkingAddressFormInput,
    required this.onValidateFundFormInput,
    required this.workingAddressFormState,
    required this.onUploadAnotherJobDocument,
    required this.onUploadAnotherJobAssetDocument,
    required this.nextButtonText,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildGroupOne(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
          child: StreamBuilder<KycFundFormState>(
              stream: viewModel.fundFormState,
              builder: (context, snapshot) {
                if (snapshot.hasData == false) return Container();
                return ElevatedButton(
                  onPressed: viewModel.canSubmit()
                      ? () {
                          nextStep();
                        }
                      : null,
                  child: nextButtonText,
                );
              }),
        ),
        SizedBox(
          height: paddingBottom,
        )
      ],
    );
  }

  Widget _buildAnotherJob() {
    return StreamBuilder<KycFundFormState>(
      stream: fundFormState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Visibility(
            visible: snapshot.data!.occupationScore == 30 ||
                snapshot.data!.occupationScore == 7,
            child: CustomRadioField(
              label: S.of(context).kycFundAnotherJob,
              values: <RadioValue>[
                RadioValue(title: S.of(context).doNotHave, value: false),
                RadioValue(title: S.of(context).have, value: true),
              ],
              onSelect: (selected) {
                fundFormControllers[KycFundFormStateFields.anotherJob]?.value =
                    TextEditingValue(text: selected.value.toString());
                updateFundFormState(
                    {KycFundFormStateFields.anotherJob: selected.value});
              },
              selected: RadioValue(value: snapshot.data?.anotherJob ?? false),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildOccupation() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          StreamBuilder<KycFundFormState>(
            stream: fundFormState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return CustomTextField(
                label: S.of(context).fundInformationOccupationGroupLabel,
                placeholder:
                    S.of(context).fundInformationOccupationGroupPlaceholder,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Image.asset(
                    AssetIcons.arrowRight,
                    width: 16,
                    height: 16,
                  ),
                ),
                readOnly: true,
                controller: fundFormControllers[
                    KycFundFormStateFields.occupationGroupName],
                onTap: () {
                  viewModel.onSelectOccupations(SelectOccupation.normal);
                },
                errorText: onValidateFundFormInput(
                    KycFundFormStateFields.occupationGroupName),
              );
            },
          ),
          StreamBuilder<KycFundFormState>(
            stream: fundFormState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              if (snapshot.data!.showSubOccupation == false) return Container();
              return CustomTextField(
                label: S.of(context).fundInformationOccupationLabel,
                placeholder: S.of(context).fundInformationOccupationPlaceholder,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Image.asset(
                    AssetIcons.arrowRight,
                    width: 16,
                    height: 16,
                  ),
                ),
                readOnly: true,
                controller:
                    fundFormControllers[KycFundFormStateFields.occupation],
                onTap: () {
                  viewModel.onSelectOccupationList(SelectOccupation.normal);
                },
                errorText:
                    onValidateFundFormInput(KycFundFormStateFields.occupation),
              );
            },
          ),
          StreamBuilder<KycFundFormState>(
            stream: fundFormState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              if (snapshot.data!.showSubOccupationOther == false) {
                return Container();
              }
              return CustomTextField(
                label: '',
                placeholder:
                    S.of(context).fundInformationOccupationOtherPlaceholder,
                controller: fundFormControllers[
                    KycFundFormStateFields.showSubOccupationOther],
                onChanged: (value) {
                  updateFundFormState(
                      {KycFundFormStateFields.occupation: 'other_$value'});
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAnotherOccupation() {
    return StreamBuilder<KycFundFormState>(
        stream: fundFormState,
        builder: (context, snapshot) {
          if (snapshot.hasData == false) return Container();

          return Visibility(
            visible: snapshot.data!.anotherJob,
            child: Column(
              children: [
                StreamBuilder<KycFundFormState>(
                  stream: fundFormState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return CustomTextField(
                      label: S
                          .of(context)
                          .fundInformationAnotherOccupationGroupLabel,
                      placeholder: S
                          .of(context)
                          .fundInformationOccupationGroupPlaceholder,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Image.asset(
                          AssetIcons.arrowRight,
                          width: 16,
                          height: 16,
                        ),
                      ),
                      readOnly: true,
                      controller: fundFormControllers[
                          KycFundFormStateFields.anotherOccupationGroupName],
                      onTap: () {
                        viewModel.onSelectOccupations(SelectOccupation.another);
                      },
                      errorText: onValidateFundFormInput(
                          KycFundFormStateFields.anotherOccupationGroupName),
                    );
                  },
                ),
                StreamBuilder<KycFundFormState>(
                  stream: fundFormState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    if (snapshot.data!.showAnotherSubOccupation == false) {
                      return Container();
                    }
                    return CustomTextField(
                      label:
                          S.of(context).fundInformationAnotherOccupationLabel,
                      placeholder:
                          S.of(context).fundInformationOccupationPlaceholder,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Image.asset(
                          AssetIcons.arrowRight,
                          width: 16,
                          height: 16,
                        ),
                      ),
                      readOnly: true,
                      controller: fundFormControllers[
                          KycFundFormStateFields.anotherOccupationName],
                      onTap: () {
                        viewModel
                            .onSelectOccupationList(SelectOccupation.another);
                      },
                      errorText: onValidateFundFormInput(
                          KycFundFormStateFields.anotherOccupationName),
                    );
                  },
                ),
                StreamBuilder<KycFundFormState>(
                  stream: fundFormState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    if (snapshot.data!.showAnotherSubOccupationOther == false) {
                      return Container();
                    }
                    return CustomTextField(
                      label: '',
                      placeholder: S
                          .of(context)
                          .fundInformationOccupationOtherPlaceholder,
                      controller: fundFormControllers[
                          KycFundFormStateFields.showAnotherSubOccupationOther],
                      onChanged: (value) {
                        updateFundFormState(
                          {
                            KycFundFormStateFields.anotherOccupationName:
                                'other_$value'
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  Widget _buildAnotherJobSalaryRange() {
    return StreamBuilder<KycFundFormState>(
      stream: fundFormState,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: Spacing.spacing20),
            child: Visibility(
              visible: snapshot.data!.anotherJob == true,
              child: CustomRadioField(
                label: S.of(context).kycFundAnotherJobSalaryRange,
                values: <RadioValue>[
                  RadioValue(
                      title: S.of(context).kycFundAnotherJobIncomeOption1,
                      value: S.of(context).kycFundAnotherJobIncomeOption1),
                  RadioValue(
                      title: S.of(context).kycFundAnotherJobIncomeOption2,
                      value: S.of(context).kycFundAnotherJobIncomeOption2),
                  RadioValue(
                      title: S.of(context).kycFundAnotherJobIncomeOption3,
                      value: S.of(context).kycFundAnotherJobIncomeOption3),
                  RadioValue(
                      title: S.of(context).kycFundAnotherJobIncomeOption4,
                      value: S.of(context).kycFundAnotherJobIncomeOption4),
                  RadioValue(
                      title: S.of(context).kycFundAnotherJobIncomeOption5,
                      value: S.of(context).kycFundAnotherJobIncomeOption5)
                ],
                onSelect: (selected) {
                  fundFormControllers[
                              KycFundFormStateFields.anotherJobSalaryRange]
                          ?.value =
                      TextEditingValue(text: selected.value.toString());
                  updateFundFormState(
                    {
                      KycFundFormStateFields.anotherJobSalaryRange:
                          selected.value
                    },
                  );
                },
                selected: RadioValue(
                    value: snapshot.data?.anotherJobSalaryRange ?? ''),
                errorText: onValidateFundFormInput(
                        KycFundFormStateFields.anotherJobSalaryRange) ??
                    '',
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildAnotherJobDocumentSection() {
    return StreamBuilder<KycFundFormState>(
      stream: fundFormState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Visibility(
            visible: snapshot.data?.anotherJob == true,
            child: Padding(
              padding: const EdgeInsets.only(top: Spacing.spacing20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildAnotherJobDocumentUpload(),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  List<Widget> _buildAnotherJobDocumentUpload() {
    return [
      Text(
        S.current.kycFundAnotherJobDocument,
        style: paragraph2Style,
      ),
      Text(
        S.current.kycFundAnotherJobDocumentDesc,
        style: paragraph3Style?.copyWith(color: darkGreyColor),
      ),
      const SizedBox(
        height: 10,
      ),
      StreamBuilder<KycFundFormState>(
        stream: fundFormState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildUploadButton(
              onTap: () {
                onUploadAnotherJobDocument();
              },
              onRemoved: () {
                updateFundFormState(
                    {KycFundFormStateFields.anotherJobDocument: ''});
              },
              imagePath: snapshot.data?.anotherJobDocument ?? '',
            );
          }
          return Container();
        },
      ),
    ];
  }

  Widget _buildAnotherJobAssetDocumentSection() {
    return StreamBuilder<KycFundFormState>(
      stream: fundFormState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Visibility(
            visible: snapshot.data?.anotherJob == true,
            child: Padding(
              padding: const EdgeInsets.only(top: Spacing.spacing20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildAnotherJobAssetDocumentUpload(),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  List<Widget> _buildAnotherJobAssetDocumentUpload() {
    return [
      Text(
        S.current.kycFundAnotherJobAssetDocument,
        style: paragraph2Style,
      ),
      Text(
        S.current.kycFundAnotherJobAssetDocumentDesc,
        style: paragraph3Style?.copyWith(color: darkGreyColor),
      ),
      const SizedBox(
        height: 10,
      ),
      StreamBuilder<KycFundFormState>(
        stream: fundFormState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildUploadButton(
              onTap: () {
                onUploadAnotherJobAssetDocument();
              },
              onRemoved: () {
                updateFundFormState(
                    {KycFundFormStateFields.anotherJobAssetDocument: ''});
              },
              imagePath: snapshot.data?.anotherJobAssetDocument ?? '',
            );
          }
          return Container();
        },
      ),
    ];
  }

  Widget _buildUploadButton({
    required Function() onTap,
    required Function() onRemoved,
    String? imagePath,
  }) {
    return DottedBorder(
      color: darkGreyColor,
      dashPattern: const [8, 4],
      borderPadding: const EdgeInsets.all(2),
      radius: const Radius.circular(10),
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: lightGrey1Color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: (imagePath != null && imagePath.isNotEmpty)
            ? _buildImageContent(
                image: (imagePath.contains('http')
                    ? Image.network(imagePath)
                    : Image.file(File(imagePath))),
                onRemoved: onRemoved)
            : _buildUploadContent(onTap: onTap),
      ),
    );
  }

  Widget _buildUploadContent({
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(AssetSvg.image),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              S.current.kycFundAnotherJobUploadHint,
              style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageContent(
      {required Widget image, required Function() onRemoved}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: image,
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: onRemoved,
              child: SvgPicture.asset(AssetSvg.closeCircle),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGroupOne() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLayout(
          child: HilightText(
            text: S.current.kycFundHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
        ),
        _buildLayout(child: _buildOccupation()),
        _buildLayout(child: _buildWorkingPlaceName()),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        _buildLayout(child: _buildAnotherJob()),
        _buildLayout(child: _buildAnotherOccupation()),
        _buildLayout(child: _buildAnotherJobSalaryRange()),
        _buildLayout(child: _buildAnotherJobDocumentSection()),
        _buildLayout(child: _buildAnotherJobAssetDocumentSection()),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        const CustomDivider(),
        const SizedBox(
          height: Spacing.spacing40,
        ),
        _buildLayout(child: _buildIsPolictic()),
        // _buildSalaryRange(),

        const SizedBox(
          height: Spacing.spacing20,
        )
      ],
    );
  }

  Widget _buildIsPolictic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HilightText(
          text: S.current.ndidPoliticStateHeadline,
          hilightStyle: headline4BoldStyle?.merge(
            const TextStyle(color: blueColor),
          ),
          normalStyle: headline4LightStyle,
        ),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        FutureBuilder<List<PoliticQuestionModel>>(
          future: viewModel.loadPoliticQuestions(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return Container();
            }
            return Column(
              children: snapshot.data!.map(
                (e) {
                  return StreamBuilder<KycFundFormState>(
                    stream: viewModel.fundFormState,
                    builder: (context, stateSnapshot) {
                      if (stateSnapshot.hasData == false) return Container();
                      if (e.id == '2') {
                        final userchoices =
                            stateSnapshot.data?.politicAnswers ?? [];
                        // print(userchoices[0].point);
                        bool showQuestion = true;
                        if (userchoices.isNotEmpty) {
                          if (userchoices[0].point > 0) {
                            showQuestion = true;
                          }
                        }
                        return Visibility(
                          visible: showQuestion,
                          child: CustomRadioField(
                            label: '${e.id}.${e.question?.th}',
                            values: e.answers
                                .map((e) => RadioValue(
                                    title: e.answer?.th,
                                    value:
                                        '${e.id.toString()}_${e.point.toString()}'))
                                .toList(),
                            onSelect: (selected) {
                              final split =
                                  selected.value.toString().split('_');

                              viewModel.selectAnswer(
                                id: e.id,
                                answerId: split[0],
                                point: int.parse(split[1].toString()),
                              );
                            },
                            selected:
                                viewModel.generateRadioValue(e.id.toString()),
                          ),
                        );
                      }

                      return CustomRadioField(
                        label: '${e.id}.${e.question?.th}',
                        values: e.answers
                            .map((e) => RadioValue(
                                title: e.answer?.th,
                                value:
                                    '${e.id.toString()}_${e.point.toString()}'))
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
                },
              ).toList(),
            );
          },
        ),
        Text(
          S.current.ndidPoliticStateFooter,
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
        const SizedBox(
          height: Spacing.spacing40,
        )
      ],
    );
  }

  Widget _buildLayout({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: child,
    );
  }

  Widget _buildWorkingPlaceName() {
    return CustomTextField(
      label: S.current.kycFundWorkingPlaceNameLabel,
      controller: fundFormControllers[KycFundFormStateFields.workingPlaceName],
      onChanged: (value) {
        updateFundFormState({
          KycFundFormStateFields.workingPlaceName: value,
        });
      },
      placeholder: S.current.kycFundFormWorkingPlacenamePlaceholder,
    );
  }
}
