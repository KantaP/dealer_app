import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/annoucement_card.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideBanner extends StatefulWidget {
  final List<String> imgList;
  final List<Function?> onPressItems;

  const SlideBanner(
      {super.key, required this.imgList, required this.onPressItems});

  @override
  State<StatefulWidget> createState() {
    return _SlideBanner();
  }
}

class _SlideBanner extends State<SlideBanner> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CarouselSlider(
            items: _buildImageSlides(),
            carouselController: _controller,
            options: CarouselOptions(
                padEnds: false,
                viewportFraction: 0.9,
                autoPlay: true,
                enlargeCenterPage: false,
                // aspectRatio: 3.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        const SizedBox(
          height: Spacing.spacing16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: (_current == entry.key)
                  ? _buildCurrentImageIndicator()
                  : _buildImageIndicator(),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildImageIndicator() {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: Spacing.spacing10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: midGreyColor),
    );
  }

  Widget _buildCurrentImageIndicator() {
    return Container(
      width: 24,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: Spacing.spacing10),
      decoration: BoxDecoration(
          color: blueColor, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget>? _buildImageSlides() {
    return widget.imgList
        .map((item) => GestureDetector(
              onTap: () {
                final index = widget.imgList.indexOf(item);
                widget.onPressItems[index]?.call();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: Spacing.spacing12),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Image.asset(item, fit: BoxFit.fill, width: 324.0),
                ),
              ),
            ))
        .toList();
  }
}
