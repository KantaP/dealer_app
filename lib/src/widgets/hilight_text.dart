import 'package:flutter/material.dart';

class HilightText extends StatelessWidget {
  final String text;
  final TextStyle? hilightStyle;
  final TextStyle? normalStyle;
  final TextAlign? textAlign;
  final int? maxLines;

  const HilightText(
      {super.key,
      required this.text,
      this.hilightStyle,
      this.normalStyle,
      this.textAlign = TextAlign.left,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: _makeSpans(),
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  TextSpan _hilightTextSpan(String text) {
    return TextSpan(
      text: text.replaceAll("%", ""),
      style: hilightStyle,
    );
  }

  TextSpan _normalTextSpan(String text) {
    return TextSpan(
      text: text,
      style: normalStyle,
    );
  }

  List<TextSpan> _makeSpans() {
    List<TextSpan> spans = [];
    var allMatches = RegExp("%(.*?)%").allMatches(text);

    var parts = text.split(RegExp("%(.*?)%"));

    for (int i = 0; i < allMatches.length; i++) {
      int newIndex = 2 * i + 1;

      String? newDelimiter = allMatches.elementAt(i).group(0);

      if (newDelimiter != null) {
        parts.insert(newIndex, newDelimiter);
      }
    }

    return parts.map((e) {
      if (RegExp("%(.*?)%").hasMatch(e)) {
        return _hilightTextSpan(e);
      } else {
        return _normalTextSpan(e);
      }
    }).toList();
  }
}
