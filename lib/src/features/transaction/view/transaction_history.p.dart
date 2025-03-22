import 'package:aconnec_1109_x/src/features/transaction/view/widget/transaction_card.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/transaction_history.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/transaction_history.vm.dart';
import 'package:aconnec_1109_x/src/model/request_payment_transaction.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/currency.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

import '../../../constants/spacing.dart';

class TransactionHistoryView extends CustomView<TransactionHistoryViewModel> {
  const TransactionHistoryView(
      {required TransactionHistoryViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<TransactionHistoryView, TransactionHistoryViewModel>
      createState() => _TransactionHistoryViewState(viewModel);
}

class _TransactionHistoryViewState
    extends ViewState<TransactionHistoryView, TransactionHistoryViewModel> {
  _TransactionHistoryViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => viewModel.goToHome(),
      child: DefaultLayout(
        appBar: DefaultAppBar(
          title: S.of(context).HistoryNavTitle,
          actions: [
            GestureDetector(
                onTap: () {
                  viewModel.goToDownload();
                },
                child: const Icon(Icons.download)),
            const SizedBox(
              width: 24,
            ),
          ],
          centerTitle: true,
        ),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children:
                          viewModel.menuList.map((e) => _buildMenu(e)).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: viewModel
                            .getFilterMenu()
                            .map((e) => _buildFilterItem(e))
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: StreamBuilder<TransactionHistoryPageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  return CustomFuture(
                    future: viewModel.loadOrderList(),
                    customLoading:
                        const Center(child: CircularProgressIndicator()),
                    builder: (_, futureSnapshot) => ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: futureSnapshot.data?.totalRows ?? 0,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final ResponseOrderGetModel? order =
                            futureSnapshot.data?.rows[index];
                        if (order != null) {
                          return TransactionCard(
                            order: order,
                          );
                        }
                        return null;
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: Spacing.spacing20),
                          child: const Divider(
                            color: dividerColor,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ],
        physics: const BouncingScrollPhysics(),
        extendBody: true,
      ),
    );
  }

  Widget _buildMenu(TransactionListItem e) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: InkWell(
        onTap: () {
          viewModel.selecteMenu(e.id ?? 0);
        },
        child: StreamBuilder<TransactionHistoryPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) return Container();
            return Container(
              decoration: BoxDecoration(
                border: (snapshot.data!.selectedMenuIndex == e.id)
                    ? const Border(
                        bottom: BorderSide(
                          color: blueColor,
                          width: 2,
                        ),
                      )
                    : null,
              ),
              child: Text(
                e.label ?? '',
                style: titleStyle?.copyWith(
                    color: snapshot.data!.selectedMenuIndex == e.id
                        ? blackColor
                        : midGreyColor),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterItem(TransactionListFilterItem e) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: () => viewModel.selectFilter(e.id ?? 0),
        child: StreamBuilder<TransactionHistoryPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              if (snapshot.data!.selectedFilterIndex == e.id) {
                return _buildFilterActiveItem(e);
              }
              return _buildFilterInactiveItem(e);
            }),
      ),
    );
  }

  Widget _buildFilterActiveItem(TransactionListFilterItem e) {
    return Container(
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Text(
          e.label ?? '',
          style: paragraph2Style?.copyWith(color: whiteColor),
        ),
      ),
    );
  }

  Widget _buildFilterInactiveItem(TransactionListFilterItem e) {
    return Container(
      decoration: BoxDecoration(
        color: lightGrey1Color,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          e.label ?? '',
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
      ),
    );
  }

  Widget _buildTransactionItem(PaymentTransactionModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //transaction type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  (model.transactionType.isNotEmpty)
                      ? Text(
                          (model.transactionType == ExchangeMode.buy.name)
                              ? S.of(context).buy
                              : S.of(context).sell,
                          style: paragraph1RegularStyle?.copyWith(
                            color:
                                (model.transactionType == ExchangeMode.buy.name)
                                    ? greenColor
                                    : redColor,
                          ),
                        )
                      : const Text('n/a'),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Image.asset(AssetIcons.gasta24),
                  ),
                  Text(S.of(context).gasth)
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model.status,
                    style:
                        paragraph1RegularStyle?.copyWith(color: midGreyColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(AssetIcons.historyArrowForward16),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //gasth price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Gasth Price',
                    style: paragraph2Style?.copyWith(
                      color: darkGreyColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      CurrencyUtils.toTHB(1.03),
                      style: paragraph2Style,
                    ),
                  ),
                ],
              ),
              (model.createdAt.isNotEmpty)
                  ? Text(
                      DateTimeUtils.dateTimeFormat(
                          DateTime.parse(model.createdAt).toLocal(),
                          'dd-MM-yyyy, hh:mm:ss'),
                      style:
                          paragraph2LightStyle?.copyWith(color: midGreyColor),
                    )
                  : const Text(''),
            ],
          ),
          //gasth receive
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gasth Receive',
                style: paragraph2Style?.copyWith(
                  color: darkGreyColor,
                ),
              ),
              Text(
                CurrencyUtils.toGasth(model.gastaAmount),
                style: paragraph2Style,
              ),
            ],
          ),
          //thb pay
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'THB Pay',
                style: paragraph2Style?.copyWith(
                  color: darkGreyColor,
                ),
              ),
              Text(
                CurrencyUtils.toTHB(model.total),
                style: paragraph2Style,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            color: midGreyColor,
          )
        ],
      ),
    );
  }
}
