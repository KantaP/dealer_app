import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String errorText;
  const PhoneTextField(
      {Key? key,
      required this.label,
      this.controller,
      this.onChanged,
      this.errorText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.dialCodeLabel,
              style: paragraph2Style,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
                  border: Border.all(color: midGreyColor),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spacing10,
                  vertical: Spacing.spacing8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'TH',
                          style: paragraph2Style,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '+66',
                            style: paragraph2Style,
                          ),
                        )
                      ],
                    ),
                    // SizedBox(
                    //   width: Spacing.spacing24,
                    // ),
                    // Assets.vectorIcons.arrowDown.svg()
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: Spacing.spacing10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: midGreyColor),
                        borderRadius:
                            BorderRadius.circular(BorderRadiusSet.radius10)),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      style: paragraph2Style,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: Spacing.spacing10,
                            vertical: Spacing.spacing8,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  BorderRadiusSet.radius10),
                              borderSide: BorderSide.none),
                          isDense: false,
                          errorText: null,
                          helperText: '',
                          errorStyle: paragraph2Style?.copyWith(
                            color: redColor,
                            height: 0,
                          ),
                          helperStyle: const TextStyle(height: 0),
                          hintText: S.current.phonePlaceholder,
                          hintStyle: paragraph2Style?.copyWith(
                              color: blackColor.withOpacity(0.3))
                          // constraints: const BoxConstraints(maxHeight: 68),
                          ),
                      controller: controller,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(9),
                      ],
                      onChanged: onChanged,
                    ),
                  ),
                ),
                Visibility(
                  visible: errorText.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      errorText,
                      style: noticeText?.copyWith(color: redColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
