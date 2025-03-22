import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class PageViewNavigator extends StatelessWidget {
  final bool active;
  const PageViewNavigator({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (active == true) {
      return _activeCicle();
    }
    return _inactiveCircle();
  }

  Widget _activeCicle() {
    return Container(
      width: 24,
      height: 10,
      constraints: const BoxConstraints(maxWidth: 24, minWidth: 24),
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _inactiveCircle() {
    return Container(
      width: 10,
      height: 10,
      decoration:
          const BoxDecoration(color: lightGrey1Color, shape: BoxShape.circle),
    );
  }
}
