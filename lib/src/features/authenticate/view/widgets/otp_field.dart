import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/widgets/input_otp.dart';

class OtpField extends StatefulWidget {
  final int maxLength;
  final TextEditingController controller;
  final Function(String) onSubmit;
  final String? errorState;
  final bool autoFocus;
  const OtpField(
      {Key? key,
      required this.maxLength,
      required this.onSubmit,
      required this.controller,
      this.errorState,
      required this.autoFocus})
      : super(key: key);

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final List<TextEditingController> textControllers = [];
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildRowInputOtp(),
    );
  }

  List<Widget> _buildRowInputOtp() {
    List<Widget> widgets = List.generate(widget.maxLength, (int index) {
      textControllers.add(TextEditingController());
      textControllers[index].addListener(() {
        List<String> otps = textControllers.map((e) => e.text).toList();
        widget.onSubmit(otps.join(''));
      });
      return _widgetInputOtp(
          textControllers[index],
          (index == 0) ? true : false,
          (index == (widget.maxLength - 1)) ? false : true,
          (index == 0) ? false : true,
          (index == (widget.maxLength - 1)) ? true : false);
    });
    return widgets;
  }

  Widget _widgetInputOtp(TextEditingController textController, bool autoFocus,
      bool hasNext, bool hasPrevious, bool lastIndex) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        height: 48,
        width: 48,
        child: InputOtp(
          focusNode: myFocusNode,
          controller: textController,
          autoFocus: false,
          hasNext: hasNext,
          hasPrevious: hasPrevious,
          hasError: (widget.errorState != '' && widget.errorState != null)
              ? true
              : false,
          lastInput: lastIndex,
        ),
      ),
    );
  }
}
