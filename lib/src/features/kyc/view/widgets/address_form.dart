import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/address.vm.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/address.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/enums/form_type.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class KycAddressForm extends StatelessWidget {
  final Map<String, TextEditingController> controllers;
  final Map<String, TextEditingController> currentControllers;
  final Map<String, TextEditingController> workingAddressFormControllers;
  final Function() nextStep;
  final Function() backStep;
  final Function(AddressFormType formType) onSelectProvince;
  final Function(AddressFormType formType) onSelectDistrict;
  final Function(AddressFormType formType) onSelectSubDistrict;
  final Function() onSwitchCurrentAddress;
  final Function(dynamic value) updateFormState;
  final Function(dynamic value) updateCurrentFormState;
  final Function(dynamic value) updateWorkingAddressFormState;
  final Stream<KycAddressFormState> formState;
  final Stream<KycAddressFormState> currentFormState;
  final Stream<KycAddressFormState> workingAddressFormState;
  final Function(String controllerName, {List<Enum> validateTypes})
      onValidateFormInput;
  final Function(String controllerName, {List<Enum> validateTypes})
      onValidateCurrentFormInput;
  final Widget nextButtonText;
  final Function(String controllerName, {List<Enum> validateTypes})
      onValidateWorkingAddressFormInput;

  final KycAddressViewModel viewModel;

  const KycAddressForm({
    super.key,
    required this.nextStep,
    required this.backStep,
    required this.onSelectProvince,
    required this.onSelectDistrict,
    required this.onSelectSubDistrict,
    required this.controllers,
    required this.onSwitchCurrentAddress,
    required this.currentControllers,
    required this.updateFormState,
    required this.formState,
    required this.updateCurrentFormState,
    required this.onValidateFormInput,
    required this.currentFormState,
    required this.onValidateCurrentFormInput,
    required this.nextButtonText,
    required this.workingAddressFormState,
    required this.workingAddressFormControllers,
    required this.updateWorkingAddressFormState,
    required this.onValidateWorkingAddressFormInput,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildAddressForm(),
        const SizedBox(
          height: Spacing.spacing40,
        ),
        const CustomDivider(),
        const SizedBox(
          height: Spacing.spacing40,
        ),
        _buildSelectionSection(),
        _buildCurrentAddressStreamer(),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        const CustomDivider(),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        _buildWorkingPlaceAddressSelection(),
        _buildWorkingPlaceAddressForm(),
        const SizedBox(
          height: Spacing.spacing20,
        ),
        _buildActionButtons(),
        SizedBox(
          height: paddingBottom(),
        )
      ],
    );
  }

  List<Widget> _addressForm() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: StreamBuilder<KycAddressFormState>(
                  stream: formState,
                  builder: (context, snapshot) {
                    return CustomTextField(
                      label: S.current.kycAddressNumber,
                      controller:
                          controllers[KycAddressFormStateFields.houseNumber],
                      onChanged: (value) {
                        updateFormState(
                            {KycAddressFormStateFields.houseNumber: value});
                      },
                      errorText: onValidateFormInput(
                          KycAddressFormStateFields.houseNumber),
                    );
                  }),
            ),
            const SizedBox(
              width: 21,
            ),
            Flexible(
              child: StreamBuilder<KycAddressFormState>(
                stream: formState,
                builder: (context, snapshot) {
                  return CustomTextField(
                    label: S.current.kycAddressMoo,
                    controller: controllers[KycAddressFormStateFields.moo],
                    onChanged: (value) {
                      updateFormState({KycAddressFormStateFields.moo: value});
                    },
                    // errorText:
                    //     onValidateFormInput(KycAddressFormStateFields.moo),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      CustomTextField(
        label: S.current.kycAddressOptional1,
        controller: controllers[KycAddressFormStateFields.houseName],
        onChanged: (value) {
          updateFormState({KycAddressFormStateFields.houseName: value});
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: CustomTextField(
              label: S.current.kycAddressSoi,
              controller: controllers[KycAddressFormStateFields.soi],
              onChanged: (value) {
                updateFormState({KycAddressFormStateFields.soi: value});
              },
            ),
          ),
          const SizedBox(
            width: 21,
          ),
          Flexible(
            child: CustomTextField(
              label: S.current.kycAddressRoad,
              controller: controllers[KycAddressFormStateFields.road],
              onChanged: (value) {
                updateFormState({KycAddressFormStateFields.road: value});
              },
            ),
          ),
        ],
      ),
      StreamBuilder<KycAddressFormState>(
        stream: formState,
        builder: (context, snapshot) {
          return CustomTextField(
            label: S.current.kycAddressProvince,
            placeholder: S.current.kycAddressProvincePlaceholder,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Image.asset(
                AssetIcons.arrowRight,
                width: 16,
                height: 16,
              ),
            ),
            readOnly: true,
            controller: controllers[KycAddressFormStateFields.province],
            onTap: () {
              onSelectProvince(AddressFormType.idCardAddress);
            },
            errorText: onValidateFormInput(KycAddressFormStateFields.province),
          );
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: StreamBuilder<KycAddressFormState>(
              stream: formState,
              builder: (context, snapshot) {
                return CustomTextField(
                  label: S.current.kycAddressDistinct,
                  placeholder: S.current.kycAddressDistrictPlaceholder,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: Image.asset(
                      AssetIcons.arrowRight,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  readOnly: true,
                  controller: controllers[KycAddressFormStateFields.district],
                  onTap: () {
                    viewModel.onSelectDistrict(AddressFormType.idCardAddress);
                  },
                  errorText:
                      onValidateFormInput(KycAddressFormStateFields.district),
                );
              },
            ),
          ),
          const SizedBox(
            width: 21,
          ),
          Flexible(
            child: StreamBuilder<KycAddressFormState>(
              stream: formState,
              builder: (context, snapshot) {
                return CustomTextField(
                  label: S.current.kycAddressSubDistinct,
                  placeholder: S.current.kycAddressSubDistrictPlaceholder,
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
                      controllers[KycAddressFormStateFields.subDistrict],
                  onTap: () {
                    onSelectSubDistrict(AddressFormType.idCardAddress);
                  },
                  errorText: onValidateFormInput(
                      KycAddressFormStateFields.subDistrict),
                );
              },
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: StreamBuilder<KycAddressFormState>(
              stream: formState,
              builder: (context, snapshot) {
                return CustomTextField(
                  label: S.current.kycAddressPostCode,
                  readOnly: true,
                  controller: controllers[KycAddressFormStateFields.postCode],
                  onChanged: (value) {
                    updateFormState(
                        {KycAddressFormStateFields.postCode: value});
                  },
                  errorText:
                      onValidateFormInput(KycAddressFormStateFields.postCode),
                );
              },
            ),
          ),
          // const SizedBox(
          //   width: 21,
          // ),
          // Flexible(
          //     child: CustomTextField(label: S.current.kycAddressCountry)),
        ],
      )
    ];
  }

  List<Widget> _currentAddressForm() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: StreamBuilder<KycAddressFormState>(
                stream: currentFormState,
                builder: (context, snapshot) {
                  return CustomTextField(
                    label: S.current.kycAddressNumber,
                    controller: currentControllers[
                        KycAddressFormStateFields.houseNumber],
                    onChanged: (value) {
                      updateCurrentFormState(
                          {KycAddressFormStateFields.houseNumber: value});
                    },
                    errorText: onValidateCurrentFormInput(
                        KycAddressFormStateFields.houseNumber),
                  );
                },
              ),
            ),
            const SizedBox(
              width: 21,
            ),
            Flexible(
              child: StreamBuilder<KycAddressFormState>(
                stream: currentFormState,
                builder: (context, snapshot) {
                  return CustomTextField(
                    label: S.current.kycAddressMoo,
                    controller:
                        currentControllers[KycAddressFormStateFields.moo],
                    onChanged: (value) {
                      updateCurrentFormState(
                          {KycAddressFormStateFields.moo: value});
                    },
                    // errorText: onValidateCurrentFormInput(
                    //     KycAddressFormStateFields.moo),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      CustomTextField(
        label: S.current.kycAddressOptional1,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: CustomTextField(
              label: S.current.kycAddressSoi,
              controller: currentControllers[KycAddressFormStateFields.soi],
              onChanged: (value) {
                updateCurrentFormState({KycAddressFormStateFields.soi: value});
              },
            ),
          ),
          const SizedBox(
            width: 21,
          ),
          Flexible(
            child: CustomTextField(
              label: S.current.kycAddressRoad,
              controller: currentControllers[KycAddressFormStateFields.road],
              onChanged: (value) {
                updateCurrentFormState({KycAddressFormStateFields.road: value});
              },
            ),
          ),
        ],
      ),
      StreamBuilder<KycAddressFormState>(
        stream: currentFormState,
        builder: (context, snapshot) {
          return CustomTextField(
            label: S.current.kycAddressProvince,
            placeholder: S.current.kycAddressProvincePlaceholder,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Image.asset(
                AssetIcons.arrowRight,
                width: 16,
                height: 16,
              ),
            ),
            readOnly: true,
            controller: currentControllers[KycAddressFormStateFields.province],
            onTap: () {
              onSelectProvince(AddressFormType.currentAddress);
            },
            errorText: onValidateCurrentFormInput(
              KycAddressFormStateFields.province,
            ),
          );
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: StreamBuilder<KycAddressFormState>(
              stream: currentFormState,
              builder: (context, snapshot) {
                return CustomTextField(
                  label: S.current.kycAddressDistinct,
                  placeholder: S.current.kycAddressDistrictPlaceholder,
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
                      currentControllers[KycAddressFormStateFields.district],
                  onTap: () {
                    onSelectDistrict(AddressFormType.currentAddress);
                  },
                  errorText: onValidateCurrentFormInput(
                    KycAddressFormStateFields.district,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            width: 21,
          ),
          Flexible(
            child: StreamBuilder<KycAddressFormState>(
              stream: currentFormState,
              builder: (context, snapshot) {
                return CustomTextField(
                  label: S.current.kycAddressSubDistinct,
                  placeholder: S.current.kycAddressSubDistrictPlaceholder,
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
                      currentControllers[KycAddressFormStateFields.subDistrict],
                  onTap: () {
                    onSelectSubDistrict(AddressFormType.currentAddress);
                  },
                  errorText: onValidateCurrentFormInput(
                    KycAddressFormStateFields.subDistrict,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: StreamBuilder<KycAddressFormState>(
              stream: currentFormState,
              builder: (context, snapshot) {
                return CustomTextField(
                    label: S.current.kycAddressPostCode,
                    readOnly: true,
                    controller:
                        currentControllers[KycAddressFormStateFields.postCode],
                    errorText: onValidateCurrentFormInput(
                        KycAddressFormStateFields.postCode));
              },
            ),
          ),
        ],
      )
    ];
  }

  Widget _buildAddressForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HilightText(
            text: S.current.kycAddressHeadline1,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          ..._addressForm(),
        ],
      ),
    );
  }

  Widget _buildSelection() {
    return Row(
      children: [
        Expanded(
          child: StreamBuilder<KycAddressFormState>(
            stream: formState,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  updateFormState(
                    {KycAddressFormStateFields.currentAddressIndex: 0},
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: snapshot.data?.currentAddressIndex == 0
                        ? blueColor
                        : lightGrey1Color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.5),
                    child: Center(
                      child: Text(
                        S.current.kycAddressSwitchOption1,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: snapshot.data?.currentAddressIndex == 0
                                ? whiteColor
                                : darkGreyColor),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: StreamBuilder<KycAddressFormState>(
            stream: formState,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  updateFormState(
                    {KycAddressFormStateFields.currentAddressIndex: 1},
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: snapshot.data?.currentAddressIndex == 1
                        ? blueColor
                        : lightGrey1Color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.5),
                    child: Center(
                      child: Text(
                        S.current.kycAddressSwitchOption2,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: snapshot.data?.currentAddressIndex == 1
                                ? whiteColor
                                : darkGreyColor),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildSelectionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HilightText(
            text: S.current.kycAddressHeadline2,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 21.0, bottom: 21.0),
            child: Container(
              decoration: BoxDecoration(
                color: lightGrey1Color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: _buildSelection(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentAddressStreamer() {
    return StreamBuilder<KycAddressFormState>(
      stream: formState,
      builder: (context, snapshot) {
        return Visibility(
          visible: snapshot.data?.currentAddressIndex == 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [..._currentAddressForm()],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: StreamBuilder<bool>(
                stream: viewModel.canSubmitState,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  return ElevatedButton(
                    onPressed: (snapshot.data! == true)
                        ? () {
                            nextStep();
                          }
                        : null,
                    child: nextButtonText,
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingPlaceAddressSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HilightText(
            text: S.current.kycWorkingAddressHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 21.0, bottom: 21.0),
            child: Container(
              decoration: BoxDecoration(
                color: lightGrey1Color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: StreamBuilder<KycAddressFormState>(
                          stream: formState,
                          builder: (context, snapshot) {
                            return GestureDetector(
                              onTap: () {
                                updateFormState(
                                  {
                                    KycAddressFormStateFields
                                        .workingPlaceAddressIndex: 0
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      snapshot.data?.workingPlaceAddressIndex ==
                                              0
                                          ? blueColor
                                          : lightGrey1Color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.5),
                                  child: Center(
                                    child: Text(
                                      S.of(context).kycAddressSwitchOption1,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: snapshot.data
                                                        ?.workingPlaceAddressIndex ==
                                                    0
                                                ? whiteColor
                                                : darkGreyColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: StreamBuilder<KycAddressFormState>(
                          stream: formState,
                          builder: (context, snapshot) {
                            return GestureDetector(
                              onTap: () {
                                updateFormState(
                                  {
                                    KycAddressFormStateFields
                                        .workingPlaceAddressIndex: 1
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      snapshot.data?.workingPlaceAddressIndex ==
                                              1
                                          ? blueColor
                                          : lightGrey1Color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.5),
                                  child: Center(
                                    child: Text(
                                      S.of(context).kycAddressSwitchOption3,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: snapshot.data
                                                          ?.workingPlaceAddressIndex ==
                                                      1
                                                  ? whiteColor
                                                  : darkGreyColor),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: StreamBuilder<KycAddressFormState>(
                          stream: formState,
                          builder: (context, snapshot) {
                            return GestureDetector(
                              onTap: () {
                                updateFormState({
                                  KycAddressFormStateFields
                                      .workingPlaceAddressIndex: 2
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      snapshot.data?.workingPlaceAddressIndex ==
                                              2
                                          ? blueColor
                                          : lightGrey1Color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.5),
                                  child: Center(
                                    child: Text(
                                      S.of(context).kycAddressSwitchOption2,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: snapshot.data
                                                          ?.workingPlaceAddressIndex ==
                                                      2
                                                  ? whiteColor
                                                  : darkGreyColor),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingPlaceAddressForm() {
    return StreamBuilder<KycAddressFormState>(
      stream: formState,
      builder: (context, snapshot) {
        return Visibility(
          visible: snapshot.data?.workingPlaceAddressIndex == 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            child: Column(
              children: [..._currentWorkingPlaceAddressForm()],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _currentWorkingPlaceAddressForm() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: StreamBuilder<KycAddressFormState>(
                  stream: workingAddressFormState,
                  builder: (context, snapshot) {
                    return CustomTextField(
                      label: S.current.kycAddressNumber,
                      controller: workingAddressFormControllers[
                          KycAddressFormStateFields.houseNumber],
                      onChanged: (value) {
                        updateWorkingAddressFormState(
                            {KycAddressFormStateFields.houseNumber: value});
                      },
                      errorText: onValidateWorkingAddressFormInput(
                          KycAddressFormStateFields.houseNumber),
                    );
                  }),
            ),
            const SizedBox(
              width: 21,
            ),
            Flexible(
              child: CustomTextField(
                label: S.current.kycAddressMoo,
                controller: workingAddressFormControllers[
                    KycAddressFormStateFields.moo],
                onChanged: (value) {
                  updateWorkingAddressFormState(
                      {KycAddressFormStateFields.moo: value});
                },
              ),
            ),
          ],
        ),
      ),
      CustomTextField(
        label: S.current.kycAddressOptional1,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: CustomTextField(
              label: S.current.kycAddressSoi,
              controller:
                  workingAddressFormControllers[KycAddressFormStateFields.soi],
              onChanged: (value) {
                updateWorkingAddressFormState(
                    {KycAddressFormStateFields.soi: value});
              },
            ),
          ),
          const SizedBox(
            width: 21,
          ),
          Flexible(
            child: CustomTextField(
              label: S.current.kycAddressRoad,
              controller:
                  workingAddressFormControllers[KycAddressFormStateFields.road],
              onChanged: (value) {
                updateWorkingAddressFormState(
                    {KycAddressFormStateFields.road: value});
              },
            ),
          ),
        ],
      ),
      StreamBuilder<KycAddressFormState>(
          stream: workingAddressFormState,
          builder: (context, snapshot) {
            return CustomTextField(
              label: S.current.kycAddressProvince,
              placeholder: S.current.kycAddressProvincePlaceholder,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Image.asset(
                  AssetIcons.arrowRight,
                  width: 16,
                  height: 16,
                ),
              ),
              readOnly: true,
              controller: workingAddressFormControllers[
                  KycAddressFormStateFields.province],
              onTap: () {
                onSelectProvince(AddressFormType.workingPlaceAddress);
              },
              errorText: onValidateWorkingAddressFormInput(
                  KycAddressFormStateFields.province),
            );
          }),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: StreamBuilder<KycAddressFormState>(
                stream: workingAddressFormState,
                builder: (context, snapshot) {
                  return CustomTextField(
                    label: S.current.kycAddressDistinct,
                    placeholder: S.current.kycAddressDistrictPlaceholder,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: Image.asset(
                        AssetIcons.arrowRight,
                        width: 16,
                        height: 16,
                      ),
                    ),
                    readOnly: true,
                    controller: workingAddressFormControllers[
                        KycAddressFormStateFields.district],
                    onTap: () {
                      onSelectDistrict(AddressFormType.workingPlaceAddress);
                    },
                    errorText: onValidateWorkingAddressFormInput(
                        KycAddressFormStateFields.district),
                  );
                }),
          ),
          const SizedBox(
            width: 21,
          ),
          Flexible(
            child: StreamBuilder<KycAddressFormState>(
                stream: workingAddressFormState,
                builder: (context, snapshot) {
                  return CustomTextField(
                    label: S.current.kycAddressSubDistinct,
                    placeholder: S.current.kycAddressSubDistrictPlaceholder,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: Image.asset(
                        AssetIcons.arrowRight,
                        width: 16,
                        height: 16,
                      ),
                    ),
                    readOnly: true,
                    controller: workingAddressFormControllers[
                        KycAddressFormStateFields.subDistrict],
                    onTap: () {
                      onSelectSubDistrict(AddressFormType.workingPlaceAddress);
                    },
                    errorText: onValidateWorkingAddressFormInput(
                        KycAddressFormStateFields.subDistrict),
                  );
                }),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: StreamBuilder<KycAddressFormState>(
                stream: workingAddressFormState,
                builder: (context, snapshot) {
                  return CustomTextField(
                    label: S.current.kycAddressPostCode,
                    readOnly: true,
                    controller: workingAddressFormControllers[
                        KycAddressFormStateFields.postCode],
                    errorText: onValidateWorkingAddressFormInput(
                        KycAddressFormStateFields.postCode),
                  );
                }),
          ),
        ],
      )
    ];
  }
}
