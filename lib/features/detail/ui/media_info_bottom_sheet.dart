import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/shared/ui/widgets/cashed_image.dart';
import 'package:kadro_app/shared/utils/ui_formatter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class MediaInfoBottomSheet extends StatelessWidget {
  final MediaDetail media;
  final bool isLoading;
  final VoidCallback? onDetailsTap;

  const MediaInfoBottomSheet({
    super.key,
    required this.media,
    this.isLoading = false,
    this.onDetailsTap,
  });

  static const _titleGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    mainAxisExtent: 68,
  );
  static const _metaGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    mainAxisExtent: 52,
  );

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.55,
      minChildSize: 0.2,
      maxChildSize: 0.92,
      snap: true,
      snapSizes: const [0.21, 0.92],
      builder: (context, scrollController) {
        return Skeletonizer(
          enabled: isLoading,
          child: CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                sliver: SliverToBoxAdapter(child: _SheetHeader(media: media)),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                sliver: SliverToBoxAdapter(child: _PreviewCard(media: media)),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                sliver: SliverToBoxAdapter(child: _StatusChips(media: media)),
              ),
              _FactGridSection(
                title: 'Названия',
                delegate: _titleGridDelegate,
                entries: [
                  _FactEntry(
                    label: 'Romaji',
                    value: UIFormatter.display(media.title.romaji),
                    copyValue: media.title.romaji.trim(),
                  ),
                  _FactEntry(
                    label: 'English',
                    value: UIFormatter.display(media.title.english),
                    copyValue: media.title.english.trim(),
                  ),
                  _FactEntry(
                    label: 'Native',
                    value: UIFormatter.display(media.title.nativeTitle),
                    copyValue: media.title.nativeTitle.trim(),
                  ),
                  _FactEntry(
                    label: 'Синонимы',
                    value: UIFormatter.joinNonEmpty(media.synonyms, take: 3),
                    copyValue: media.synonyms
                        .map((synonym) => synonym.trim())
                        .where((synonym) => synonym.isNotEmpty)
                        .join(', '),
                  ),
                ],
                cardBuilder: (entry) => _CompactTitleCard(entry: entry),
              ),
              _FactGridSection(
                title: 'Релиз и формат',
                delegate: _metaGridDelegate,
                entries: [
                  _FactEntry(label: 'Сезон', value: _seasonLabel(media)),
                  _FactEntry(
                    label: 'Тип / формат',
                    value:
                        '${UIFormatter.display(media.type)} / ${UIFormatter.display(media.format)}',
                  ),
                  _FactEntry(
                    label: 'Дата старта',
                    value: UIFormatter.date(
                      media.startDate.year,
                      media.startDate.month,
                      media.startDate.day,
                    ),
                  ),
                  _FactEntry(
                    label: 'Дата финала',
                    value: UIFormatter.date(
                      media.endDate.year,
                      media.endDate.month,
                      media.endDate.day,
                    ),
                  ),
                  _FactEntry(
                    label: 'Эпизодов',
                    value: UIFormatter.positiveNumber(media.episodes),
                  ),
                  _FactEntry(
                    label: 'Длительность',
                    value: UIFormatter.positiveNumber(
                      media.duration,
                      suffix: ' мин',
                    ),
                  ),
                  _FactEntry(
                    label: 'Страна',
                    value: UIFormatter.display(media.countryOfOrigin),
                  ),
                  _FactEntry(
                    label: 'Источник',
                    value: UIFormatter.display(media.source),
                  ),
                ],
                cardBuilder: (entry) => _FactCard(entry: entry),
              ),
              _FactGridSection(
                title: 'Оценки сообщества',
                delegate: _metaGridDelegate,
                entries: [
                  _FactEntry(
                    label: 'Средний балл',
                    value: UIFormatter.positiveNumber(media.averageScore),
                  ),
                  _FactEntry(
                    label: 'Средняя оценка',
                    value: UIFormatter.positiveNumber(media.meanScore),
                  ),
                  _FactEntry(
                    label: 'Популярность',
                    value: UIFormatter.positiveNumber(media.popularity),
                  ),
                  _FactEntry(
                    label: 'Тренд',
                    value: UIFormatter.signedNumber(media.trending),
                  ),
                  _FactEntry(
                    label: 'В избранном',
                    value: UIFormatter.positiveNumber(media.favourites),
                  ),
                  _FactEntry(
                    label: 'Лучший ранг',
                    value: _bestRanking(media.rankings),
                  ),
                ],
                cardBuilder: (entry) => _FactCard(entry: entry),
              ),
              _SectionTitleSliver(title: 'Студии'),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                sliver: SliverToBoxAdapter(
                  child: _ChipGroup(
                    labels: media.studios.nodes
                        .map(_studioLabel)
                        .toList(growable: false),
                    highlighted: media.studios.nodes
                        .where((studio) => studio.isMain)
                        .map((studio) => studio.name)
                        .toSet(),
                  ),
                ),
              ),
              _SectionTitleSliver(title: 'Жанры и теги'),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                sliver: SliverToBoxAdapter(
                  child: _ChipGroup(
                    labels: [
                      ...media.genres,
                      ...media.tags
                          .where((tag) => tag.isMediaSpoiler == false)
                          .take(8)
                          .map((tag) => tag.name),
                    ],
                    warning: media.tags
                        .where((tag) => tag.rank >= 85)
                        .map((tag) => tag.name)
                        .toSet(),
                  ),
                ),
              ),
              _SectionTitleSliver(title: 'Описание'),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                sliver: SliverToBoxAdapter(
                    child: _DescriptionCard(
                    text: UIFormatter.display(media.parsedDescription),
                  ),
                ),
              ),
              SliverSafeArea(
                top: false,
                sliver: SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                  sliver: SliverToBoxAdapter(
                    child: _ActionBar(
                      onDetailsTap: onDetailsTap,
                      onOpenSourceTap: _openAniListPage,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openAniListPage() async {
    final uri = Uri.https('anilist.co', '/anime/${media.id}');

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class _SheetHeader extends StatelessWidget {
  final MediaDetail media;

  const _SheetHeader({required this.media});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            _displayTitle(media.title),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Chip(
          label: Text(UIFormatter.display(media.format)),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}

class _PreviewCard extends StatelessWidget {
  final MediaDetail media;

  const _PreviewCard({required this.media});

  @override
  Widget build(BuildContext context) {
    final previewUrl = _resolvePreviewUrl(media);

    return Card.outlined(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 132,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CashedImage(url: previewUrl),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x05000000), Color(0xB3000000)],
                ),
              ),
            ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      UIFormatter.display(media.title.nativeTitle),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.34),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      UIFormatter.percent(media.similarity),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _resolvePreviewUrl(MediaDetail media) {
  if (media.bannerImage.isNotEmpty) {
    return media.bannerImage;
  }

  if (media.coverImage.extraLarge.isNotEmpty) {
    return media.coverImage.extraLarge;
  }

  return media.coverImage.large;
}

String _studioLabel(MediaDetailStudioNode studio) {
  if (studio.isMain) {
    return '${studio.name} · основная';
  }

  return studio.name;
}

String _licenseLabel(bool isLicensed) {
  if (isLicensed) {
    return 'Лицензировано';
  }

  return 'Без лицензии';
}

String _displayTitle(MediaDetailTitle title) {
  if (title.english.trim().isNotEmpty) {
    return title.english;
  }

  if (title.romaji.trim().isNotEmpty) {
    return title.romaji;
  }

  return UIFormatter.display(title.nativeTitle);
}

String _seasonLabel(MediaDetail media) {
  if (media.season.trim().isEmpty || media.seasonYear <= 0) {
    return UIFormatter.placeholder;
  }

  return '${media.season} ${media.seasonYear}';
}

String _bestRanking(List<MediaDetailRanking> rankings) {
  if (rankings.isEmpty) {
    return UIFormatter.placeholder;
  }

  final best = rankings.reduce((a, b) => a.rank < b.rank ? a : b);
  if (best.rank <= 0) {
    return UIFormatter.placeholder;
  }

  return '#${best.rank}${best.allTime ? ' за всё время' : ''}';
}

Color _resolveChipBackgroundColor({
  required ColorScheme colorScheme,
  required bool isHighlight,
  required bool isWarning,
}) {
  if (isHighlight) {
    return colorScheme.primaryContainer;
  }

  if (isWarning) {
    return colorScheme.errorContainer;
  }

  return colorScheme.surfaceContainerHigh;
}

Color _resolveChipForegroundColor({
  required ColorScheme colorScheme,
  required bool isHighlight,
  required bool isWarning,
}) {
  if (isHighlight) {
    return colorScheme.onPrimaryContainer;
  }

  if (isWarning) {
    return colorScheme.onErrorContainer;
  }

  return colorScheme.onSurface;
}

class _StatusChips extends StatelessWidget {
  final MediaDetail media;

  const _StatusChips({required this.media});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        Chip(
          label: Text('AniList #${media.id}'),
          visualDensity: VisualDensity.compact,
        ),
        Chip(
          label: Text(UIFormatter.display(media.status)),
          visualDensity: VisualDensity.compact,
        ),
        Chip(
          label: Text(_licenseLabel(media.isLicensed)),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}

class _SectionTitleSliver extends StatelessWidget {
  final String title;

  const _SectionTitleSliver({required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      sliver: SliverToBoxAdapter(
        child: Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}

class _FactGridSection extends StatelessWidget {
  final String title;
  final SliverGridDelegate delegate;
  final List<_FactEntry> entries;
  final Widget Function(_FactEntry entry) cardBuilder;

  const _FactGridSection({
    required this.title,
    required this.delegate,
    required this.entries,
    required this.cardBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        _SectionTitleSliver(title: title),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          sliver: SliverGrid(
            gridDelegate: delegate,
            delegate: SliverChildBuilderDelegate(
              (context, index) => cardBuilder(entries[index]),
              childCount: entries.length,
            ),
          ),
        ),
      ],
    );
  }
}

class _FactEntry {
  final String label;
  final String value;
  final String? copyValue;

  const _FactEntry({required this.label, required this.value, this.copyValue});
}

class _CompactTitleCard extends StatelessWidget {
  final _FactEntry entry;

  const _CompactTitleCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canCopy = entry.copyValue?.isNotEmpty == true;

    return Card.filled(
      margin: EdgeInsets.zero,
      color: theme.colorScheme.surfaceContainerHighest,
      child: InkWell(
        onTap: canCopy ? () => _copyFactEntry(context, entry) : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      entry.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  if (canCopy) ...[
                    const SizedBox(width: 6),
                    Icon(
                      Icons.content_copy_rounded,
                      size: 14,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              Text(
                entry.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _copyFactEntry(BuildContext context, _FactEntry entry) async {
  final value = entry.copyValue;
  if (value == null || value.isEmpty) {
    return;
  }
  final messenger = ScaffoldMessenger.of(context);
  await Clipboard.setData(ClipboardData(text: value));

  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('${entry.label} скопировано'),
      ),
    );
}

class _FactCard extends StatelessWidget {
  final _FactEntry entry;

  const _FactCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card.filled(
      margin: EdgeInsets.zero,
      color: theme.colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                entry.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                entry.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChipGroup extends StatelessWidget {
  final List<String> labels;
  final Set<String> highlighted;
  final Set<String> warning;

  const _ChipGroup({
    required this.labels,
    this.highlighted = const {},
    this.warning = const {},
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: labels
          .where((label) => label.trim().isNotEmpty)
          .map((label) {
            final normalizedLabel = label.replaceAll(' · основная', '');
            final isHighlight = highlighted.contains(normalizedLabel);
            final isWarning = warning.contains(normalizedLabel);

            return Chip(
              label: Text(label),
              visualDensity: VisualDensity.compact,
              backgroundColor: _resolveChipBackgroundColor(
                colorScheme: colorScheme,
                isHighlight: isHighlight,
                isWarning: isWarning,
              ),
              labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: _resolveChipForegroundColor(
                  colorScheme: colorScheme,
                  isHighlight: isHighlight,
                  isWarning: isWarning,
                ),
              ),
            );
          })
          .toList(growable: false),
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  final String text;

  const _DescriptionCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  final VoidCallback? onDetailsTap;
  final VoidCallback? onOpenSourceTap;

  const _ActionBar({this.onDetailsTap, this.onOpenSourceTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: onDetailsTap,
            child: const Text('Подробнее'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilledButton.tonal(
            onPressed: onOpenSourceTap,
            child: const Text('Открыть AniList'),
          ),
        ),
      ],
    );
  }
}
