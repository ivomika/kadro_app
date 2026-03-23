import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CashedImage extends StatelessWidget {
  final String url;

  const CashedImage({
    super.key,
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    if(url.isEmpty) {
      return const Bone.square();
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
      const Skeletonizer(child: Bone.square()),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error),
    );
  }
}
