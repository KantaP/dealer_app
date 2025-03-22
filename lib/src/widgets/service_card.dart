import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final Widget image;
  final Function() onTap;

  const ServiceCard({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 100,
        child: ClipRRect(borderRadius: BorderRadius.circular(10), child: image),
      ),
    );
  }
}
