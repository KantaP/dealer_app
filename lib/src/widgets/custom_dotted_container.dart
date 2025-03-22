import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/widgets.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/dotted_upload.dart';

class CustomDottedContainer extends StatelessWidget {
  final Widget? content;
  final Function() onTapUpload;
  final String uploadPlaceholder;

  const CustomDottedContainer(
      {super.key,
      this.content,
      required this.onTapUpload,
      required this.uploadPlaceholder});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: darkGreyColor,
      dashPattern: const [8, 4],
      borderPadding: const EdgeInsets.all(2),
      radius: const Radius.circular(10),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: lightGrey1Color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: content ??
            DottedUpload(
              onTap: onTapUpload,
              placeholder: uploadPlaceholder,
            ),
      ),
    );
  }
}
