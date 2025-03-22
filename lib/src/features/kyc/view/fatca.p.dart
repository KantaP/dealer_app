import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/accept_law.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/fatca.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class FatcaView extends CustomView<FatcaViewModel> {
  final KycFinalViewModel kycViewModel;

  const FatcaView(this.kycViewModel,
      {required FatcaViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _FatcaViewState createState() => _FatcaViewState(viewModel);
}

class _FatcaViewState extends ViewState<FatcaView, FatcaViewModel> {
  _FatcaViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycViewModel(widget.kycViewModel);
    viewModel.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.kycAcceptLawHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: Spacing.spacing20),
            child: Text(
              S.current.kycAcceptLawContentTitle,
              style: paragraph2Style,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('\u2022'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      S.current.kycAcceptLawContentRole1,
                      style: paragraph2Style?.copyWith(color: darkGreyColor),
                      maxLines: 2,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('\u2022'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      S.current.kycAcceptLawContentRole2,
                      style: paragraph2Style?.copyWith(color: darkGreyColor),
                      maxLines: 2,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 4.0),
            child: Row(
              children: [
                const Text(' '),
                GestureDetector(
                  onTap: () {
                    viewModel.openFatcaDocument();
                  },
                  child: Text(
                    S.current.kycAcceptLawDocumentLink,
                    style: paragraph2Style?.copyWith(
                        color: softBlue, decoration: TextDecoration.underline),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<AcceptLawState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                RadioValue selected = RadioValue(value: snapshot.data!.accept);
                return CustomRadioField(
                  label: '',
                  values: <RadioValue>[
                    RadioValue(title: S.of(context).yes, value: true),
                    RadioValue(title: S.of(context).no, value: false),
                  ],
                  onSelect: (selected) {
                    viewModel.updateState(
                      {AcceptLawStateFields.accept: selected.value as bool},
                    );
                  },
                  selected: selected,
                );
              }
              return Container();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: Spacing.spacing20),
            child: Text(
              S.current.kycAcceptLawFooter,
              style: paragraph2Style?.copyWith(color: darkGreyColor),
            ),
          ),
          // const SizedBox(
          //   height: Spacing.spacing20,
          // ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              viewModel.next();
            },
            child: Text(S.of(context).nextButton),
          ),
          SizedBox(
            height: paddingBottom(),
          )
        ],
      ),
    );
  }
}
