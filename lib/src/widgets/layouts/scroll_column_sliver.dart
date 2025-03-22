// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ScrollColumnSliver extends StatelessWidget {
  final List<Widget> slivers;
  final bool paddingAppBar;
  final bool shrinkWrap;
  final ScrollController? controller;
  final ScrollPhysics physics;
  const ScrollColumnSliver({
    super.key,
    required this.slivers,
    this.paddingAppBar = true,
    this.shrinkWrap = false,
    this.controller,
    this.physics = const BouncingScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      shrinkWrap: shrinkWrap,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: physics,
      slivers: <Widget>[
        ...slivers,
      ],
    );
  }
}
