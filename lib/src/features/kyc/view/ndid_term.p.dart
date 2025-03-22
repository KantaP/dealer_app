import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/ndid_term.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class NdidTermView extends CustomView<NdidTermViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const NdidTermView(this.kycLevel2ViewModel,
      {required NdidTermViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<NdidTermView, NdidTermViewModel> createState() =>
      _NdidTermViewState(viewModel);
}

class _NdidTermViewState extends ViewState<NdidTermView, NdidTermViewModel> {
  _NdidTermViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
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
            text: S.current.kycNdidTermHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              AssetIcons.ndidLogo,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<String>(
            future: viewModel.loadNdidTerm(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data ?? '');
              }
              return Container();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    viewModel.cancelDialogAlert(context);
                  },
                  child: Text(
                    S.current.rejectButton,
                  ),
                ),
              ),
              const SizedBox(
                width: 21,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.next();
                  },
                  child: Text(
                    S.current.acceptButton,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
