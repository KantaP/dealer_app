import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/address.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/enums/form_type.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/address_form.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

class KycAddressView extends CustomView<KycAddressViewModel> {
  final KycFinalViewModel kycViewModel;
  const KycAddressView(this.kycViewModel,
      {super.key, required KycAddressViewModel viewModel})
      : super.model(viewModel);

  @override
  _KycAddressViewState createState() => _KycAddressViewState(viewModel);
}

class _KycAddressViewState
    extends ViewState<KycAddressView, KycAddressViewModel> {
  _KycAddressViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycViewModel(widget.kycViewModel);
    viewModel.formListener();
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.getCurrentData();
  }

  @override
  Widget build(BuildContext context) {
    return KycAddressForm(
      viewModel: viewModel,
      nextStep: () {
        viewModel.onAddressFormSubmit();
      },
      backStep: () {
        widget.kycViewModel.pageController.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      },
      onSelectProvince: (AddressFormType formType) {
        viewModel.onSelectProvince(formType);
      },
      onSelectDistrict: (AddressFormType formType) {
        viewModel.onSelectDistrict(formType);
      },
      onSelectSubDistrict: (AddressFormType formType) {
        viewModel.onSelectSubDistrict(formType);
      },
      onSwitchCurrentAddress: () {},
      controllers: viewModel.addressFormController,
      currentControllers: viewModel.currentAddressFormController,
      workingAddressFormControllers: viewModel.workingAddressFormController,
      updateFormState: (value) {
        viewModel.updateAddressFormState(value);
      },
      updateCurrentFormState: (value) {
        viewModel.updateCurrentAddressFormState(value);
      },
      formState: viewModel.addressFormState,
      currentFormState: viewModel.currentAddressFormState,
      onValidateFormInput: (String controllerName,
          {List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty]}) {
        return viewModel.onAddressFormValidate(controllerName,
            validateTypes: validateTypes);
      },
      onValidateCurrentFormInput: (String controllerName,
          {List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty]}) {
        return viewModel.onCurrentAddressFormValidate(controllerName,
            validateTypes: validateTypes);
      },
      nextButtonText: StreamBuilder<KycFinalPageState>(
        stream: widget.kycViewModel.pageState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text((snapshot.data?.editMode == true)
                ? S.of(context).editButton
                : S.of(context).nextButton);
          }
          return const Text('');
        },
      ),
      workingAddressFormState: viewModel.workingAddressFormState,
      updateWorkingAddressFormState: (value) {
        viewModel.updateWorkingAddressFormState(value);
      },
      onValidateWorkingAddressFormInput: (String controllerName,
          {List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty]}) {
        return viewModel.onWorkingAddressFormValidate(controllerName,
            validateTypes: validateTypes);
      },
    );
  }
}
