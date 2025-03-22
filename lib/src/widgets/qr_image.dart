import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'dart:ui' as ui;

class QrCustomImage extends StatelessWidget {
  const QrCustomImage({
    super.key,
    required this.size,
    required this.data,
    this.embeddedImage,
  });

  final String data;
  final double size;
  final ui.Image? embeddedImage;

  @override
  Widget build(BuildContext context) {
    print('qrcode : $data');
    return CustomPaint(
      size: Size.square(size),
      painter: QrPainter(
        data: data,
        version: QrVersions.auto,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: blackColor,
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: blackColor,
        ),
        embeddedImage: embeddedImage,
        embeddedImageStyle: const QrEmbeddedImageStyle(
          size: Size.square(60),
        ),
      ),
    );
  }
}
