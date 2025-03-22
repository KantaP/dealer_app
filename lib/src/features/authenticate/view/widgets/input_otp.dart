import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class InputOtp extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool hasNext;
  final bool hasError;
  final bool hasPrevious;
  final FocusNode focusNode;
  final bool lastInput;
  const InputOtp({
    Key? key,
    required this.controller,
    required this.autoFocus,
    required this.hasNext,
    required this.hasError,
    required this.hasPrevious,
    required this.focusNode,
    required this.lastInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: (hasError) ? redColor : blueColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          autofocus: autoFocus,
          controller: controller,
          keyboardType: TextInputType.number,
          cursorColor: blueColor,
          decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom: 3)),
          textAlign: TextAlign.center,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            if (value.isNotEmpty && hasNext) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && hasPrevious) {
              FocusScope.of(context).previousFocus();
            }
            if (lastInput && value.isNotEmpty) {
              FocusScope.of(context).unfocus();
            }
          },
        ),
      ),
    );
  }
}
