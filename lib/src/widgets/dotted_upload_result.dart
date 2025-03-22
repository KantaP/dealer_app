import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';

class DottedUploadResult extends StatelessWidget {
  final String imagePath;
  final Function() onRemove;

  const DottedUploadResult(
      {super.key, required this.imagePath, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            imagePath.contains('http')
                ? Image.network(imagePath)
                : Image.file(
                    File(imagePath),
                    fit: BoxFit.fill,
                  ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: onRemove,
                child: SvgPicture.asset(AssetSvg.closeCircle),
              ),
            )
          ],
        ),
      ),
    );
  }
}
