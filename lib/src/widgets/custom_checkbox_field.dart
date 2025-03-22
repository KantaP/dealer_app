import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class CheckboxValue {
  final String? title;
  final String? value;

  CheckboxValue({this.title, this.value});
}

class CheckboxValuePersistence implements ModelJson<CheckboxValue> {
  @override
  List<CheckboxValue> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  CheckboxValue fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(CheckboxValue json) {
    return {
      'title': json.title,
      'value': json.value,
    };
  }
}

class CheckBoxEditorController extends TextEditingController {
  final CheckboxValue? checkboxValue;

  CheckBoxEditorController({this.checkboxValue});
}

class CustomCheckboxField extends StatelessWidget {
  final String label;
  final List<CheckboxValue> values;
  final Function(CheckboxValue value) onSelect;
  final String? errorText;
  final List<CheckboxValue>? selected;
  final TextStyle? checkboxTextStyle;

  const CustomCheckboxField({
    super.key,
    required this.label,
    required this.values,
    required this.onSelect,
    this.errorText,
    this.selected,
    this.checkboxTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: paragraph1RegularStyle,
          ),
          const SizedBox(
            height: Spacing.spacing10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: values.map((e) => checkbox(e)).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              errorText ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: redColor),
            ),
          )
        ],
      ),
    );
  }

  Widget checkbox(CheckboxValue e) {
    bool isChecked = false;
    final List<CheckboxValue> selectedValue = selected ?? [];
    if (selectedValue.isNotEmpty) {
      if (selectedValue
          .where((item) => item.value == e.value)
          .toList()
          .isNotEmpty) {
        isChecked = true;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            checkColor: whiteColor,
            activeColor: blueColor,
            side: BorderSide(color: midGreyColor),
            value: isChecked,
            onChanged: (bool? value) {
              try {
                onSelect(e);
              } catch (e) {
                throw Exception(e);
              }
            },
          ),
          const SizedBox(
            width: Spacing.spacing10,
          ),
          Flexible(
            child: Text(
              e.title ?? '',
              style: checkboxTextStyle ?? paragraph2Style,
            ),
          ),
        ],
      ),
    );
  }
}
