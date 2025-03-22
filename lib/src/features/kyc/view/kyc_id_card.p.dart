import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_id_card.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';

class KycIdCardView extends CustomView<KycIdCardViewModel> {
  const KycIdCardView({required KycIdCardViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _KycIdCardViewState createState() => _KycIdCardViewState(viewModel);
}

class _KycIdCardViewState extends ViewState<KycIdCardView, KycIdCardViewModel> {
  _KycIdCardViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KYC ID CARD'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomTextField(
                label: 'ID card',
              ),
              ElevatedButton(
                onPressed: () => viewModel.gotoSetPin(),
                child: const Text('Continue'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
