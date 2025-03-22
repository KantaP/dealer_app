import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class CustomLaserIdCardField extends StatefulWidget {
  final String label;
  final String? errorText;
  final TextEditingController? controller;
  final Function(dynamic value) onChanged;

  const CustomLaserIdCardField(
      {super.key,
      required this.label,
      this.errorText,
      this.controller,
      required this.onChanged});

  @override
  State<CustomLaserIdCardField> createState() => _CustomLaserIdCardFieldState();
}

class _CustomLaserIdCardFieldState extends State<CustomLaserIdCardField> {
  final TextEditingController frontController = TextEditingController();
  final TextEditingController backController = TextEditingController();

  @override
  void initState() {
    super.initState();

    frontController.addListener(() {
      if (frontController.text.isEmpty) return;
      widget.controller?.value = TextEditingValue(
        text: '${frontController.text}-${backController.text}',
      );
      widget.onChanged('${frontController.text}-${backController.text}');
    });
    backController.addListener(() {
      if (backController.text.isEmpty) return;
      widget.controller?.value = TextEditingValue(
        text: '${frontController.text}-${backController.text}',
      );
      widget.onChanged('${frontController.text}-${backController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: SizedBox(
                  width: 60,
                  child: textField(
                    keyboardType: TextInputType.text,
                    formatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z]'),
                      ),
                    ],
                    maxLength: 2,
                    controller: frontController,
                    placeholder: 'ME',
                  ),
                ),
              ),
              const SizedBox(
                width: 32,
                child: Center(
                  child: Text('-'),
                ),
              ),
              Expanded(
                flex: 3,
                child: textField(
                  keyboardType: TextInputType.number,
                  formatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[0-9]'),
                    ),
                  ],
                  maxLength: 10,
                  controller: backController,
                  placeholder: '1234567890',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            widget.errorText ?? '',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: redColor),
          ),
        )
      ],
    );
  }

  Widget textField(
      {required TextInputType keyboardType,
      required List<TextInputFormatter> formatters,
      required int maxLength,
      required TextEditingController controller,
      required String placeholder}) {
    return TextField(
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: midGreyColor),
        contentPadding: const EdgeInsets.only(left: 0, right: 16, top: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (widget.errorText != null && widget.errorText!.isNotEmpty)
                  ? redColor
                  : midGreyColor,
              width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        border: const OutlineInputBorder(),
        isDense: false,
        prefixIconConstraints: const BoxConstraints(maxWidth: 16, minWidth: 16),
        prefixIcon: const SizedBox(
          width: 16,
        ),
        counterText: '',
        hintText: placeholder,
      ),
      inputFormatters: formatters,
      maxLength: maxLength,
      textCapitalization: TextCapitalization.characters,
      controller: controller,
    );
  }
}
