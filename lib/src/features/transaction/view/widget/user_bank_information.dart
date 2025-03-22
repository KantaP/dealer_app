import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class UserBankInformation extends StatelessWidget {
  const UserBankInformation(
      {super.key,
      required this.bankName,
      required this.bankAccountName,
      required this.bankAccountNo});

  final String bankName;
  final String bankAccountName;
  final String bankAccountNo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(NavigationService.navigatorKey.currentContext!).recievedAccount,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        _buildBankNameRow(),
        const SizedBox(
          height: Spacing.spacing8,
        ),
        _buildBankAccountNameRow(),
        const SizedBox(
          height: Spacing.spacing8,
        ),
        _buildBankAccountNumberRow()
      ],
    );
  }

  Widget _buildBankNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(NavigationService.navigatorKey.currentContext!).bankName,
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Assets.icons.kbankLogo50.image(width: 24),
            // const SizedBox(
            //   width: 5,
            // ),
            Text(
              bankName,
              style: paragraph2Style,
            )
          ],
        )
      ],
    );
  }

  Widget _buildBankAccountNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(NavigationService.navigatorKey.currentContext!).bankAccountName,
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
        Text(
          bankAccountName,
          style: paragraph2Style,
        )
      ],
    );
  }

  Widget _buildBankAccountNumberRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(NavigationService.navigatorKey.currentContext!).bankNumber,
          style: paragraph2Style?.copyWith(color: darkGreyColor),
        ),
        Text(
          bankAccountNo,
          style: paragraph2Style,
        )
      ],
    );
  }
}
