import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/bank_ndid.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/bank_ndid.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';

class BankNdidView extends CustomView<BankNdidViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const BankNdidView(this.kycLevel2ViewModel,
      {required BankNdidViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<BankNdidView, BankNdidViewModel> createState() =>
      _BankNdidViewState(viewModel);
}

class _BankNdidViewState extends ViewState<BankNdidView, BankNdidViewModel> {
  _BankNdidViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    // viewModel.mockupData();
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.getIdpList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.bankNdidHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExpandablePanel(
                header: Text(
                  S.of(context).bankNdidExpandHeadline1,
                  style: paragraph1RegularStyle,
                ),
                collapsed: _buildBankRegisterBody(),
                expanded: const Text(''),
              ),
              ExpandablePanel(
                header: Text(
                  S.of(context).bankNdidExpandHeadline2,
                  style: paragraph1RegularStyle,
                ),
                collapsed: _buildBankUnregisterBody(),
                expanded: const Text(''),
              ),
            ],
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.next();
            },
            child: Text(
              S.current.nextButton,
            ),
          ),
          SizedBox(
            height: paddingBottom(),
          )
        ],
      ),
    );
  }

  Widget _buildBankRegisterBody() {
    final stateValue = viewModel.stateSubject.value;
    List<IdpModel> registerBank = stateValue.ndidBankRegister;
    return SizedBox(
      width: double.infinity,
      // margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 40),
        child: (registerBank.isNotEmpty)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).bankNdidUnregister,
                    style: paragraph2Style?.copyWith(color: darkGreyColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 0,
                    runSpacing: 10,
                    children: registerBank
                        .map(
                          (e) => _buildBankItem(
                            e,
                          ),
                        )
                        .toList(),
                  ),
                ],
              )
            : Text(
                S.of(context).bankNdidNeverRegister,
                style: paragraph2Style?.copyWith(color: darkGreyColor),
              ),
      ),
    );
  }

  Widget _buildBankUnregisterBody() {
    final stateValue = viewModel.stateSubject.value;
    List<IdpModel> unregisterBank = stateValue.ndidBankUnRegister;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: (unregisterBank.isNotEmpty)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).bankNdidUnregister,
                    style: paragraph2Style?.copyWith(color: darkGreyColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 0,
                    runSpacing: 0,
                    children: unregisterBank
                        .map(
                          (e) => _buildBankItem(
                            e,
                          ),
                        )
                        .toList(),
                  ),
                ],
              )
            : Text(
                S.of(context).bankNdidCannotRegister,
                style: paragraph2Style?.copyWith(color: darkGreyColor),
              ),
      ),
    );
  }

  Widget _buildBankItem(IdpModel e) {
    return GestureDetector(
      onTap: () {
        viewModel.updateState({
          BankNdidPageStateFields.selectedIdItem: e.id,
        });
      },
      child: Stack(
        children: [
          CustomStreamBuilder(
            stream: viewModel.state,
            builder: (_, snapshot) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: snapshot.data!.selectedIdItem == e.id
                    ? blueColor.withOpacity(0.25)
                    : Colors.transparent,
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 90,
                    width: 80,
                  ),
                  Text('')
                ],
              ),
            ),
          ),
          Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(Spacing.spacing10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: StorageImage(
                      fileName: '${e.id}.png',
                      storagePath: FirebaseStorageValue.idpIconsRef,
                    ),
                  ),
                  const SizedBox(
                    height: Spacing.spacing10,
                  ),
                  Text(
                    e.code,
                    style: paragraph1RegularStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
