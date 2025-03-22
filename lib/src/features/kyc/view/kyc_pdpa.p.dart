import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_pdpa.vm.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:flutter/material.dart';

class KycPdpaView extends CustomView<KycPdpaViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;
  const KycPdpaView(this.kycLevel2ViewModel,
      {super.key, required KycPdpaViewModel viewModel})
      : super.model(viewModel);

  @override
  ViewState<KycPdpaView, KycPdpaViewModel> createState() =>
      _KycPdpaViewState(viewModel);
}

class _KycPdpaViewState extends ViewState<KycPdpaView, KycPdpaViewModel> {
  _KycPdpaViewState(super.viewModel);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.kycPdpaHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          FutureBuilder<String>(
            future: viewModel.loadPdpa(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data ?? '');
              }
              return Container();
            },
          ),
          InkWell(
            onTap: () {
              NavigationService.toNamed(RoutesConstant.appPrivacy);
            },
            child: Text(
              S.current.kycPdpaPrivacyPolicy,
              style: paragraph2Style?.copyWith(
                color: blueColor,
                decoration: TextDecoration.underline,
                decorationColor: blueColor,
              ),
            ),
          ),
          const SizedBox(
            height: Spacing.spacing40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    viewModel.reject();
                  },
                  child: Text(
                    S.current.doNotAccept,
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
                    S.current.accept,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
