import 'package:aconnec_1109_x/src/constants/banks.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

import '../model/request_user_bank_account.m.dart';

class BankItem extends StatelessWidget {
  const BankItem({super.key, required this.item});

  final UserBankAccountModel item;

  @override
  Widget build(BuildContext context) {
    final bankData = BankData.bankList
        .where((e) => e.code == item.bankCode.toLowerCase())
        .toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Image.asset(
                bankData[0].image,
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.bankName,
                  style: paragraph2Style,
                ),
                Text(
                  item.bankAccountNumber,
                  style: paragraph3Style?.copyWith(color: midGreyColor),
                )
              ],
            )
          ],
        ),
        Text(
          item.bankStatus,
          style: paragraph3Style?.copyWith(
              color: item.bankStatus == 'verified'
                  ? greenColor
                  : item.bankStatus == 'reject'
                      ? redColor
                      : yellowColor),
        ),
      ],
    );
  }
}
