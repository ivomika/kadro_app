import 'package:kadro_app/shared/data/datasource/anilist_client.dart';
import 'package:kadro_app/shared/data/models/anilist_response/anilist_response.dart';
import 'package:kadro_app/shared/domain/entities/anime_detail.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_detail_repository.dart';

final class AnimeDetailRepositoryImpl implements IAnimeDetailRepository{
  final AnilistClient _client;

  AnimeDetailRepositoryImpl(this._client);

  @override
  Future<AnimeDetail?> searchByAnilistId(int id) async {
    final result = await _client.searchByAnilistId(id);

    if(result.isSuccess == false) return null;

    return result.data?.data.media.toDomain();
  }
}


extension ResultExtension on AnilistMedia{
  AnimeDetail? toDomain(){
    return AnimeDetail(
        id: id,
        idMal: idMal ?? -1,
        title: AnimeTitle(
          romaji: title.romaji,
          english: title.english,
          nativeTitle: title.nativeTitle,
        ),
        description: description ?? '',
        format: format ?? '',
        status: status ?? '',
        episodes: episodes ?? -1,
        duration: duration ?? -1,
        season: season ?? '',
        seasonYear: seasonYear ?? -1,
        averageScore: averageScore ?? -1,
        popularity: popularity ?? -1,
        genres: List<String>.unmodifiable(genres),
        coverImage: AnimeCoverImage(
          large: coverImage.large,
          extraLarge: coverImage.extraLarge,
          color: coverImage.color,
        ),
        bannerImage: bannerImage ?? '',
        startDate: AnimeFuzzyDate(
          year: startDate.year,
          month: startDate.month,
          day: startDate.day,
        ),
        endDate: AnimeFuzzyDate(
          year: endDate.year,
          month: endDate.month,
          day: endDate.day,
        ),
        studios: AnimeStudios(
          nodes: studios.nodes
              .map(
                (e) => AnimeStudioNode(
              id: e.id,
              name: e.name,
            ),
          )
              .toList(growable: false),
        ),
        trailer: trailer == null
            ? null
            : AnimeTrailer(
          id: trailer!.id,
          site: trailer!.site,
          thumbnail: trailer!.thumbnail,
        ),
        siteUrl: siteUrl ?? '',
    );
  }
}
