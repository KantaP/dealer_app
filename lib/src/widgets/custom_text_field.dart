import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String? placeholder;
  final bool? readOnly;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxlength;
  final bool? expand;
  final int? minLines;
  final int maxLines;
  final bool? filled;
  final bool? outline;
  final bool? required;
  final Color bgColor;
  final bool secureText;
  const CustomTextField({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.errorText,
    this.placeholder,
    this.readOnly,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.maxlength,
    this.expand,
    this.minLines,
    this.maxLines = 1,
    this.filled,
    this.outline = true,
    this.required = false,
    this.bgColor = midGreyColor,
    this.secureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: label.isNotEmpty,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: TextField(
            enableInteractiveSelection: false,
            expands: expand ?? false,
            minLines: (expand == true) ? null : maxLines,
            maxLines: (expand == true) ? null : maxLines,
            keyboardType: keyboardType,
            style: Theme.of(context).textTheme.bodyMedium,
            readOnly: readOnly ?? false,
            decoration: InputDecoration(
              filled: filled,
              fillColor: bgColor,
              hintText: placeholder,
              hintStyle:
                  paragraph2Style?.copyWith(color: blackColor.withOpacity(0.3)),
              contentPadding:
                  const EdgeInsets.only(left: 0, right: 16, top: 16),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: bgColor,
                    width: 1,
                    style: outline == false
                        ? BorderStyle.none
                        : BorderStyle.solid),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: bgColor,
                    width: 1,
                    style: outline == false
                        ? BorderStyle.none
                        : BorderStyle.solid),
                borderRadius: BorderRadius.circular(10),
              ),
              border: const OutlineInputBorder(),
              isDense: false,
              errorText: (errorText?.isEmpty ?? ''.isEmpty) ? null : errorText,
              errorStyle: noticeText?.copyWith(
                  color: redColor,
                  height: (errorText?.isEmpty ?? ''.isEmpty) ? 0 : 0.3),
              helperText: ' ',
              helperStyle: noticeText?.copyWith(height: 0.3),
              prefixIconConstraints:
                  const BoxConstraints(maxWidth: 32, minWidth: 0),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: prefixIcon,
              ),
              counterText: (maxlength != null) ? null : '',
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: Spacing.spacing10),
                child: suffixIcon,
              ),
              suffixIconConstraints: BoxConstraints(
                maxWidth: 32,
                minWidth: 0,
                maxHeight: 32,
                minHeight: 0,
              ),
            ),
            obscureText: secureText,
            controller: controller,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            onTap: onTap,
            maxLength: maxlength,
            textInputAction:
                (maxLines > 1) ? TextInputAction.newline : TextInputAction.done,
          ),
        )
      ],
    );
  }
}
