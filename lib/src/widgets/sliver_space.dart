import 'package:flutter/material.dart';

class SliverSpace extends StatelessWidget {
  final double? height;
  final double? width;

  const SliverSpace({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height ?? 0,
        width: width ?? 0,
      ),
    );
  }
}
