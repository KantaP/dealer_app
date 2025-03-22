import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_term.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_term.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

import '../../../widgets/custom_checkbox.dart';

class KycTermView extends CustomView<KycTermViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const KycTermView(this.kycLevel2ViewModel,
      {super.key, required KycTermViewModel viewModel})
      : super.model(viewModel);

  @override
  _KycTermViewState createState() => _KycTermViewState(viewModel);
}

class _KycTermViewState extends ViewState<KycTermView, KycTermViewModel> {
  _KycTermViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
  }

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.kycTermHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          Text(
            S.of(context).kycTermSubHeadline,
            style: titleStyle,
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          _buildAcceptAconnec(),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          _buildAcceptRisk(),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          // _buildAcceptCollectData(),
          // const SizedBox(
          //   height: Spacing.spacing40,
          // ),
          Text(
            S.of(context).kycTermPersonalDataAcceptHeadline,
            style: titleStyle,
          ),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          _buildAconnecDescription(),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          _buildAcceptMarketing(),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          _buildAcceptFinancial(),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          _buildAcceptDevelopment(),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          _buildFooter(),
          // const SizedBox(
          //   height: Spacing.spacing40,
          // ),
          const Spacer(),
          StreamBuilder<KycTermPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return ElevatedButton(
                onPressed: viewModel.canSubmit()
                    ? () {
                        viewModel.next();
                      }
                    : null,
                child: Text(
                  S.of(context).confirmButton,
                ),
              );
            },
          ),
          SizedBox(
            height: (paddingBottom == 0) ? Spacing.spacing24 : paddingBottom,
          )
        ],
      ),
    );
  }

  Widget _buildAcceptAconnec() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
        border: Border.all(
          width: 1,
          color: lightGrey1Color,
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.spacing20, horizontal: Spacing.spacing16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<KycTermPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomCheckbox(
                  value: snapshot.data?.acceptAconnec ?? false,
                  onChanged: (checked) {
                    viewModel.updateState({
                      KycTermPageStateFields.acceptAconnec: checked,
                    });
                  },
                );
              }
              return Container();
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    S.of(context).kycTermAcceptAconnecTitle,
                    style: paragraph2Style,
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                Flexible(
                  child: Text(
                    S.of(context).kycTermAcceptAconnecSubTitle,
                    style: paragraph2Style?.copyWith(color: darkGreyColor),
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                InkWell(
                  onTap: () {
                    viewModel.goToTermCondition();
                  },
                  child: Text(
                    S.of(context).termMoreDetailButton,
                    style: paragraph2Style?.copyWith(color: blueColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAcceptRisk() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
        border: Border.all(
          width: 1,
          color: lightGrey1Color,
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.spacing20, horizontal: Spacing.spacing16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<KycTermPageState>(
              stream: viewModel.state,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomCheckbox(
                    value: snapshot.data?.acceptRisk ?? false,
                    onChanged: (checked) {
                      viewModel.updateState({
                        KycTermPageStateFields.acceptRisk: checked,
                      });
                    },
                  );
                }
                return Container();
              }),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: Text(
                    S.of(context).kycTermAcceptRiskTitle,
                    style: paragraph2Style,
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                Flexible(
                  child: Text(
                    S.of(context).kycTermAcceptRiskSubTitle,
                    style: paragraph2Style?.copyWith(color: darkGreyColor),
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                InkWell(
                  onTap: () {
                    viewModel.goToRiskCondition();
                  },
                  child: Text(
                    S.of(context).termMoreDetailButton,
                    style: paragraph2Style?.copyWith(color: blueColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAcceptCollectData() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
        border: Border.all(
          width: 1,
          color: lightGrey1Color,
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.spacing20, horizontal: Spacing.spacing16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<KycTermPageState>(
              stream: viewModel.state,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomCheckbox(
                    value: snapshot.data?.acceptCollectData ?? false,
                    onChanged: (checked) {
                      viewModel.updateState({
                        KycTermPageStateFields.acceptCollectData: checked,
                      });
                    },
                  );
                }
                return Container();
              }),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    S.of(context).kycTermAcceptCollectDataTitle,
                    style: paragraph2Style,
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                Flexible(
                  child: Text(
                    S.of(context).kycTermAcceptCollectDataSubTitle,
                    style: paragraph2Style?.copyWith(color: darkGreyColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAconnecDescription() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
        border: Border.all(
          width: 1,
          color: lightGrey1Color,
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.spacing20, horizontal: Spacing.spacing16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              S.of(context).kycTermAconnecDescription,
              style: paragraph2Style?.copyWith(color: darkGreyColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptMarketing() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
        border: Border.all(
          width: 1,
          color: lightGrey1Color,
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.spacing20, horizontal: Spacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).kycTermAcceptMarketingTitle,
            style: paragraph2Style,
          ),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          Text(
            S.of(context).kycTermAcceptMarketingSubTitle,
            style: paragraph2Style?.copyWith(color: darkGreyColor),
          ),
          StreamBuilder<KycTermPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return CustomRadioField(
                label: '',
                values: viewModel.listRadio,
                onSelect: (selected) {
                  viewModel.updateState(
                    {
                      KycTermPageStateFields.acceptToUseMarketing:
                          selected.value
                    },
                  );
                },
                radioType: RadioType.row,
                selected: snapshot.data!.acceptToUseMarketing == true
                    ? viewModel.listRadio[0]
                    : viewModel.listRadio[1],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptFinancial() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
        border: Border.all(
          width: 1,
          color: lightGrey1Color,
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.spacing20, horizontal: Spacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).kycTermAcceptFinancialTitle,
            style: paragraph2Style,
          ),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          Text(
            S.of(context).kycTermAcceptFinancialSubTitle,
            style: paragraph2Style?.copyWith(color: darkGreyColor),
          ),
          StreamBuilder<KycTermPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return CustomRadioField(
                label: '',
                values: viewModel.listRadio,
                onSelect: (selected) {
                  viewModel.updateState(
                    {
                      KycTermPageStateFields.acceptToUseFinancial:
                          selected.value
                    },
                  );
                },
                radioType: RadioType.row,
                selected: snapshot.data!.acceptToUseFinancial == true
                    ? viewModel.listRadio[0]
                    : viewModel.listRadio[1],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptDevelopment() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
        border: Border.all(
          width: 1,
          color: lightGrey1Color,
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.spacing20, horizontal: Spacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).kycTermAcceptDevelopmentTitle,
            style: paragraph2Style,
          ),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          Text(
            S.of(context).kycTermAcceptDevelopmentSubTitle,
            style: paragraph2Style?.copyWith(color: darkGreyColor),
          ),
          StreamBuilder<KycTermPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return CustomRadioField(
                label: '',
                values: viewModel.listRadio,
                onSelect: (selected) {
                  viewModel.updateState(
                    {
                      KycTermPageStateFields.acceptToDevelopment: selected.value
                    },
                  );
                },
                radioType: RadioType.row,
                selected: snapshot.data!.acceptToUseDevelopment == true
                    ? viewModel.listRadio[0]
                    : viewModel.listRadio[1],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
        border: Border.all(
          width: 1,
          color: lightGrey1Color,
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.spacing20, horizontal: Spacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              S.of(context).kycTermFooterDescription,
              style: paragraph2Style?.copyWith(color: darkGreyColor),
            ),
          ),
          InkWell(
            onTap: () {
              viewModel.goToPrivacy();
            },
            child: Text(
              S.current.privacyPolicy,
              style: paragraph2Style?.copyWith(
                  color: blueColor, decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
