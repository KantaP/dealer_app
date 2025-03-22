import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class DottedUpload extends StatelessWidget {
  final Function()? onTap;
  final String placeholder;

  const DottedUpload(
      {super.key, required this.onTap, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(AssetSvg.image),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              placeholder,
              style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
            ),
          )
        ],
      ),
    );
  }
}
