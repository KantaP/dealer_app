import 'package:aconnec_1109_x/src/features/kyc/view/widgets/select_box.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_select_national.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_select_national.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class KycSelectNationalView extends CustomView<KycSelectNationalViewModel> {
  const KycSelectNationalView(
      {required KycSelectNationalViewModel viewModel, super.key})
      : super.model(viewModel);
  @override
  ViewState<KycSelectNationalView, KycSelectNationalViewModel> createState() =>
      _KycSelectNationalViewState(viewModel);
}

class _KycSelectNationalViewState
    extends ViewState<KycSelectNationalView, KycSelectNationalViewModel> {
  _KycSelectNationalViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
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
            text: S.of(context).kycSelectNationalHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: StreamBuilder<KycSelectNationalPageState>(
                    stream: viewModel.pageState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      return GestureDetector(
                        onTap: () {
                          viewModel.selectItem(National.thai.name);
                        },
                        child: SelectBox(
                          image: Assets.images.thaiNational.image(width: 60),
                          label: Text(
                            S.of(context).kycSelectNationalOption1,
                            style: titleStyle,
                          ),
                          activate:
                              snapshot.data!.selected == National.thai.name
                                  ? true
                                  : false,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                width: Spacing.spacing20,
              ),
              Expanded(
                child: StreamBuilder<KycSelectNationalPageState>(
                  stream: viewModel.pageState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return GestureDetector(
                      onTap: () {
                        // viewModel.selectItem(National.foreigner.name);
                      },
                      child: SelectBox(
                        image: Assets.images.otherNational.image(width: 60),
                        label: HilightText(
                          text: S.of(context).kycSelectNationalOption2,
                          hilightStyle: titleStyle?.merge(
                            const TextStyle(color: midGreyColor),
                          ),
                          normalStyle: titleStyle,
                          textAlign: TextAlign.center,
                        ),
                        activate:
                            snapshot.data!.selected == National.foreigner.name
                                ? true
                                : false,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          const Spacer(),
          StreamBuilder<KycSelectNationalPageState>(
            stream: viewModel.pageState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return ElevatedButton(
                onPressed: (snapshot.data!.selected == '')
                    ? null
                    : () {
                        viewModel.submit();
                      },
                child: Text(S.of(context).nextButton),
              );
            },
          ),
          const SizedBox(
            height: Spacing.spacing24,
          )
        ],
      ),
    );
  }
}
