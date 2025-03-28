import 'package:flutter/material.dart';

import '../theme/custom_theme.dart';

class CheckBoxField extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;
  final String label;

  const CheckBoxField(
      {Key? key, required this.value, this.onChanged, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              checkColor: whiteColor,
              activeColor: blueColor,
              side: const BorderSide(color: midGreyColor),
              value: value,
              onChanged: onChanged),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              label,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        )
      ],
    );
  }
}
