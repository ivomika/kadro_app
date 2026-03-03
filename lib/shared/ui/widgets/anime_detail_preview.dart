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
  final bool isLoading;

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
    this.isLoading = false,
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
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            spacing: 16,
            children: [
              Skeletonizer(
                enabled: isLoading,
                child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: SizedBox(
                        height: 270,
                        width: 200,
                        child: _CachedImage(url: imageUrl)
                    )
                ),
              ),
              Expanded(
                child: Skeletonizer(
                  enabled: isLoading,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 8,
                    children: ListTile.divideTiles(
                        context: context,
                        tiles: [
                          ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              title: Text(_formatSimilarity(similarity))
                          ),
                          ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              title: Text(format)
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text(status),
                          ),
                          ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(_seasonMap[season] ?? Icons.error),
                              title: Text(seasonYear.toString())
                          ),
                          ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(Icons.playlist_play_outlined),
                              title: Text(episodes.toString())
                          ),
                        ]
                    ).toList(growable: false),
                  ),
                ),
              )
            ]
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Text(
            title,
            style: textTheme.titleLarge,
          ),
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
