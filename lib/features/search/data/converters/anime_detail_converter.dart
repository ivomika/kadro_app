import 'package:kadro_app/features/search/data/models/anilist_response/anilist_response.dart';
import 'package:kadro_app/features/search/domain/entities/anime_detail.dart';

final class AnimeDetailConverter {
  const AnimeDetailConverter();

  AnimeDetail fromResponse(AnilistMedia media, double similarity) {
    return AnimeDetail(
      id: media.id,
      idMal: media.idMal ?? -1,
      type: media.type ?? '',
      title: AnimeTitle(
        romaji: media.title.romaji ?? '',
        english: media.title.english ?? '',
        nativeTitle: media.title.nativeTitle ?? '',
      ),
      description: media.description ?? '',
      format: media.format ?? '',
      status: media.status ?? '',
      episodes: media.episodes ?? -1,
      duration: media.duration ?? -1,
      season: media.season ?? '',
      seasonYear: media.seasonYear ?? -1,
      averageScore: media.averageScore ?? -1,
      meanScore: media.meanScore ?? -1,
      popularity: media.popularity ?? -1,
      trending: media.trending ?? -1,
      favourites: media.favourites ?? -1,
      genres: List<String>.unmodifiable(media.genres),
      synonyms: List<String>.unmodifiable(media.synonyms),
      countryOfOrigin: media.countryOfOrigin ?? '',
      source: media.source ?? '',
      isLicensed: media.isLicensed ?? false,
      coverImage: AnimeCoverImage(
        large: media.coverImage.large ?? '',
        extraLarge: media.coverImage.extraLarge ?? '',
        color: media.coverImage.color ?? '',
      ),
      bannerImage: media.bannerImage ?? '',
      startDate: AnimeFuzzyDate(
        year: media.startDate.year ?? -1,
        month: media.startDate.month ?? -1,
        day: media.startDate.day ?? -1,
      ),
      endDate: AnimeFuzzyDate(
        year: media.endDate.year ?? -1,
        month: media.endDate.month ?? -1,
        day: media.endDate.day ?? -1,
      ),
      studios: AnimeStudios(
        nodes: media.studios.edges
            .map(
              (studioEdge) => AnimeStudioNode(
                id: studioEdge.node.id,
                name: studioEdge.node.name,
                isMain: studioEdge.isMain ?? false,
              ),
            )
            .toList(growable: false),
      ),
      tags: media.tags
          .map(
            (tag) => AnimeTag(
              name: tag.name,
              rank: tag.rank ?? -1,
              isMediaSpoiler: tag.isMediaSpoiler ?? false,
              category: tag.category ?? '',
            ),
          )
          .toList(growable: false),
      rankings: media.rankings
          .map(
            (ranking) => AnimeRanking(
              rank: ranking.rank,
              type: ranking.type ?? '',
              year: ranking.year ?? -1,
              season: ranking.season ?? '',
              allTime: ranking.allTime ?? false,
              context: ranking.context ?? '',
            ),
          )
          .toList(growable: false),
      siteUrl: media.siteUrl ?? '',
      similarity: similarity,
    );
  }
}
