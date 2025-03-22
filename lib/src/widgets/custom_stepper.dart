import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/icon_stepper.dart';

class CustomStepper extends StatelessWidget {
  final int currentIndex;
  final double currentIndexProgress;
  final int maxStep;
  final List<String> labels;

  const CustomStepper({
    super.key,
    required this.currentIndex,
    required this.currentIndexProgress,
    required this.maxStep,
    required this.labels,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 32, right: 32),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => IconStepper(
        progress: currentIndexProgress,
        label: Text(
          '${index + 1}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color:
                    whiteColor.withOpacity((currentIndex >= index) ? 1 : 0.2),
              ),
          overflow: TextOverflow.ellipsis,
        ),
        active: (currentIndex >= index) ? true : false,
        desc: labels[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 44,
      ),
      itemCount: maxStep,
    );
  }
}
