import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.textHilightColor = blueColor,
    this.automaticallyImplyLeading = true,
    this.centerTitle = false,
    this.pinned = true,
    this.actions = const [],
    this.leading,
    this.bgColor = whiteColor,
    this.textNormalColor = blackColor,
    this.transaparentMode = false,
    this.flexibleSpace,
    this.expandedHeight = 112.0,
    this.collapsedHeight = 64.0,
  });

  final String title;
  final Color textHilightColor;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final bool pinned;
  final List<Widget> actions;
  final Widget? leading;
  final Color bgColor;
  final Color textNormalColor;
  final bool transaparentMode;
  final Widget? flexibleSpace;
  final double expandedHeight;
  final double collapsedHeight;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: bgColor,
      pinned: pinned,
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: kToolbarHeight,
      title: HilightText(
        text: title,
        hilightStyle: titlePageStyle?.merge(
          TextStyle(color: textHilightColor),
        ),
        normalStyle: titlePageStyle?.copyWith(color: textNormalColor),
      ),
      centerTitle: centerTitle,
      actions: actions,
      leading: leading,
      flexibleSpace: flexibleSpace,
      expandedHeight: (flexibleSpace != null) ? expandedHeight : kToolbarHeight,
      collapsedHeight:
          (flexibleSpace != null) ? collapsedHeight : kToolbarHeight,
    );
  }
}
