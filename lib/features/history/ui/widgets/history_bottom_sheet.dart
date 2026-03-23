import 'package:flutter/material.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/shared/ui/slivers/sliver_divider.dart';
import 'package:kadro_app/shared/ui/widgets/anime_detail_preview.dart';

class HistoryBottomSheet extends StatelessWidget {
  final AnimeHistory anime;

  const HistoryBottomSheet({
    super.key,
    required this.anime
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 1.0,
      builder: (context, scrollController) {
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: AnimeDetailPreview(
                    imageUrl: anime.imageUrl,
                    similarity: anime.similarity,
                    format: anime.format,
                    status: anime.status,
                    season: anime.season,
                    seasonYear: anime.seasonYear,
                    episodes: anime.episodes,
                    title: anime.name
                ),
              ),
            ),
            const SliverDivider(
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                  child: Text(anime.description)
              ),
            ),
            SliverDivider(
              margin: EdgeInsets.symmetric(horizontal: 16).copyWith(
                bottom: 32
              ),
            ),
          ],
        );
      },
    );
  }
}
