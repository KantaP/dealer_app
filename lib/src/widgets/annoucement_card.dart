import 'package:flutter/material.dart';

class AnnoucementCard extends StatelessWidget {
  final Widget image;
  final Function() onTap;

  const AnnoucementCard({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 342,
        height: 160,
        child: ClipRRect(borderRadius: BorderRadius.circular(10), child: image),
      ),
    );
  }
}
