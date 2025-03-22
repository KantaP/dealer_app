import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/qr_image.dart';
import 'package:aconnec_1109_x/src/widgets/warning_text_box.dart';
import 'package:flutter/material.dart';

class ShareDepositAddressSlip extends StatelessWidget {
  const ShareDepositAddressSlip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.spacing24),
      child: Column(
        children: [
          HilightText(
            text: 'Deposit BTC',
            normalStyle: headline4LightStyle,
            hilightStyle: headline4BoldStyle?.copyWith(color: blueColor),
          ),
          const SizedBox(
            height: Spacing.spacing8,
          ),
          Text(
            'Ensure the sender selects this crypto network',
            style: paragraph2LightStyle?.copyWith(color: blueColor),
          ),
          const SizedBox(
            height: Spacing.spacing8,
          ),
          _buildCoinName(),
          const SizedBox(
            height: Spacing.spacing8,
          ),
          _buildSelectedNetwork(),
          const SizedBox(
            height: Spacing.spacing8,
          ),
          _buildWarningText(),
          const SizedBox(
            height: Spacing.spacing8,
          ),
          _buildQrCode(),
          const SizedBox(
            height: Spacing.spacing8,
          ),
          _buildTotalPay(),
          const SizedBox(
            height: Spacing.spacing8,
          ),
          _buildReceiveAddress()
        ],
      ),
    );
  }

  Widget _buildCoinName() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
          border: Border.all(color: midGreyColor),
          color: lightGrey2Color),
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.spacing8,
        horizontal: Spacing.spacing10,
      ),
      child: Row(
        children: [
          //mock image
          Assets.icons.gasta24.image(),
          const SizedBox(
            width: Spacing.spacing10,
          ),
          Text(
            'GASTH',
            style: paragraph2Style,
          )
        ],
      ),
    );
  }

  Widget _buildSelectedNetwork() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S
              .of(NavigationService.navigatorKey.currentContext!)
              .waitingReceiveCoinNetworkLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Text(
          'Bitcoin',
          style: paragraph2Style,
        ),
      ],
    );
  }

  Widget _buildWarningText() {
    return const WarningTextBox(
      text:
          'Reminder : If you send any other crypto/token except BTC-Bitcoin to this address, you’ll lose your assets.',
    );
  }

  Widget _buildQrCode() {
    return const QrCustomImage(
      data: 'abcads2123',
      size: 225,
    );
  }

  Widget _buildTotalPay() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S
              .of(NavigationService.navigatorKey.currentContext!)
              .waitingReceiveCoinTotalPayLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Text(
          '0.01032600 BTC',
          style: headline4BoldStyle?.copyWith(color: blueColor),
        ),
      ],
    );
  }

  Widget _buildReceiveAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S
              .of(NavigationService.navigatorKey.currentContext!)
              .waitingReceiveCoinDepositAddressLabel,
          style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
        ),
        Text(
          'test123123123',
          style: paragraph2LightStyle,
        )
      ],
    );
  }
}
