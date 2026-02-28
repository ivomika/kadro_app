import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:kadro_app/shared/ui/slivers/sliver_divider.dart';

class HomeAnimeDetail extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final double similarity;
  final String format;
  final String status;
  final String season;
  final int seasonYear;
  final int episodes;
  final List<String> genres;
  final List<String> studios;
  final ScrollController? scrollController;

  const HomeAnimeDetail({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.similarity,
    required this.format,
    required this.status,
    required this.season,
    required this.seasonYear,
    required this.episodes,
    required this.genres,
    required this.studios,
    this.scrollController
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
          sliver: SliverToBoxAdapter(
            child: _Preview(
                image: image,
                similarity: similarity,
                format: format,
                status: status,
                seasonYear: seasonYear,
                episodes: episodes
            ),
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                title,
                style: textTheme.titleLarge,
              ),
            ),
        ),
        const SliverDivider(
          padding: EdgeInsets.all(16),
        ),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                    _parseHtmlText(description),
                    style: textTheme.bodyLarge,
                ),
            ),
        ),
        const SliverDivider(
          padding: EdgeInsets.all(16),
        ),
        if(genres.isNotEmpty)
          SliverToBoxAdapter(
            child: SizedBox(
              height: 38,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList.separated(
                      itemCount: genres.length,
                      itemBuilder: (BuildContext context, int index) => Chip(
                          label: Text(genres.elementAt(index))
                      ),
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(
                        width: 8,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(
            itemCount: studios.length,
            itemBuilder: (BuildContext context, int index) =>
                ListTile(
                  title: Text(studios.elementAt(index)),
                  subtitle: const Text('Studios'),
                  leading: Icon(Icons.movie_creation),
                )
        )
      ],
    );
  }

  String _parseHtmlText(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }
}

class _Preview extends StatelessWidget {
  final ImageProvider image;
  final double similarity;
  final String format;
  final String status;
  final int seasonYear;
  final int episodes;

  const _Preview({
    required this.image,
    required this.similarity,
    required this.format,
    required this.status,
    required this.seasonYear,
    required this.episodes
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image(image: image),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Chip(
                    label: Text(similarity.toString().substring(0, 4))
                ),
                Chip(
                    label: Text(format)
                ),
                Chip(
                    label: Text(status)
                ),
                Chip(
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
    );
  }
}
