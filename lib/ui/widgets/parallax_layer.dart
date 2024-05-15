
import 'package:flutter/material.dart';

class ParallaxLayer extends StatelessWidget {
  final String imageAsset;
  final double imageWidth;
  final double imageHeight;
  final ScrollController scrollController;
  final double scrollSpeed;

  const ParallaxLayer({super.key, 
    required this.imageAsset,
    required this.imageWidth,
    required this.imageHeight,
    required this.scrollController,
    required this.scrollSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, scrollController.offset * scrollSpeed),
      child: Image.asset(
        imageAsset,
        fit: BoxFit.contain,
        // width: imageWidth,
        height: imageHeight,
      ),
    );
  }
}