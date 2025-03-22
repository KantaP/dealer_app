import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/transaction/bindings/transaction.binding.dart';
import 'package:aconnec_1109_x/src/features/user/bindings/user.binding.dart';
import 'package:aconnec_1109_x/src/features/user/model/user_usage_spend_today.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/loading/placeholder.dart';
import 'package:flutter/material.dart';

class UserSpendLimitContainer extends StatelessWidget {
  const UserSpendLimitContainer({super.key});

  Future<UserUsageSpendTodayModel> getSpendToday() async {
    final userDataService = UserBinding.userDataService;
    final orderService = TransactionBinding.orderService;

    try {
      final userData = await userDataService.getUserSpendLimit();
      final orderSpendToday = await orderService.orderSpendLimit();

      final sumOfOrderSpendBuy = orderSpendToday.spendBuyCompleted +
          orderSpendToday.spendBuyInCompleted;
      final sumOfOrderSpendSell = orderSpendToday.spendSellCompleted +
          orderSpendToday.spendSellInCompleted;

      final percentOfTodaySpendBuy =
          sumOfOrderSpendBuy / userData.spendLimitBuy;
      final percentOfTodaySpendSell =
          sumOfOrderSpendSell / userData.spendLimitSell;

      final usageData = UserUsageSpendTodayModel(
        limitBuy: userData.spendLimitBuy,
        limitSell: userData.spendLimitSell,
        usageBuy: sumOfOrderSpendBuy,
        usageSell: sumOfOrderSpendSell,
        usageBuyPercent:
            percentOfTodaySpendBuy.isNaN ? 0 : percentOfTodaySpendBuy,
        usageSellPercent:
            percentOfTodaySpendSell.isNaN ? 0 : percentOfTodaySpendSell,
      );
      return usageData;
    } on Exception catch (e) {
      DialogUtils.showToast(msg: e.toString(), type: 'error');
      return const UserUsageSpendTodayModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final userDataService = UserBinding.userDataService;
    return CustomFuture(
      future: userDataService.getCurrentUser(),
      customError: Container(),
      customLoading: Container(),
      builder: (_, snapshot) => Visibility(
        visible: snapshot.data!.kycLevel == 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: Spacing.spacing20),
          padding: const EdgeInsets.only(
            top: Spacing.spacing20,
            left: Spacing.spacing20,
            right: Spacing.spacing20,
            bottom: 15,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: blueColor.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(BorderRadiusSet.radius20),
              color: whiteColor),
          child: CustomFuture(
            future: getSpendToday(),
            customLoading: const ContentPlaceholder(
              lineType: ContentLineType.twoLines,
            ),
            builder: (_, snapshot) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Daily Limit',
                  style: titleStyle,
                ),
                const SizedBox(
                  height: Spacing.spacing10,
                ),
                _buildSpendBuyItem(usageData: snapshot.data!),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: Spacing.spacing16),
                  child: Divider(
                    thickness: 1.5,
                    color: blueColor.withOpacity(0.1),
                  ),
                ),
                _buildSpendSellItem(usageData: snapshot.data!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpendBuyItem({required UserUsageSpendTodayModel usageData}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BorderRadiusSet.radius20),
                color: greenColor.withOpacity(0.2),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spacing8, vertical: Spacing.spacing4),
              child: Text(
                'Buy limit',
                style: paragraph2Style?.copyWith(color: greenColor),
              ),
            ),
            const SizedBox(
              width: Spacing.spacing8,
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    usageData.usageBuy.toCurrency(),
                    style: paragraph3Style?.copyWith(color: blueColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.spacing4),
                    child: Text(
                      '/',
                      style: paragraph3Style,
                    ),
                  ),
                  Text(
                    usageData.limitBuy.toCurrency(),
                    style: paragraph3Style,
                  ),
                  const SizedBox(
                    width: Spacing.spacing4,
                  ),
                  Text(
                    'THB',
                    style: paragraph3Style,
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        LinearProgressIndicator(
          value: usageData.usageBuyPercent,
          color: greenColor,
          minHeight: 8,
          backgroundColor: lightGrey2Color,
        ),
      ],
    );
  }

  Widget _buildSpendSellItem({required UserUsageSpendTodayModel usageData}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BorderRadiusSet.radius20),
                color: redColor.withOpacity(0.2),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spacing8, vertical: Spacing.spacing4),
              child: Text(
                'Sell limit',
                style: paragraph2Style?.copyWith(color: redColor),
              ),
            ),
            const SizedBox(
              width: Spacing.spacing8,
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    usageData.usageSell.toCurrency(),
                    style: paragraph3Style?.copyWith(color: blueColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.spacing4),
                    child: Text(
                      '/',
                      style: paragraph3Style,
                    ),
                  ),
                  Text(
                    usageData.limitSell.toCurrency(),
                    style: paragraph3Style,
                  ),
                  const SizedBox(
                    width: Spacing.spacing4,
                  ),
                  Text(
                    'THB',
                    style: paragraph3Style,
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        LinearProgressIndicator(
          value: usageData.usageSellPercent,
          color: redColor,
          minHeight: 8,
          backgroundColor: lightGrey2Color,
        ),
      ],
    );
  }
}
