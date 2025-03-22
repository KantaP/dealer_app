import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/transaction_download.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/transaction_download.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_new.abs.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/warning_text_box.dart';
import 'package:flutter/material.dart';

class TransactionDownloadView
    extends CustomViewScreen<TransactionDownloadViewModel> {
  const TransactionDownloadView(
      {super.key, required TransactionDownloadViewModel viewModel})
      : super.model(viewModel);

  @override
  CustomViewState<TransactionDownloadView, TransactionDownloadViewModel>
      createState() => _TransactionDownloadViewState(viewModel);
}

class _TransactionDownloadViewState extends CustomViewState<
    TransactionDownloadView, TransactionDownloadViewModel> {
  _TransactionDownloadViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: DefaultAppBar(
        title: S.of(context).DownloadTransactionNavTitle,
        centerTitle: true,
      ),
      safeAreaBottom: true,
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: Spacing.spacing20),
        ),
        // _buildSelectDocType(),
        // const SliverToBoxAdapter(
        //   child: SizedBox(height: Spacing.spacing20),
        // ),
        _buildWarningText(),
        const SliverToBoxAdapter(
          child: SizedBox(height: Spacing.spacing20),
        ),
        _buildSelectDate(),
        const SliverToBoxAdapter(
          child: SizedBox(height: Spacing.spacing20),
        ),
        _buildEmail(),
        _buildSubmitButton(),
      ],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: false,
    );
  }

  Widget _buildSelectDocType() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${S.of(context).transactionDownloadLabel1} :',
              style: paragraph2Style,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                _buildSelectItem(HistoryDocType.statement),
                const SizedBox(
                  width: Spacing.spacing10,
                ),
                _buildSelectItem(HistoryDocType.taxInvoice)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectItem(HistoryDocType docType) {
    return StreamBuilder<TransactionDownloadPageState>(
        stream: viewModel.stateSubject.state(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) return Container();
          return InkWell(
            onTap: () {
              final updatePageState =
                  snapshot.data!.copyWith(docType: docType.name);
              viewModel.updateState(updatePageState);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: snapshot.data!.docType == docType.name
                    ? blueColor
                    : lightGrey1Color,
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spacing20, vertical: Spacing.spacing10),
              child: Center(
                child: Text(
                  docType == HistoryDocType.statement
                      ? S.of(context).transactionDownloadStatementLabel
                      : S.of(context).transactionDownloadTaxInvoiceLabel,
                  style: paragraph2Style?.copyWith(
                      color: snapshot.data!.docType == docType.name
                          ? whiteColor
                          : darkGreyColor),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildWarningText() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      sliver: SliverToBoxAdapter(
        child: WarningTextBox(
          text: S.of(context).transactionDownloadWarningText,
        ),
      ),
    );
  }

  Widget _buildSelectDate() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).DownloadTransactionTimeLabel,
              style: paragraph2Style,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomTextField(
                    label: '',
                    suffixIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: Align(
                        child: Assets.svgImages.canlendarOutline.svg(),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => viewModel.onSelectStartDate(),
                    controller: viewModel.startDateController,
                  ),
                ),
                const SizedBox(
                  width: Spacing.spacing8,
                ),
                const Text('-'),
                const SizedBox(
                  width: Spacing.spacing8,
                ),
                Expanded(
                  child: CustomTextField(
                    label: '',
                    suffixIcon: SizedBox(
                      height: 24,
                      width: 24,
                      child: Align(
                        child: Assets.svgImages.canlendarOutline.svg(),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => viewModel.onSelectEndDate(),
                    controller: viewModel.endDateController,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      sliver: SliverToBoxAdapter(
        child: CustomTextField(
          label: S.current.DownloadTransactionEmailLabel,
          onChanged: (value) {
            final newState =
                viewModel.stateSubject.subject.value.copyWith(email: value);
            viewModel.updateState(newState);
          },
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      sliver: SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            StreamBuilder<TransactionDownloadPageState>(
                stream: viewModel.stateSubject.state(),
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  return ElevatedButton(
                    onPressed: (viewModel.canSubmit())
                        ? () {
                            viewModel.onSubmit();
                          }
                        : null,
                    child: Text(
                      S.of(context).DownloadTransactionSubmitButton,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
