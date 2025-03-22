import 'dart:io';

import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CurvedNavigationBar extends StatelessWidget {
  const CurvedNavigationBar(
      {super.key, required this.items, this.onTap, this.currentIndex = 0});

  final List<CurvedNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final barHeight = Platform.isIOS
        ? kBottomNavigationBarHeight + 13
        : kBottomNavigationBarHeight;
    return SizedBox(
      height: barHeight,
      child: Column(
        children: [
          CustomPaint(
            painter: BottomAppBarPainter(),
            willChange: false,
            isComplex: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                items.length,
                (index) {
                  final item = items[index];
                  if (index == 2) {
                    return TextButton(
                      onPressed: null,
                      child: Container(),
                    );
                  }
                  return TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () => onTap?.call(index),
                    child: Column(
                      children: [
                        (currentIndex == index)
                            ? item.selectedIcon
                            : item.unSelectedIcon,
                        Text(
                          item.label,
                          style: regular11Text?.copyWith(
                              color: (currentIndex == index)
                                  ? const Color(0xff565EFF)
                                  : darkGreyColor),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          (Platform.isIOS)
              ? Container(
                  color: whiteColor,
                  width: double.infinity,
                  height: 13,
                )
              : Container(
                  height: 0,
                )
        ],
      ),
    );
  }
}

class CurvedNavigationBarItem {
  const CurvedNavigationBarItem({
    required this.unSelectedIcon,
    required this.selectedIcon,
    required this.label,
  });

  final Widget unSelectedIcon;
  final Widget selectedIcon;
  final String label;
}

class BottomAppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.4285714);
    path_0.cubicTo(0, size.height * 0.1918786, size.width * 0.02755179, 0,
        size.width * 0.06153846, 0);
    path_0.lineTo(size.width * 0.3169872, 0);
    path_0.lineTo(size.width * 0.3169872, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.4285714);
    // mix path 1
    path_0.moveTo(size.width * 0.5936538, size.height * 0.3698214);
    path_0.cubicTo(
        size.width * 0.5751154,
        size.height * 0.5966071,
        size.width * 0.5400641,
        size.height * 0.7500000,
        size.width * 0.4999872,
        size.height * 0.7500000);
    path_0.cubicTo(
        size.width * 0.4599103,
        size.height * 0.7500000,
        size.width * 0.4248590,
        size.height * 0.5967857,
        size.width * 0.4063205,
        size.height * 0.3698214);
    path_0.cubicTo(size.width * 0.3879103, size.height * 0.1442857,
        size.width * 0.3542436, 0, size.width * 0.3169872, 0);
    path_0.lineTo(size.width * 0.3169872, size.height);
    path_0.lineTo(size.width * 0.6830128, size.height);
    path_0.lineTo(size.width * 0.6830128, 0);
    path_0.cubicTo(
        size.width * 0.6457564,
        0,
        size.width * 0.6120897,
        size.height * 0.1442857,
        size.width * 0.5936795,
        size.height * 0.3698214);
    path_0.lineTo(size.width * 0.5936538, size.height * 0.3698214);
    // end path 1
    // mix path 2
    path_0.moveTo(size.width * 0.6830128, 0);

    path_0.lineTo(size.width * 0.9384615, 0);

    path_0.cubicTo(size.width * 0.9724487, 0, size.width,
        size.height * 0.1918786, size.width, size.height * 0.4285714);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.6830128, size.height);
    path_0.lineTo(size.width * 0.6830128, 0);
    // end path 2
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawShadow(path_0.shift(const Offset(0, -7)),
        blueColor.withOpacity(0.2), 2, false);
    canvas.drawPath(path_0, paint_0_fill);

    // Path path_1 = Path();
    // path_1.moveTo(size.width * 0.5936538, size.height * 0.3698214);
    // path_1.cubicTo(
    //     size.width * 0.5751154,
    //     size.height * 0.5966071,
    //     size.width * 0.5400641,
    //     size.height * 0.7500000,
    //     size.width * 0.4999872,
    //     size.height * 0.7500000);
    // path_1.cubicTo(
    //     size.width * 0.4599103,
    //     size.height * 0.7500000,
    //     size.width * 0.4248590,
    //     size.height * 0.5967857,
    //     size.width * 0.4063205,
    //     size.height * 0.3698214);
    // path_1.cubicTo(size.width * 0.3879103, size.height * 0.1442857,
    //     size.width * 0.3542436, 0, size.width * 0.3169872, 0);
    // path_1.lineTo(size.width * 0.3169872, size.height);
    // path_1.lineTo(size.width * 0.6830128, size.height);
    // path_1.lineTo(size.width * 0.6830128, 0);
    // path_1.cubicTo(
    //     size.width * 0.6457564,
    //     0,
    //     size.width * 0.6120897,
    //     size.height * 0.1442857,
    //     size.width * 0.5936795,
    //     size.height * 0.3698214);
    // path_1.lineTo(size.width * 0.5936538, size.height * 0.3698214);
    // path_1.close();

    // Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    // paint_1_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawShadow(path_1.shift(const Offset(0, -7)),
    //     blueColor.withOpacity(0.2), 2, false);
    // canvas.drawPath(path_1, paint_1_fill);

    // Path path_2 = Path();

    // path_2.moveTo(size.width * 0.6830128, 0);

    // path_2.lineTo(size.width * 0.9384615, 0);

    // path_2.cubicTo(size.width * 0.9724487, 0, size.width,
    //     size.height * 0.1918786, size.width, size.height * 0.4285714);
    // path_2.lineTo(size.width, size.height);
    // path_2.lineTo(size.width * 0.6830128, size.height);
    // path_2.lineTo(size.width * 0.6830128, 0);
    // path_2.close();

    // Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    // paint_2_fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawShadow(path_2.shift(const Offset(0, -7)),
    //     blueColor.withOpacity(0.2), 2, false);
    // canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
