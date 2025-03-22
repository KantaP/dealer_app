import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class UserManagePersonalDataViewScreen extends StatelessWidget {
  const UserManagePersonalDataViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        appBar: const DefaultAppBar(title: ''),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HilightText(
                    text: 'การจัดการข้อมูลส่วนบุคคล',
                    hilightStyle: headline4BoldStyle?.merge(
                      const TextStyle(color: blueColor),
                    ),
                    normalStyle: headline4LightStyle,
                  ),
                  const SizedBox(
                    height: Spacing.spacing24,
                  ),
                  _buildAconnecDescription(),
                  const SizedBox(
                    height: Spacing.spacing24,
                  ),
                  _buildAcceptMarketing(),
                  const SizedBox(
                    height: Spacing.spacing24,
                  ),
                  _buildAcceptFinancial(),
                  const SizedBox(
                    height: Spacing.spacing24,
                  ),
                  _buildAcceptDevelopment(),
                  const SizedBox(
                    height: Spacing.spacing24,
                  ),
                ],
              ),
            ),
          )
        ],
        physics: const BouncingScrollPhysics(),
        extendBody: true);
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
          // StreamBuilder<KycTermPageState>(
          //   stream: viewModel.state,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Checkbox(
          //           value: snapshot.data?.acceptAconnec ?? false,
          //           onChanged: (checked) {
          //             viewModel.updateState({
          //               KycTermPageStateFields.acceptAconnec: checked,
          //             });
          //           },
          //           side: const BorderSide(width: 1, color: midGreyColor));
          //     }
          //     return Container();
          //   },
          // ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    S.current.kycTermAcceptAconnecTitle,
                    style: paragraph2Style,
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                Flexible(
                  child: Text(
                    S.current.kycTermAcceptAconnecSubTitle,
                    style: paragraph2Style?.copyWith(color: darkGreyColor),
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                InkWell(
                  onTap: () {
                    // viewModel.goToTermCondition();
                  },
                  child: Text(
                    S.current.termMoreDetailButton,
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
          // StreamBuilder<KycTermPageState>(
          //     stream: viewModel.state,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return Checkbox(
          //           value: snapshot.data?.acceptRisk ?? false,
          //           onChanged: (checked) {
          //             viewModel.updateState({
          //               KycTermPageStateFields.acceptRisk: checked,
          //             });
          //           },
          //           side: const BorderSide(width: 1, color: midGreyColor),
          //         );
          //       }
          //       return Container();
          //     }),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: Text(
                    S.current.kycTermAcceptRiskTitle,
                    style: paragraph2Style,
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                Flexible(
                  child: Text(
                    S.current.kycTermAcceptRiskSubTitle,
                    style: paragraph2Style?.copyWith(color: darkGreyColor),
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                InkWell(
                  onTap: () {
                    // viewModel.showModalRisk();
                  },
                  child: Text(
                    S.current.termMoreDetailButton,
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
          // StreamBuilder<KycTermPageState>(
          //   stream: viewModel.state,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Checkbox(
          //           value: snapshot.data?.acceptCollectData ?? false,
          //           onChanged: (checked) {
          //             viewModel.updateState({
          //               KycTermPageStateFields.acceptCollectData: checked,
          //             });
          //           },
          //           side: const BorderSide(width: 1, color: midGreyColor));
          //     }
          //     return Container();
          //   },
          // ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    S.current.kycTermAcceptCollectDataTitle,
                    style: paragraph2Style,
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                Flexible(
                  child: Text(
                    S.current.kycTermAcceptCollectDataSubTitle,
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
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
      //   border: Border.all(
      //     width: 1,
      //     color: lightGrey1Color,
      //   ),
      // ),
      // padding: const EdgeInsets.symmetric(
      //     vertical: Spacing.spacing20, horizontal: Spacing.spacing16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              S.current.kycTermAconnecDescription,
              style: paragraph1RegularStyle,
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
            S.current.kycTermAcceptMarketingTitle,
            style: paragraph2Style,
          ),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          Text(
            S.current.kycTermAcceptMarketingSubTitle,
            style: paragraph2Style?.copyWith(color: darkGreyColor),
          ),
          // StreamBuilder<KycTermPageState>(
          //   stream: viewModel.state,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData == false) return Container();
          //     return CustomRadioField(
          //       label: '',
          //       values: viewModel.listRadio,
          //       onSelect: (selected) {
          //         viewModel.updateState(
          //           {
          //             KycTermPageStateFields.acceptToUseMarketing:
          //                 selected.value
          //           },
          //         );
          //       },
          //       radioType: RadioType.row,
          //       selected: snapshot.data!.acceptToUseMarketing == true
          //           ? viewModel.listRadio[0]
          //           : viewModel.listRadio[1],
          //     );
          //   },
          // ),
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
            S.current.kycTermAcceptFinancialTitle,
            style: paragraph2Style,
          ),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          Text(
            S.current.kycTermAcceptFinancialSubTitle,
            style: paragraph2Style?.copyWith(color: darkGreyColor),
          ),
          // StreamBuilder<KycTermPageState>(
          //   stream: viewModel.state,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData == false) return Container();
          //     return CustomRadioField(
          //       label: '',
          //       values: viewModel.listRadio,
          //       onSelect: (selected) {
          //         viewModel.updateState(
          //           {
          //             KycTermPageStateFields.acceptToUseFinancial:
          //                 selected.value
          //           },
          //         );
          //       },
          //       radioType: RadioType.row,
          //       selected: snapshot.data!.acceptToUseFinancial == true
          //           ? viewModel.listRadio[0]
          //           : viewModel.listRadio[1],
          //     );
          //   },
          // ),
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
            S.current.kycTermAcceptDevelopmentTitle,
            style: paragraph2Style,
          ),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          Text(
            S.current.kycTermAcceptDevelopmentSubTitle,
            style: paragraph2Style?.copyWith(color: darkGreyColor),
          ),
          // StreamBuilder<KycTermPageState>(
          //   stream: viewModel.state,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData == false) return Container();
          //     return CustomRadioField(
          //       label: '',
          //       values: viewModel.listRadio,
          //       onSelect: (selected) {
          //         viewModel.updateState(
          //           {
          //             KycTermPageStateFields.acceptToDevelopment: selected.value
          //           },
          //         );
          //       },
          //       radioType: RadioType.row,
          //       selected: snapshot.data!.acceptToUseDevelopment == true
          //           ? viewModel.listRadio[0]
          //           : viewModel.listRadio[1],
          //     );
          //   },
          // ),
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
              S.current.kycTermFooterDescription,
              style: paragraph2Style?.copyWith(color: darkGreyColor),
            ),
          ),
          InkWell(
            onTap: () {
              // viewModel.goToPrivacy();
            },
            child: Text(
              'นโยบายความเป็นส่วนตัว',
              style: paragraph2Style?.copyWith(
                  color: blueColor, decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
