import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

Future showRootDetectModalBottomSheet(BuildContext context,
    {String? title, String? content, Function? onBack}) {
  return showCupertinoModalPopup(
    context: context,
    builder: (_) => KycFailedContent(
      title: title ?? '',
      content: content ?? '',
      onBack: onBack ?? () {},
    ),
  );
}

class KycFailedContent extends StatelessWidget {
  const KycFailedContent(
      {super.key,
      required this.title,
      required this.content,
      required this.onBack});

  final String title;
  final String content;
  final Function onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: SafeArea(
          // bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildContent(),
                _buildButton(context),
                // SizedBox(
                //   height: MediaQuery.of(context).padding.bottom,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.images.failedFullFrame.image(),
        HilightText(
          text: title,
          hilightStyle: headline4BoldStyle?.merge(
            const TextStyle(color: blueColor),
          ),
          normalStyle: headline4LightStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Spacing.spacing10,
        ),
        Text(
          content,
          style: paragraph1LightStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        onBack();
      },
      child: Text(S.of(context).backtoHomeButton),
    );
  }
}
