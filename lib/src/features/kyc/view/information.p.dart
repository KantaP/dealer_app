import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/information.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/information_form.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

class KycInformationView extends CustomView<KycInformationViewModel> {
  final KycFinalViewModel kycViewModel;

  const KycInformationView(
    this.kycViewModel, {
    required KycInformationViewModel viewModel,
    Key? key,
  }) : super.model(viewModel, key: key);

  @override
  _KycInformationViewState createState() => _KycInformationViewState(viewModel);
}

class _KycInformationViewState
    extends ViewState<KycInformationView, KycInformationViewModel> {
  _KycInformationViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    viewModel.setKycViewModel(widget.kycViewModel);
    viewModel.setPageContext(context);
    viewModel.formStateListener();
    viewModel.controllerListener();
  }

  @override
  Widget build(BuildContext context) {
    return KycInformationForm(
      formErrorState: viewModel.informationFormErrorState,
      controllers: viewModel.informationFormControllers,
      nextStep: () {
        viewModel.onInformationFormSubmit();
      },
      updateFormState: (value) {
        viewModel.updateInformationFormState(value);
      },
      onValidateField: (String controllerName,
          {List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty]}) {
        return viewModel.onInformationValidate(controllerName,
            validateTypes: validateTypes);
      },
      formSubmitState: viewModel.informationFormSubmitState,
      formState: viewModel.informationFormState,
    );
  }
}
