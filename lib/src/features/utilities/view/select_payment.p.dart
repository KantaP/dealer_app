import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/widgets/bank_item.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/select_payment.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/select_payment.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

import '../../../model/request_user_bank_account.m.dart';

class SelectPaymentView extends CustomView<SelectPaymentViewModel> {
  const SelectPaymentView(
      {required SelectPaymentViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<SelectPaymentView, SelectPaymentViewModel> createState() =>
      _SelectPaymentViewState(viewModel);
}

class _SelectPaymentViewState
    extends ViewState<SelectPaymentView, SelectPaymentViewModel> {
  _SelectPaymentViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.getMyBanks();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    viewModel.getMyBanks();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                viewModel.goBack();
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: HilightText(
                      text: S.of(context).selectPaymentTitle,
                      hilightStyle: headline4BoldStyle?.merge(
                        const TextStyle(color: blueColor),
                      ),
                      normalStyle: headline4LightStyle,
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 20)),
                  // SliverToBoxAdapter(
                  //   child: StreamBuilder<SelectPaymentFormState>(
                  //       stream: viewModel.formState,
                  //       builder: (context, snapshot) {
                  //         if (snapshot.hasData == false) return Container();
                  //         return CustomTextField(
                  //           label: S.of(context).selectPaymentDropdownLabel,
                  //           readOnly: true,
                  //           suffixIcon: Padding(
                  //             padding: const EdgeInsets.only(right: 14.0),
                  //             child: Image.asset(
                  //               AssetIcons.arrowRight,
                  //               width: 16,
                  //               height: 16,
                  //             ),
                  //           ),
                  //           placeholder:
                  //               S.of(context).selectPaymentDropdownPlaceholder,
                  //           onTap: () {
                  //             viewModel.selectPayment();
                  //           },
                  //           prefixIcon: (snapshot
                  //                   .data!.selectedPayment.value.isNotEmpty)
                  //               ? Padding(
                  //                   padding: const EdgeInsets.only(left: 8.0),
                  //                   child: Image.asset(
                  //                       snapshot.data!.selectedPayment.icon),
                  //                 )
                  //               : null,
                  //           controller: viewModel.dropdownController,
                  //         );
                  //       }),
                  // ),
                  // const SliverPadding(padding: EdgeInsets.only(top: 0)),
                  SliverToBoxAdapter(
                    child: Text(
                      S.of(context).selectPaymentDescription,
                      style: paragraph2Style?.copyWith(color: darkGreyColor),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 10)),
                  const SliverToBoxAdapter(
                    child: Divider(
                      color: midGreyColor,
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 5)),
                  SliverToBoxAdapter(
                    child: Text(
                      S.of(context).selectPaymentListTitle,
                      style: paragraph2Style,
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 20)),
                  SliverToBoxAdapter(
                    child: StreamBuilder<SelectPaymentPageState>(
                        stream: viewModel.state,
                        builder: (context, snapshot) {
                          if (snapshot.hasData == false) return Container();
                          final length = (snapshot.data!.myBanks.length + 1);
                          // print(length);
                          return ListView.separated(
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              if (index == (length - 1)) {
                                return _buildAddButton();
                              }
                              final item = snapshot.data!.myBanks[index];
                              return _buildBankItem(item, index);
                            },
                            separatorBuilder: (_, index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: DottedLine(
                                  dashColor: blueColor,
                                ),
                              );
                            },
                            itemCount: length,
                          );
                        }),
                  ),
                  SliverToBoxAdapter(
                    child: StreamBuilder<SelectPaymentPageState>(
                        stream: viewModel.state,
                        builder: (context, snapshot) {
                          if (snapshot.hasData == false) return Container();
                          return Visibility(
                            visible:
                                snapshot.data?.myBanks.isEmpty ?? [].isEmpty,
                            child: SizedBox(
                              height: 331,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AssetImages.bankVerifyEmpty),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    S.of(context).selectPaymentEmptyState,
                                    style: paragraph2Style?.copyWith(
                                        color: midGreyColor),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          child: StreamBuilder<SelectPaymentFormState>(
                            stream: viewModel.formState,
                            builder: (context, snapshot) {
                              if (snapshot.hasData == false) {
                                return Container();
                              }
                              return ElevatedButton(
                                onPressed: (viewModel.validate() == false)
                                    ? null
                                    : () {
                                        viewModel.submit();
                                      },
                                child: Text(
                                  S.of(context).confirmButton,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const SliverPadding(padding: EdgeInsets.only(top: 32)),
                ],
              ),
            ),
          ),
        ),
        StreamBuilder<SelectPaymentPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data?.isLoading ?? false,
              child: const Loading(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBankItem(UserBankAccountModel item, int index) {
    return InkWell(
      onTap: () {
        viewModel.updateFormState({
          SelectPaymentFormStateFields.selectedBank: item,
          SelectPaymentFormStateFields.selectBankIndex: index,
        });
      },
      child: CustomStreamBuilder(
        stream: viewModel.formState,
        builder: (_, snapshot) => Stack(
          children: [
            BankItem(
              item: item,
            ),
            Visibility(
              visible: snapshot.data!.selectedBank == item,
              child: Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: Assets.icons.select16.image(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return InkWell(
      onTap: () {
        viewModel.addBank();
      },
      child: Row(
        children: [
          Image.asset(AssetIcons.add24),
          const SizedBox(
            width: 10,
          ),
          Text(
            S.of(context).addBankButton,
            style: paragraph1LightStyle?.copyWith(color: blueColor),
          )
        ],
      ),
    );
  }
}
