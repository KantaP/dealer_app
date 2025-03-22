import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class SegmentItem extends StatelessWidget {
  final Function() onTap;
  final bool active;
  final String title;
  final Widget? icon;

  const SegmentItem(
      {super.key,
      required this.onTap,
      required this.active,
      required this.title,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: active ? blueColor : lightGrey1Color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.5),
          child: Center(
            child: (icon != null)
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon!,
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: active ? whiteColor : darkGreyColor),
                      )
                    ],
                  )
                : Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: active ? whiteColor : darkGreyColor),
                  ),
          ),
        ),
      ),
    );
  }
}
