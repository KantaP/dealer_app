import 'package:aconnec_1109_x/src/features/utilities/bindings/utilities.binding.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/model/request_user_bank_account.m.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/loading/placeholder.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../core/translate/generated/l10n.dart';
import '../../../theme/custom_theme.dart';
import '../../../widgets/app_bars/default_app_bar.dart';
import '../../../widgets/custom_dotted_container.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/hilight_text.dart';
import '../../../widgets/layouts/default_layout.dart';
import '../../../widgets/loading.dart';

class EditBankAccountScreen extends StatelessWidget {
  const EditBankAccountScreen({super.key, required this.accountData});

  final UserBankAccountModel accountData;

  @override
  Widget build(BuildContext context) {
    final vm = UtilitiesBinding.editBankAccount;

    return CustomFuture(
      future: vm.setFormValue(accountData),
      customLoading: DefaultLayout(
        appBar: const DefaultAppBar(
          title: '',
        ),
        bodyPadding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
        slivers: [
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HilightText(
                  text: 'ข้อมูลบัญชีธนาคาร',
                  hilightStyle: headline4BoldStyle?.merge(
                    const TextStyle(color: blueColor),
                  ),
                  normalStyle: headline4LightStyle,
                ),
                SizedBox(
                  height: Spacing.spacing20,
                ),
                ContentPlaceholder(lineType: ContentLineType.twoLines),
                SizedBox(
                  height: Spacing.spacing10,
                ),
                ContentPlaceholder(lineType: ContentLineType.twoLines),
                SizedBox(
                  height: Spacing.spacing10,
                ),
                ContentPlaceholder(lineType: ContentLineType.twoLines),
                SizedBox(
                  height: Spacing.spacing10,
                ),
                ContentPlaceholder(lineType: ContentLineType.twoLines),
                SizedBox(
                  height: Spacing.spacing10,
                ),
              ],
            ),
          ),
        ],
        physics: const NeverScrollableScrollPhysics(),
      ),
      builder: (_, snapshot) => DefaultLayout(
        appBar: const DefaultAppBar(
          title: '',
        ),
        bodyPadding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
        slivers: [
          SliverToBoxAdapter(
            child: HilightText(
              text: 'ข้อมูลบัญชีธนาคาร',
              hilightStyle: headline4BoldStyle?.merge(
                const TextStyle(color: blueColor),
              ),
              normalStyle: headline4LightStyle,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: CustomTextField(
                label: S.of(context).verifyBankAccountNameLabel,
                readOnly: true,
                controller: vm.bankAccountNameController
                // onChanged: (value) {
                //   viewModel.updateFormState(
                //       {AddBankAccountFormStateFields.bankAccountName: value});
                // },
                ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverToBoxAdapter(
            child: CustomTextField(
              label: 'ชื่อธนาคาร',
              readOnly: true,
              // suffixIcon: Padding(
              //   padding: const EdgeInsets.only(right: 14.0),
              //   child: Image.asset(
              //     AssetIcons.arrowRight,
              //     width: 16,
              //     height: 16,
              //   ),
              // ),
              placeholder: S.of(context).verifyBankNamePlaceholder,
              onTap: () {
                // viewModel.goToSelectBank();
              },
              controller: vm.bankNameController,
              prefixIcon: (vm.bankNameController.text.isNotEmpty)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        vm.getBankData(accountData.bankCode).image,
                        width: 16,
                        height: 16,
                      ),
                    )
                  : null,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverToBoxAdapter(
            child: CustomTextField(
              label: S.of(context).verifyBankAccountNumberLabel,
              controller: vm.bankAccountNumberController,
              readOnly: true,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverToBoxAdapter(
            child: CustomTextField(
              label: S.of(context).verifyBankAccountBranchLabel,
              controller: vm.bankAccountBranchController,
              readOnly: true,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 10)),
          SliverToBoxAdapter(
            child: CustomDottedContainer(
              onTapUpload: () {
                // viewModel.onUploadBookBank();
              },
              uploadPlaceholder:
                  S.of(context).verifyBankAccountUploadDescription,
              content: (accountData.bookBankStoragePath.isNotEmpty)
                  ? StorageImage(
                      storagePath:
                          vm.getStoragePath(accountData.bookBankStoragePath),
                      fileName: vm.getFileName(accountData.bookBankStoragePath),
                    )
                  : null,
            ),
          ),
        ],
        physics: const BouncingScrollPhysics(),
        extendBody: true,
        safeAreaBottom: true,
      ),
    );
  }
}
