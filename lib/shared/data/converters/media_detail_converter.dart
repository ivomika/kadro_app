import 'package:kadro_app/shared/data/models/anilist_response.dart';
import 'package:kadro_app/shared/domain/entities/media_detail.dart';

final class MediaDetailConverter {
  const MediaDetailConverter();

  MediaDetail fromResponse(AnilistMedia media, double similarity) {
    return MediaDetail(
      id: media.id,
      idMal: media.idMal ?? -1,
      type: media.type ?? '',
      title: MediaDetailTitle(
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
      coverImage: MediaDetailCoverImage(
        large: media.coverImage.large ?? '',
        extraLarge: media.coverImage.extraLarge ?? '',
        color: media.coverImage.color ?? '',
      ),
      bannerImage: media.bannerImage ?? '',
      startDate: MediaDetailFuzzyDate(
        year: media.startDate.year ?? -1,
        month: media.startDate.month ?? -1,
        day: media.startDate.day ?? -1,
      ),
      endDate: MediaDetailFuzzyDate(
        year: media.endDate.year ?? -1,
        month: media.endDate.month ?? -1,
        day: media.endDate.day ?? -1,
      ),
      studios: MediaDetailStudios(
        nodes: media.studios.edges
            .map(
              (studioEdge) => MediaDetailStudioNode(
                id: studioEdge.node.id,
                name: studioEdge.node.name,
                isMain: studioEdge.isMain ?? false,
              ),
            )
            .toList(growable: false),
      ),
      tags: media.tags
          .map(
            (tag) => MediaDetailTag(
              name: tag.name,
              rank: tag.rank ?? -1,
              isMediaSpoiler: tag.isMediaSpoiler ?? false,
              category: tag.category ?? '',
            ),
          )
          .toList(growable: false),
      rankings: media.rankings
          .map(
            (ranking) => MediaDetailRanking(
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
