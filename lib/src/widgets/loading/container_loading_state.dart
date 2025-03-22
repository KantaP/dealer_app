import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/loading/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerLoadingState extends StatelessWidget {
  const ContainerLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: lightGrey1Color,
      highlightColor: lightGrey2Color,
      child: const ContentPlaceholder(
        lineType: ContentLineType.twoLines,
      ),
    );
  }
}
