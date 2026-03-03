import 'package:kadro_app/features/search/domain/entities/anime_detail.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FakeAnimeDetail extends AnimeDetail{
  const FakeAnimeDetail._({
    required super.id,
    required super.idMal,
    required super.title,
    required super.description,
    required super.format,
    required super.status,
    required super.episodes,
    required super.duration,
    required super.season,
    required super.seasonYear,
    required super.averageScore,
    required super.popularity,
    required super.genres,
    required super.coverImage,
    required super.bannerImage,
    required super.startDate,
    required super.endDate,
    required super.studios,
    required super.trailer,
    required super.siteUrl,
    required super.similarity
  });

  factory FakeAnimeDetail() => FakeAnimeDetail._(
      id: 0,
      idMal: 0,
      title: AnimeTitle(
          romaji: BoneMock.title,
          english: BoneMock.title,
          nativeTitle: BoneMock.title
      ),
      description: BoneMock.longParagraph,
      format: BoneMock.name,
      status: BoneMock.name,
      episodes: 24,
      duration: 0,
      season: BoneMock.name,
      seasonYear: 2000,
      averageScore: 0,
      popularity: 0,
      genres: List.generate(5, (index) => BoneMock.name),
      coverImage: AnimeCoverImage(
          large: '',
          extraLarge: '',
          color: '',
      ),
      bannerImage: BoneMock.name,
      startDate: AnimeFuzzyDate(
          year: 2000,
          month: 12,
          day: 13
      ),
      endDate: AnimeFuzzyDate(
          year: 2000,
          month: 12,
          day: 13
      ),
      studios: AnimeStudios(
          nodes: List.generate(5, (index) => AnimeStudioNode(
              id: 0,
              name: BoneMock.name
          )
        )
      ),
      trailer: AnimeTrailer(
          id: BoneMock.name,
          site: BoneMock.name,
          thumbnail: BoneMock.name
      ),
      siteUrl: BoneMock.name,
      similarity: 0.0
  );
}