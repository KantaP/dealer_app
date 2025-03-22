import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/add_bank_account.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dotted_container.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/dotted_upload_result.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class AddBackAccountView extends CustomView<AddBankAccountViewModel> {
  const AddBackAccountView(
      {required AddBankAccountViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<AddBackAccountView, AddBankAccountViewModel> createState() =>
      _AddBackAccountViewState(viewModel);
}

class _AddBackAccountViewState
    extends ViewState<AddBackAccountView, AddBankAccountViewModel> {
  _AddBackAccountViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultLayout(
          appBar: const DefaultAppBar(
            title: '',
          ),
          bodyPadding:
              const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
          slivers: [
            SliverToBoxAdapter(
              child: HilightText(
                text: S.of(context).verifyBankAccountTitle,
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
                controller: viewModel.formControllers[
                    AddBankAccountFormStateFields.bankAccountName],
                onChanged: (value) {
                  viewModel.updateFormState(
                      {AddBankAccountFormStateFields.bankAccountName: value});
                },
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 10)),
            SliverToBoxAdapter(
              child: StreamBuilder<AddBankAccountFormState>(
                  stream: viewModel.formState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CustomTextField(
                        label: S.of(context).verifyBankNameLabel,
                        readOnly: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 14.0),
                          child: Image.asset(
                            AssetIcons.arrowRight,
                            width: 16,
                            height: 16,
                          ),
                        ),
                        placeholder: S.of(context).verifyBankNamePlaceholder,
                        onTap: () {
                          viewModel.goToSelectBank();
                        },
                        controller: viewModel.formControllers[
                            AddBankAccountFormStateFields.bankName],
                        prefixIcon: (snapshot.data!.bankName.isNotEmpty)
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Image.asset(
                                  viewModel.getBankData().image,
                                  width: 16,
                                  height: 16,
                                ),
                              )
                            : null,
                      );
                    }
                    return Container();
                  }),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 10)),
            SliverToBoxAdapter(
              child: CustomTextField(
                label: S.of(context).verifyBankAccountNumberLabel,
                controller: viewModel.formControllers[
                    AddBankAccountFormStateFields.bankAccountNumber],
                onChanged: (value) {
                  viewModel.updateFormState(
                      {AddBankAccountFormStateFields.bankAccountNumber: value});
                },
                keyboardType: TextInputType.number,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 10)),
            SliverToBoxAdapter(
              child: CustomTextField(
                label: S.of(context).verifyBankAccountBranchLabel,
                controller: viewModel.formControllers[
                    AddBankAccountFormStateFields.bankAccountBranch],
                onChanged: (value) {
                  viewModel.updateFormState(
                      {AddBankAccountFormStateFields.bankAccountBranch: value});
                },
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 10)),
            SliverToBoxAdapter(
              child: StreamBuilder<AddBankAccountFormState>(
                  stream: viewModel.formState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return CustomDottedContainer(
                      onTapUpload: () {
                        viewModel.onUploadBookBank();
                      },
                      uploadPlaceholder:
                          S.of(context).verifyBankAccountUploadDescription,
                      content: (snapshot.data!.uploadBookBank == true)
                          ? DottedUploadResult(
                              imagePath: snapshot.data!.bookBankImagePath,
                              onRemove: () {
                                viewModel.onRemoveBookBank();
                              },
                            )
                          : null,
                    );
                  }),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 30)),
            SliverToBoxAdapter(
              child: StreamBuilder<AddBankAccountFormState>(
                  stream: viewModel.formState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return ElevatedButton(
                      onPressed: (viewModel.validateForm() == true)
                          ? () {
                              viewModel.submit();
                            }
                          : null,
                      child: Text(S.of(context).confirmButton),
                    );
                  }),
            ),
          ],
          physics: const BouncingScrollPhysics(),
          extendBody: true,
          safeAreaBottom: true,
        ),
        StreamBuilder<AddBankAccountPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) return Container();
            return Visibility(
                visible: snapshot.data!.isLoading, child: const Loading());
          },
        )
      ],
    );
  }
}
