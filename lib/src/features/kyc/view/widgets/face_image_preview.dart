import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class FaceImagePreview extends StatelessWidget {
  final String label;
  final bool passed;
  final Function() onCapture;

  const FaceImagePreview({
    super.key,
    required this.label,
    required this.onCapture,
    required this.passed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: paragraph1RegularStyle,
              ),
            ),
            Expanded(
              flex: 0,
              child: GestureDetector(
                onTap: () {
                  onCapture();
                },
                child: Row(
                  children: [
                    Image.asset(AssetIcons.camera),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        S.of(context).kycUploadIdCardCaptureImageButton,
                        style: paragraph1LightStyle?.copyWith(color: blueColor),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            width: double.infinity,
            height: 72,
            decoration: BoxDecoration(
                color: lightGrey1Color,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: midGreyColor)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                (passed) ? 'Passed.' : 'Please verify your face.',
                style: paragraph1RegularStyle?.copyWith(
                    color: (passed) ? greenColor : redColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
