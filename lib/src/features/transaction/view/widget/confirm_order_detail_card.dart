import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class ConfirmOrderDetailCard extends StatelessWidget {
  final String label;
  final Widget image;
  final String amount;
  final String currency;
  final String side;

  const ConfirmOrderDetailCard({
    super.key,
    required this.label,
    required this.image,
    required this.amount,
    required this.currency,
    this.side = 'base',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 129,
      constraints: const BoxConstraints(minWidth: 130),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
            color: boxShadowBlueColor.withOpacity(0.2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: paragraph3Style?.copyWith(color: darkGreyColor),
            ),
            const SizedBox(
              height: Spacing.spacing10,
            ),
            image,
            const SizedBox(
              height: Spacing.spacing10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing8),
              child: Text(
                amount,
                style: paragraph2Style,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              currency,
              style: paragraph2Style,
            ),
          ],
        ),
      ),
    );
  }
}
