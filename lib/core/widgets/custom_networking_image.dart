import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkingImage extends StatelessWidget {
  const CustomNetworkingImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Skeletonizer(
        child: Container(height: 70, width: 100, color: Colors.grey),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
