import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    this.tag,
    required this.icon,
    required this.label,
    required this.onTap,
    this.showIcon = true,
    this.showDivider = true,
  });

  final bool showIcon;
  final bool showDivider;
  final Widget? tag;
  final Widget icon;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Spacing.spacing10),
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  style: paragraph1LightStyle,
                ),
                (tag != null)
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: tag,
                      )
                    : Container(),
                const Spacer(),
                Visibility(
                  visible: showIcon,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: midGreyColor,
                  ),
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: showDivider,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.spacing6),
            child: Divider(
              color: midGreyColor.withOpacity(0.3),
            ),
          ),
        )
      ],
    );
  }
}
