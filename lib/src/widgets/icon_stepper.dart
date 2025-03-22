import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

class IconStepper extends StatelessWidget {
  final Widget label;
  final bool active;
  final String desc;
  final double progress;

  const IconStepper({
    super.key,
    required this.label,
    required this.active,
    required this.desc,
    required this.progress,
  });

  final double activeWidth = 50;
  final double activeHeight = 50;
  final double inActiveWidth = 50;
  final double inActiveHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: blueColor,
          child: CircularPercentIndicator(
            radius: (progress == 100) ? 25 : 25,
            lineWidth: 3,
            animation: false,
            percent: progress / 100,
            center: (progress == 100)
                ? Padding(
                    padding: const EdgeInsets.all(0),
                    child: Assets.svgImages.iconSuccess.svg(width: 50),
                  )
                : Padding(
                    padding: const EdgeInsets.all(0),
                    child: label,
                  ),
            backgroundColor:
                (active) ? whiteColor : whiteColor.withOpacity(0.2),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: (progress == 100) ? lightGreenColor : whiteColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          desc,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: whiteColor.withOpacity(active ? 1 : 0.2),
              ),
        )
      ],
    );
  }
}
