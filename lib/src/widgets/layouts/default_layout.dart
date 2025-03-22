import 'dart:math';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/scroll_column_sliver.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    required this.slivers,
    required this.physics,
    this.bottomNavigationBar,
    this.extendBody = true,
    this.controller,
    this.appBar,
    this.title,
    this.bgColor,
    this.leading,
    this.statusBarColor,
    this.appBarPadding = const EdgeInsets.symmetric(horizontal: 0),
    this.willPopFunction,
    this.onWillPop = true,
    this.safeAreaBottom = false,
    this.bodyPadding = const EdgeInsets.symmetric(horizontal: 0),
    this.safeAreaTop = false,
    this.primary = true,
  });

  final List<Widget> slivers;
  final ScrollPhysics physics;
  final Widget? bottomNavigationBar;
  final bool extendBody;
  final ScrollController? controller;
  final Widget? appBar;
  final String? title;
  final Color? bgColor;
  final bool? leading;
  final Color? statusBarColor;
  final EdgeInsetsGeometry appBarPadding;
  final Future<bool> Function()? willPopFunction;
  final bool onWillPop;
  final bool safeAreaBottom;
  final EdgeInsetsGeometry bodyPadding;
  final bool safeAreaTop;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopFunction ?? () async => onWillPop,
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          top: safeAreaTop,
          bottom: safeAreaBottom,
          child: CustomScrollView(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              (appBar != null)
                  ? appBar!
                  : (title != null)
                      ? _AppBar(title, leading)
                      : const SliverToBoxAdapter(),
              SliverPadding(
                padding: bodyPadding,
                sliver: SliverFillRemaining(
                  child: ScrollColumnSliver(
                    physics: physics,
                    slivers: [
                      ...slivers,
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: paddingBottom(),
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar(this.title, this.leading);
  final String? title;
  final bool? leading;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: leading ?? true,
      pinned: true,
      toolbarHeight: kToolbarHeight,
      title: Text(
        title ?? '',
        style: titlePageStyle,
      ),
    );
  }
}

// class _AppBar extends StatelessWidget implements PreferredSizeWidget {
//   const _AppBar(this.viewModel);
//   final double height = 40.0;
//   final OtpVerificationViewModel viewModel;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: StreamBuilder(
//         stream: viewModel.state,
//         builder: (context, AsyncSnapshot<OtpVerificationState> snapshot) {
//           return Text(
//             S.of(context).otpVerificationTitle,
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }
