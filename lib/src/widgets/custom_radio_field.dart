import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

enum RadioType { row, column }

class RadioValue {
  final String? title;
  final dynamic value;

  RadioValue({this.title, this.value});
}

class RadioValuePersistence implements ModelJson<RadioValue> {
  @override
  List<RadioValue> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  RadioValue fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(RadioValue json) {
    return {
      'title': json.title,
      'value': json.value,
    };
  }
}

class RadioEditorController extends TextEditingController {
  final RadioValue? radioValue;

  RadioEditorController({this.radioValue});
}

class CustomRadioField extends StatelessWidget {
  final String label;
  final List<RadioValue> values;
  final Function(RadioValue value) onSelect;
  final String errorText;
  final RadioValue? selected;
  final RadioType? radioType;

  const CustomRadioField({
    super.key,
    required this.label,
    required this.values,
    required this.onSelect,
    this.errorText = '',
    this.selected,
    this.radioType = RadioType.column,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        if (radioType == RadioType.column)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: values.map((e) => radioBox(e)).toList(),
          )
        else
          Row(
            children: values.map((e) => Flexible(child: radioBox(e))).toList(),
          ),
        Visibility(
          visible: errorText.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              errorText,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: redColor),
            ),
          ),
        )
      ],
    );
  }

  Widget radioBox(RadioValue e) {
    RadioValue selectedValue = RadioValue();
    if (selected != null) {
      if (e.value == selected?.value) {
        selectedValue = e;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.spacing10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio<RadioValue>(
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: e,
            groupValue: selectedValue,
            onChanged: (value) {
              try {
                onSelect(value ?? RadioValue());
              } catch (e) {
                //Sentry.captureException(e);
              }
            },
            activeColor: blueColor,
          ),
          const SizedBox(
            width: Spacing.spacing10,
          ),
          Flexible(child: Text(e.title ?? ''))
        ],
      ),
    );
  }
}
