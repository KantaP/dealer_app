import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/fund.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/enums/form_type.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/fund_form.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

class KycFundView extends CustomView<KycFundViewModel> {
  final KycFinalViewModel kycViewModel;

  const KycFundView(this.kycViewModel,
      {super.key, required KycFundViewModel viewModel})
      : super.model(viewModel);

  @override
  _KycFundViewState createState() => _KycFundViewState(viewModel);
}

class _KycFundViewState extends ViewState<KycFundView, KycFundViewModel> {
  _KycFundViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycViewModel(widget.kycViewModel);
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.getCurrentData();
  }

  @override
  Widget build(BuildContext context) {
    return KycFundForm(
      fundFormControllers: viewModel.fundFormControllers,
      nextStep: () {
        viewModel.onFundFormSubmit();
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
      // onSelectOccupations: () {
      //   viewModel.onSelectOccupations();
      // },
      fundFormState: viewModel.fundFormState,
      updateFundFormState: (value) {
        viewModel.updateFundFormState(value);
      },
      workingAddressFormControllers: viewModel.workingPlaceAddressControllers,
      onValidateWorkingAddressFormInput: (String controllerName,
          {List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty]}) {
        return viewModel.onWorkingAddressFormValidate(controllerName,
            validateTypes: validateTypes);
      },
      updateWorkingAddressFormState: (value) {
        viewModel.updateWorkingAddressFormState(value);
      },
      onValidateFundFormInput: (String controllerName,
          {List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty]}) {
        return viewModel.onFundFormValidate(controllerName,
            validateTypes: validateTypes);
      },
      workingAddressFormState: viewModel.workingAddressFormState,
      onUploadAnotherJobDocument: viewModel.onUploadAnotherJobDocument,
      onUploadAnotherJobAssetDocument:
          viewModel.onUploadAnotherJobAssetDocument,
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
      viewModel: viewModel,
    );
  }
}
