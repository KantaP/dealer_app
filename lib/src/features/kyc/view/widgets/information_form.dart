import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/information.st.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_laser_id_card_field.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/custom_checkbox.dart';

class KycInformationForm extends StatelessWidget {
  final Map<String, TextEditingController> controllers;
  final Function() nextStep;
  final Function(dynamic value) updateFormState;
  final Function(String controllerName, {List<Enum> validateTypes})
      onValidateField;

  final Stream<KycInformationFormState> formState;
  final Stream<KycInformationFormErrorState> formErrorState;
  final Stream<KycInformationFormSubmitState> formSubmitState;

  const KycInformationForm({
    super.key,
    required this.nextStep,
    required this.controllers,
    required this.updateFormState,
    required this.onValidateField,
    required this.formErrorState,
    required this.formSubmitState,
    required this.formState,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.of(context).kycInformationHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: _buildStreamControllerInformation(
              (context, snapshot) => CustomTextField(
                label: S.of(context).kycInformationFirstNameEngLabel,
                placeholder:
                    S.of(context).kycInformationFirstNameEngPlaceholder,
                controller:
                    controllers[KycInformationFormStateFields.firstNameEng],
                onChanged: (value) {
                  updateFormState(
                    generateUpdateValue(
                      KycInformationFormStateFields.firstNameEng,
                      value,
                    ),
                  );
                },
                errorText: snapshot.data?.firstNameEng,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[a-zA-Z]'),
                  )
                ],
              ),
            ),
          ),
          _buildStreamControllerInformation(
            (context, snapshot) => CustomTextField(
              label: S.of(context).kycInformationLastNameEngLabel,
              placeholder: S.of(context).kycInformationLastNameEngPlaceholder,
              controller:
                  controllers[KycInformationFormStateFields.lastNameEng],
              onChanged: (value) {
                updateFormState(
                  generateUpdateValue(
                    KycInformationFormStateFields.lastNameEng,
                    value,
                  ),
                );
              },
              errorText: snapshot.data?.lastNameEng,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp('[a-zA-Z]'),
                )
              ],
            ),
          ),
          _buildStreamControllerInformation(
            (context, snapshot) => CustomTextField(
              label: S.of(context).kycInformationFirstNameThaiLabel,
              placeholder: S.of(context).kycInformationFirstNameThaiPlaceholder,
              controller:
                  controllers[KycInformationFormStateFields.firstNameThai],
              onChanged: (value) {
                updateFormState(
                  generateUpdateValue(
                    KycInformationFormStateFields.firstNameThai,
                    value,
                  ),
                );
              },
              errorText: snapshot.data?.firstNameThai,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp('[\u0E00-\u0E7F]'),
                )
              ],
            ),
          ),
          _buildStreamControllerInformation(
            (context, snapshot) => CustomTextField(
              label: S.of(context).kycInformationLastNameThaiLabel,
              placeholder: S.of(context).kycInformationLastNameThaiPlaceholder,
              controller:
                  controllers[KycInformationFormStateFields.lastNameThai],
              onChanged: (value) {
                updateFormState(
                  generateUpdateValue(
                    KycInformationFormStateFields.lastNameThai,
                    value,
                  ),
                );
              },
              errorText: snapshot.data?.lastNameThai,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp('[\u0E00-\u0E7F]'),
                )
              ],
            ),
          ),
          _buildStreamControllerInformation(
            (context, snapshot) => CustomTextField(
              label: S.of(context).kycInformationDateOfBirthLabel,
              placeholder: S.of(context).kycInformationDateOfBirthPlaceholder,
              onTap: () => onTapDatepicker(context),
              readOnly: true,
              controller:
                  controllers[KycInformationFormStateFields.dateOfBirth],
              onChanged: (value) {
                updateFormState(
                  generateUpdateValue(
                    KycInformationFormStateFields.dateOfBirth,
                    value,
                  ),
                );
              },
              errorText: snapshot.data?.dateOfBirth,
            ),
          ),
          _buildStreamControllerInformation(
            (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return StreamBuilder<KycInformationFormState>(
                  stream: formState,
                  builder: (context, formSnapshot) {
                    if (formSnapshot.hasData == false) return Container();
                    RadioValue selectedGender =
                        RadioValue(value: formSnapshot.data!.gender);
                    return CustomRadioField(
                      label: S.of(context).kycInformationGenderLabel,
                      values: <RadioValue>[
                        RadioValue(
                            title: S.of(context).kycInformationGenderMale,
                            value: S
                                .of(context)
                                .kycInformationGenderMale
                                .toLowerCase()),
                        RadioValue(
                            title: S.of(context).kycInformationGenderFemale,
                            value: S
                                .of(context)
                                .kycInformationGenderFemale
                                .toLowerCase()),
                        RadioValue(
                            title: S.of(context).kycInformationGenderLGBTQ,
                            value: S
                                .of(context)
                                .kycInformationGenderLGBTQ
                                .toLowerCase())
                      ],
                      onSelect: (selected) {
                        controllers[KycInformationFormStateFields.gender]
                                ?.value =
                            TextEditingValue(text: selected.value.toString());
                        updateFormState({
                          KycInformationFormStateFields.gender:
                              selected.value.toString()
                        });
                      },
                      radioType: RadioType.row,
                      errorText: snapshot.data?.gender ?? '',
                      selected: selectedGender,
                    );
                  });
            },
          ),
          _buildStreamControllerInformation(
            (context, snapshot) => CustomTextField(
              label: S.of(context).kycInformationIdCardLabel,
              placeholder: S.of(context).kycInformationIdCardPlaceholder,
              controller: controllers[KycInformationFormStateFields.idCard],
              errorText: snapshot.data?.idCard,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                updateFormState(
                  generateUpdateValue(
                    KycInformationFormStateFields.idCard,
                    value,
                  ),
                );
              },
              // maxlength: 13,
              inputFormatters: [LengthLimitingTextInputFormatter(13)],
            ),
          ),
          _buildStreamControllerInformation(
            (context, snapshot) => Row(
              children: [
                Flexible(
                  flex: 2,
                  child: StreamBuilder<KycInformationFormState>(
                      stream: formState,
                      builder: (context, formSnapshot) {
                        if (formSnapshot.hasData == false) return Container();
                        return CustomTextField(
                          label:
                              S.of(context).kycInformationIdCardExpireAtLabel,
                          placeholder: S
                              .of(context)
                              .kycInformationIdCardExpireAtPlaceholder,
                          onTap: () {
                            if (formSnapshot.data!.idCardLifetime) {
                              return;
                            }
                            onTapIdCardExpireDate(context);
                          },
                          readOnly: true,
                          controller: controllers[
                              KycInformationFormStateFields.idCardExpireAt],
                          onChanged: (value) {
                            updateFormState(
                              generateUpdateValue(
                                KycInformationFormStateFields.idCardExpireAt,
                                value,
                              ),
                            );
                          },
                          errorText: snapshot.data?.idCardExpireAt,
                          filled: formSnapshot.data!.idCardLifetime,
                        );
                      }),
                ),
                Flexible(child: _buildIdCardForeverCheckBox())
              ],
            ),
          ),
          _buildStreamControllerInformation(
            (context, snapshot) => CustomLaserIdCardField(
              label: S.of(context).kycInformationlaserCardLabel,
              errorText: snapshot.data?.laserIdCard,
              controller:
                  controllers[KycInformationFormStateFields.laserIdCard],
              onChanged: (value) {
                updateFormState(
                  generateUpdateValue(
                    KycInformationFormStateFields.laserIdCard,
                    value,
                  ),
                );
              },
            ),
          ),
          Image.asset(AssetImages.backIdCard),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: StreamBuilder<KycInformationFormSubmitState>(
                stream: formSubmitState,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  return ElevatedButton(
                    onPressed: (snapshot.data!.canSubmit == false)
                        ? null
                        : () {
                            nextStep();
                          },
                    child: Text(
                      S.of(context).nextButton,
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  Future<void> onTapDatepicker(BuildContext context) async {
    int lastYear = DateTime.now().year - 21;
    final currentDate = DateTime.now().subtract(const Duration(days: 365 * 21));
    // print(lastYear);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(lastYear - 100),
      lastDate: DateTime(lastYear, currentDate.month, currentDate.day),
      // barrierColor: Colors.transparent,
    );
    if (pickedDate != null) {
      final dateFormat = DateFormat('dd-MM-yyyy');
      controllers[KycInformationFormStateFields.dateOfBirth]?.value =
          TextEditingValue(
        text: dateFormat.format(pickedDate),
      );
      updateFormState(
        generateUpdateValue(
          KycInformationFormStateFields.dateOfBirth,
          dateFormat.format(pickedDate),
        ),
      );
    }

    return;
  }

  Future<void> onTapIdCardExpireDate(BuildContext context) async {
    int lastYear = DateTime.now().year;
    final currentDate = DateTime.now().add(const Duration(days: 1));
    // print(lastYear);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(lastYear + 20),
      // barrierColor: Colors.transparent,
    );
    if (pickedDate != null) {
      final dateFormat = DateFormat('dd-MM-yyyy');
      controllers[KycInformationFormStateFields.idCardExpireAt]?.value =
          TextEditingValue(
        text: dateFormat.format(pickedDate),
      );
      updateFormState(
        generateUpdateValue(
          KycInformationFormStateFields.idCardExpireAt,
          dateFormat.format(pickedDate),
        ),
      );
    }

    return;
  }

  Map<String, dynamic> generateUpdateValue(String key, dynamic value) {
    return <String, dynamic>{key: value};
  }

  Widget _buildStreamControllerInformation(
      Widget Function(BuildContext, AsyncSnapshot<KycInformationFormErrorState>)
          widget) {
    return StreamBuilder<KycInformationFormErrorState>(
      stream: formErrorState,
      builder: widget,
    );
  }

  Widget _buildIdCardForeverCheckBox() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<KycInformationFormState>(
          stream: formState,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) return Container();
            return CustomCheckbox(
              value: snapshot.data!.idCardLifetime,
              onChanged: (checked) {
                if (checked == true) {
                  updateFormState({
                    KycInformationFormStateFields.idCardLifetime: checked,
                    KycInformationFormStateFields.idCardExpireAt: 'LT'
                  });
                } else {
                  updateFormState({
                    KycInformationFormStateFields.idCardLifetime: checked,
                    KycInformationFormStateFields.idCardExpireAt: ''
                  });
                }
                controllers[KycInformationFormStateFields.idCardExpireAt]
                    ?.value = const TextEditingValue(
                  text: '',
                );
              },
            );
          },
        ),
        Text(
          S.current.kycInformationIdCardLifetime,
          style: paragraph2Style,
        )
      ],
    );
  }
}
