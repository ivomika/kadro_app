import 'package:flutter/material.dart';
import 'package:kadro_app/shared/ui/widgets/cashed_image.dart';
import 'package:kadro_app/shared/utils/ui_formatter.dart';

class HistoryListTile extends StatelessWidget {
  static const double _cardRadius = 12;
  static const double _posterRadius = 10;
  static const double _posterWidth = 84;
  static const double _posterHeight = 104;

  final String title;
  final String description;
  final String imageUrl;
  final double similarity;
  final String format;
  final String status;
  final int episodes;
  final String season;
  final int seasonYear;
  final VoidCallback onTap;

  const HistoryListTile({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.similarity,
    required this.format,
    required this.status,
    required this.episodes,
    required this.season,
    required this.seasonYear,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_cardRadius),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HistoryHeader(
                title: title,
                description: description,
                imageUrl: imageUrl,
              ),
              const SizedBox(height: 12),
              _HistoryMetaSection(
                similarity: similarity,
                format: format,
                status: status,
                episodes: episodes,
                season: season,
                seasonYear: seasonYear,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryHeader extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const _HistoryHeader({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(HistoryListTile._posterRadius),
          child: SizedBox(
            width: HistoryListTile._posterWidth,
            height: HistoryListTile._posterHeight,
            child: CashedImage(url: imageUrl),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HistoryMetaSection extends StatelessWidget {
  final double similarity;
  final String format;
  final String status;
  final int episodes;
  final String season;
  final int seasonYear;

  const _HistoryMetaSection({
    required this.similarity,
    required this.format,
    required this.status,
    required this.episodes,
    required this.season,
    required this.seasonYear,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _HistoryMetaChip(
          icon: Icons.auto_awesome_outlined,
          label: UIFormatter.percent(similarity),
        ),
        _HistoryMetaChip(icon: Icons.movie_creation_outlined, label: format),
        _HistoryMetaChip(icon: Icons.check_circle_outline, label: status),
        _HistoryMetaChip(
          icon: Icons.video_library_outlined,
          label: UIFormatter.positiveNumber(episodes, suffix: ' ep'),
        ),
        _HistoryMetaChip(
          icon: Icons.calendar_today_outlined,
          label: _seasonLabel(season, seasonYear),
        ),
      ],
    );
  }
}

String _seasonLabel(String season, int seasonYear) {
  if (season.trim().isEmpty || seasonYear <= 0) {
    return UIFormatter.placeholder;
  }

  return '$season $seasonYear';
}

class _HistoryMetaChip extends StatelessWidget {
  const _HistoryMetaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
