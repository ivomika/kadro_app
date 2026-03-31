import 'package:kadro_app/features/search/data/models/anilist_response/anilist_response.dart';
import 'package:kadro_app/features/search/domain/entities/anime_detail.dart';

final class AnimeDetailConverter {
  const AnimeDetailConverter();

  AnimeDetail fromResponse(AnilistMedia media, double similarity) {
    return AnimeDetail(
      id: media.id,
      idMal: media.idMal ?? -1,
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
      popularity: media.popularity ?? -1,
      genres: List<String>.unmodifiable(media.genres),
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
        nodes: media.studios.nodes
            .map(
              (studio) => AnimeStudioNode(
                id: studio.id,
                name: studio.name,
              ),
            )
            .toList(growable: false),
      ),
      trailer: AnimeTrailer(
        id: media.trailer?.id ?? '',
        site: media.trailer?.site ?? '',
        thumbnail: media.trailer?.thumbnail ?? '',
      ),
      siteUrl: media.siteUrl ?? '',
      similarity: similarity,
    );
  }
}
