import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:flutter/material.dart';

class ItemSliverPadding extends StatelessWidget {
  final Widget child;

  const ItemSliverPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      sliver: child,
    );
  }
}
