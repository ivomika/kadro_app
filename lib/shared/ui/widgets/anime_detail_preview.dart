import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimeDetailPreview extends StatelessWidget {
  final String imageUrl;
  final double similarity;
  final String format;
  final String status;
  final String season;
  final int seasonYear;
  final int episodes;
  final String title;

  const AnimeDetailPreview({
    super.key,
    required this.imageUrl,
    required this.similarity,
    required this.format,
    required this.status,
    required this.season,
    required this.seasonYear,
    required this.episodes,
    required this.title,
  });

  static const _seasonMap = {
    'WINTER': Icons.ac_unit,
    'FALL': Icons.eco_outlined,
    'SUMMER': Icons.wb_sunny_outlined,
    'SPRING': Icons.filter_vintage_outlined,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: SizedBox(
                      height: 270,
                      width: 200,
                      child: _CachedImage(url: imageUrl)
                  )
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Chip(
                        label: Text(_formatSimilarity(similarity))
                    ),
                    Chip(
                        label: Text(format)
                    ),
                    Chip(
                        label: Text(status)
                    ),
                    Chip(
                        avatar: Icon(_seasonMap[season] ?? Icons.error),
                        label: Text(seasonYear.toString())
                    ),
                    Chip(
                        avatar: Icon(Icons.playlist_play_outlined),
                        label: Text(episodes.toString())
                    ),
                  ],
                ),
              )
            ]
        ),
        Text(
          title,
          style: textTheme.titleLarge,
        ),
      ],
    );
  }

  String _formatSimilarity(double similarity) =>
      '${(similarity * 100).toStringAsFixed(1)}%';
}

class _CachedImage extends StatelessWidget {
  final String url;

  const _CachedImage({
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    if(url.isEmpty) {
      return Bone.square();
    }

    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) =>
          const Bone.square(),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error),
    );
  }
}
