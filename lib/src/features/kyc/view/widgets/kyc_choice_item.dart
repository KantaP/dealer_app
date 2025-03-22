import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class KycChoiceItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final List<String> descriptions;
  final Function() onPressed;

  const KycChoiceItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.descriptions,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: blueColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: paragraph1RegularStyle,
                    ),
                    ...descriptions
                        .map((e) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\u2022  ',
                                  style: paragraph2Style,
                                ),
                                Flexible(
                                  child: Text(
                                    e,
                                    style: paragraph2Style?.copyWith(
                                        overflow: TextOverflow.clip),
                                  ),
                                ),
                              ],
                            ))
                        .toList()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
