import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/icon_stepper.dart';
import 'package:flutter/material.dart';

class CustomStepperFlex extends StatelessWidget {
  final int currentIndex;
  final double currentIndexProgress;
  final int maxStep;
  final List<String> labels;

  const CustomStepperFlex({
    super.key,
    required this.currentIndex,
    required this.currentIndexProgress,
    required this.maxStep,
    required this.labels,
  });
  @override
  Widget build(BuildContext context) {
    int index = 0;

    final widgets = labels.map((e) {
      final widget = IconStepper(
        progress: _getCurrentProgress(
          currentStepIndex: currentIndex,
          itemIndex: index,
        ),
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
      );
      index++;
      return widget;
    }).toList();

    final List<Widget> widgetWithSeperated = [];
    for (final item in widgets) {
      if (widgets.indexOf(item) != (widgets.length - 1)) {
        //add item with seperated
        widgetWithSeperated.add(item);
        // widgetWithSeperated.add(_buildSeperated(widgets.indexOf(item)));
      } else {
        widgetWithSeperated.add(item);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: Spacing.spacing24,
                ),
                child: Divider(
                  thickness: 4,
                  color: whiteColor.withOpacity(0.2),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widgetWithSeperated,
          ),
        ],
      ),
    );
  }

  double _getCurrentProgress(
      {required int itemIndex, required int currentStepIndex}) {
    if (itemIndex == currentStepIndex) {
      return currentIndexProgress;
    }
    if (itemIndex < currentStepIndex) {
      return 100;
    }
    return 0;
  }

  Widget _buildSeperated(int index) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: Spacing.spacing20,
            // left: Spacing.spacing4,
            // right: Spacing.spacing4,
          ),
          child: Divider(
            thickness: 2,
            color: (index >= currentIndex)
                ? whiteColor.withOpacity(0.2)
                : whiteColor,
          ),
        ),
      ),
    );
  }
}
