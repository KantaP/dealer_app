import 'package:flutter/material.dart';

class DottedUploadPreview extends StatelessWidget {
  final Widget image;

  const DottedUploadPreview({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              image,
            ],
          ),
        ],
      ),
    );
  }
}
