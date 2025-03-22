import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class CustomDialogAlert extends StatefulWidget {
  final Widget title, descriptions;
  final Widget? submitButton, optionalButton;

  const CustomDialogAlert(
      {super.key,
      required this.title,
      required this.descriptions,
      this.submitButton,
      this.optionalButton});

  @override
  State<CustomDialogAlert> createState() => _CustomDialogAlertState();
}

class _CustomDialogAlertState extends State<CustomDialogAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16.0),
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.title,
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: widget.descriptions,
              ),
              _submitButton() ?? Container(),
              _optionalButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _title() {
  //   return Text(
  //     widget.title,
  //     style: Theme.of(context).textTheme.titleLarge,
  //   );
  // }

  // Widget _description() {
  //   return Text(
  //     widget.descriptions,
  //     style: Theme.of(context)
  //         .textTheme
  //         .bodyMedium
  //         ?.merge(const TextStyle(color: darkGreyColor)),
  //   );
  // }

  Widget? _submitButton() {
    return SizedBox(width: double.infinity, child: widget.submitButton);
  }

  Widget _optionalButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(width: double.infinity, child: widget.optionalButton),
    );
  }
}
