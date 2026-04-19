import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/shared/ui/widgets/cashed_image.dart';
import 'package:kadro_app/shared/utils/plain_text_from_html.dart';
import 'package:kadro_app/shared/utils/ui_formatter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class MediaInfoBottomSheet extends StatelessWidget {
  final MediaDetail? media;
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
    final sheetData = _MediaInfoSheetData.fromMedia(media);

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
                sliver: SliverToBoxAdapter(
                  child: _SheetHeader(media: sheetData),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                sliver: SliverToBoxAdapter(
                  child: _PreviewCard(media: sheetData),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                sliver: SliverToBoxAdapter(
                  child: _StatusChips(media: sheetData),
                ),
              ),
              _FactGridSection(
                title: 'Названия',
                delegate: _titleGridDelegate,
                entries: [
                  _FactEntry(
                    label: 'Romaji',
                    value: UIFormatter.display(sheetData.title.romaji),
                    copyValue: sheetData.title.romaji.trim(),
                  ),
                  _FactEntry(
                    label: 'English',
                    value: UIFormatter.display(sheetData.title.english),
                    copyValue: sheetData.title.english.trim(),
                  ),
                  _FactEntry(
                    label: 'Native',
                    value: UIFormatter.display(sheetData.title.nativeTitle),
                    copyValue: sheetData.title.nativeTitle.trim(),
                  ),
                  _FactEntry(
                    label: 'Синонимы',
                    value: UIFormatter.joinNonEmpty(
                      sheetData.synonyms,
                      take: 3,
                    ),
                    copyValue: sheetData.synonyms
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
                  _FactEntry(label: 'Сезон', value: _seasonLabel(sheetData)),
                  _FactEntry(
                    label: 'Тип / формат',
                    value:
                        '${UIFormatter.display(sheetData.type)} / ${UIFormatter.display(sheetData.format)}',
                  ),
                  _FactEntry(
                    label: 'Дата старта',
                    value: UIFormatter.date(
                      sheetData.startDate.year,
                      sheetData.startDate.month,
                      sheetData.startDate.day,
                    ),
                  ),
                  _FactEntry(
                    label: 'Дата финала',
                    value: UIFormatter.date(
                      sheetData.endDate.year,
                      sheetData.endDate.month,
                      sheetData.endDate.day,
                    ),
                  ),
                  _FactEntry(
                    label: 'Эпизодов',
                    value: UIFormatter.positiveNumber(sheetData.episodes),
                  ),
                  _FactEntry(
                    label: 'Длительность',
                    value: UIFormatter.positiveNumber(
                      sheetData.duration,
                      suffix: ' мин',
                    ),
                  ),
                  _FactEntry(
                    label: 'Страна',
                    value: UIFormatter.display(sheetData.countryOfOrigin),
                  ),
                  _FactEntry(
                    label: 'Источник',
                    value: UIFormatter.display(sheetData.source),
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
                    value: UIFormatter.positiveNumber(sheetData.averageScore),
                  ),
                  _FactEntry(
                    label: 'Средняя оценка',
                    value: UIFormatter.positiveNumber(sheetData.meanScore),
                  ),
                  _FactEntry(
                    label: 'Популярность',
                    value: UIFormatter.positiveNumber(sheetData.popularity),
                  ),
                  _FactEntry(
                    label: 'Тренд',
                    value: UIFormatter.signedNumber(sheetData.trending),
                  ),
                  _FactEntry(
                    label: 'В избранном',
                    value: UIFormatter.positiveNumber(sheetData.favourites),
                  ),
                  _FactEntry(
                    label: 'Лучший ранг',
                    value: _bestRanking(sheetData.rankings),
                  ),
                ],
                cardBuilder: (entry) => _FactCard(entry: entry),
              ),
              _SectionTitleSliver(title: 'Студии'),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                sliver: SliverToBoxAdapter(
                  child: _ChipGroup(
                    labels: sheetData.studios.nodes
                        .map(_studioLabel)
                        .toList(growable: false),
                    highlighted: sheetData.studios.nodes
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
                      ...sheetData.genres,
                      ...sheetData.tags
                          .where((tag) => tag.isMediaSpoiler == false)
                          .take(8)
                          .map((tag) => tag.name),
                    ],
                    warning: sheetData.tags
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
                    text: UIFormatter.display(
                      plainTextFromHtml(sheetData.description),
                    ),
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
                      onOpenSourceTap: media == null ? null : _openAniListPage,
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
    final uri = Uri.https('anilist.co', '/anime/${media!.id}');

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

final class _MediaInfoSheetData {
  final int id;
  final String type;
  final MediaDetailTitle title;
  final double similarity;
  final String description;
  final String format;
  final String status;
  final int episodes;
  final int duration;
  final String season;
  final int seasonYear;
  final int averageScore;
  final int meanScore;
  final int popularity;
  final int trending;
  final int favourites;
  final List<String> genres;
  final List<String> synonyms;
  final String countryOfOrigin;
  final String source;
  final bool isLicensed;
  final MediaDetailCoverImage coverImage;
  final String bannerImage;
  final MediaDetailFuzzyDate startDate;
  final MediaDetailFuzzyDate endDate;
  final MediaDetailStudios studios;
  final List<MediaDetailTag> tags;
  final List<MediaDetailRanking> rankings;

  const _MediaInfoSheetData({
    required this.id,
    required this.type,
    required this.title,
    required this.similarity,
    required this.description,
    required this.format,
    required this.status,
    required this.episodes,
    required this.duration,
    required this.season,
    required this.seasonYear,
    required this.averageScore,
    required this.meanScore,
    required this.popularity,
    required this.trending,
    required this.favourites,
    required this.genres,
    required this.synonyms,
    required this.countryOfOrigin,
    required this.source,
    required this.isLicensed,
    required this.coverImage,
    required this.bannerImage,
    required this.startDate,
    required this.endDate,
    required this.studios,
    required this.tags,
    required this.rankings,
  });

  factory _MediaInfoSheetData.fromMedia(MediaDetail? media) {
    if (media != null) {
      return _MediaInfoSheetData(
        id: media.id,
        type: media.type,
        title: media.title,
        similarity: media.similarity,
        description: media.description,
        format: media.format,
        status: media.status,
        episodes: media.episodes,
        duration: media.duration,
        season: media.season,
        seasonYear: media.seasonYear,
        averageScore: media.averageScore,
        meanScore: media.meanScore,
        popularity: media.popularity,
        trending: media.trending,
        favourites: media.favourites,
        genres: media.genres,
        synonyms: media.synonyms,
        countryOfOrigin: media.countryOfOrigin,
        source: media.source,
        isLicensed: media.isLicensed,
        coverImage: media.coverImage,
        bannerImage: media.bannerImage,
        startDate: media.startDate,
        endDate: media.endDate,
        studios: media.studios,
        tags: media.tags,
        rankings: media.rankings,
      );
    }

    return _MediaInfoSheetData(
      id: 0,
      type: BoneMock.name,
      title: MediaDetailTitle(
        romaji: BoneMock.title,
        english: BoneMock.title,
        nativeTitle: BoneMock.title,
      ),
      similarity: 0,
      description: BoneMock.longParagraph,
      format: BoneMock.name,
      status: BoneMock.name,
      episodes: 24,
      duration: 24,
      season: BoneMock.name,
      seasonYear: 2000,
      averageScore: 0,
      meanScore: 0,
      popularity: 0,
      trending: 0,
      favourites: 0,
      genres: List.generate(5, (_) => BoneMock.name),
      synonyms: List.generate(3, (_) => BoneMock.name),
      countryOfOrigin: BoneMock.name,
      source: BoneMock.name,
      isLicensed: false,
      coverImage: const MediaDetailCoverImage(
        large: '',
        extraLarge: '',
        color: '',
      ),
      bannerImage: BoneMock.name,
      startDate: const MediaDetailFuzzyDate(year: 2000, month: 12, day: 13),
      endDate: const MediaDetailFuzzyDate(year: 2000, month: 12, day: 13),
      studios: MediaDetailStudios(
        nodes: List.generate(
          5,
          (index) => MediaDetailStudioNode(
            id: index,
            name: BoneMock.name,
            isMain: index == 0,
          ),
        ),
      ),
      tags: List.generate(
        6,
        (_) => MediaDetailTag(
          name: BoneMock.name,
          rank: 80,
          isMediaSpoiler: false,
          category: BoneMock.name,
        ),
      ),
      rankings: List.generate(
        3,
        (index) => MediaDetailRanking(
          rank: index + 1,
          type: BoneMock.name,
          year: 2000,
          season: BoneMock.name,
          allTime: false,
          context: BoneMock.name,
        ),
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  final _MediaInfoSheetData media;

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
  final _MediaInfoSheetData media;

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

String _resolvePreviewUrl(_MediaInfoSheetData media) {
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

String _seasonLabel(_MediaInfoSheetData media) {
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
  final _MediaInfoSheetData media;

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
