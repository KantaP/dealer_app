import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../core/gen/assets.gen.dart';
import '../../qr_image.dart';

class PromptPayQrCodeStatic extends StatelessWidget {
  const PromptPayQrCodeStatic({super.key, required this.qrData});

  final String qrData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 232,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.propmtPay.image(height: 20),
            const SizedBox(
              height: Spacing.spacing20,
            ),
            QrCustomImage(
              size: 150,
              data: qrData,
            )
          ],
        ),
      ),
    );
  }
}
