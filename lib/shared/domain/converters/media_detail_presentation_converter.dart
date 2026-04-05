import 'package:kadro_app/shared/domain/entities/media_detail.dart';
import 'package:kadro_app/shared/domain/entities/media_presentation_data.dart';

final class MediaDetailPresentationConverter {
  const MediaDetailPresentationConverter();

  MediaPresentationData fromMediaDetail(MediaDetail detail) {
    return MediaPresentationData(
      id: detail.id,
      similarity: detail.similarity,
      type: detail.type,
      format: detail.format,
      status: detail.status,
      description: detail.parsedDescription,
      siteUrl: detail.siteUrl,
      bannerImage: detail.bannerImage,
      coverImageLarge: detail.coverImage.large,
      coverImageExtraLarge: detail.coverImage.extraLarge,
      title: MediaPresentationTitle(
        romaji: detail.title.romaji,
        english: detail.title.english,
        nativeTitle: detail.title.nativeTitle,
      ),
      startDate: MediaPresentationDate(
        year: detail.startDate.year,
        month: detail.startDate.month,
        day: detail.startDate.day,
      ),
      endDate: MediaPresentationDate(
        year: detail.endDate.year,
        month: detail.endDate.month,
        day: detail.endDate.day,
      ),
      season: detail.season,
      seasonYear: detail.seasonYear,
      episodes: detail.episodes,
      duration: detail.duration,
      averageScore: detail.averageScore,
      meanScore: detail.meanScore,
      popularity: detail.popularity,
      trending: detail.trending,
      favourites: detail.favourites,
      countryOfOrigin: detail.countryOfOrigin,
      source: detail.source,
      isLicensed: detail.isLicensed,
      synonyms: List<String>.unmodifiable(detail.synonyms),
      genres: List<String>.unmodifiable(detail.genres),
      tags: detail.tags
          .map(
            (tag) => MediaPresentationTag(
              name: tag.name,
              rank: tag.rank,
              isMediaSpoiler: tag.isMediaSpoiler,
              category: tag.category,
            ),
          )
          .toList(growable: false),
      studios: detail.studios.nodes
          .map(
            (studio) => MediaPresentationStudio(
              name: studio.name,
              isMain: studio.isMain,
            ),
          )
          .toList(growable: false),
      rankings: detail.rankings
          .map(
            (ranking) => MediaPresentationRanking(
              rank: ranking.rank,
              allTime: ranking.allTime,
              type: ranking.type,
              context: ranking.context,
            ),
          )
          .toList(growable: false),
    );
  }
}
