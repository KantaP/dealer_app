import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/widgets.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, required this.label, required this.text});

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: paragraph2Style,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Spacing.spacing12),
          child: Text(
            text,
            style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
          ),
        )
      ],
    );
  }
}
