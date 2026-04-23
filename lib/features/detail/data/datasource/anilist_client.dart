import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/data/models/anilist_response.dart';

abstract interface class AnilistDataSource {
  Future<GraphQlResponse<AnilistData>> searchByAnilistId(int id);
}

final class AnilistClient extends BaseApiClient
    with GraphQlClientMixin
    implements AnilistDataSource {
  static const String _baseUrl = 'https://graphql.anilist.co';
  static const String _animeDetailsQuery = '''
    query AnimeDetails(\$id: Int!) {
      Media(id: \$id, type: ANIME) {
        id
        idMal
        type
        title {
          romaji
          english
          native
        }
        description(asHtml: true)
        format
        status
        episodes
        duration
        season
        seasonYear
        averageScore
        meanScore
        popularity
        trending
        favourites
        countryOfOrigin
        source
        isLicensed
        genres
        synonyms
        tags {
          name
          rank
          isMediaSpoiler
          category
        }
        rankings {
          rank
          type
          year
          season
          allTime
          context
        }
        coverImage {
          large
          extraLarge
          color
        }
        bannerImage
        startDate {
          year
          month
          day
        }
        endDate {
          year
          month
          day
        }
        studios {
          edges {
            isMain
            node {
              id
              name
            }
          }
        }
        siteUrl
      }
    }
  ''';

  AnilistClient() : super(_baseUrl);

  @override
  Future<GraphQlResponse<AnilistData>> searchByAnilistId(int id) {
    return query(
      GraphQlRequest(
        operationName: 'AnimeDetails',
        query: _animeDetailsQuery,
        variables: {'id': id},
      ),
      factory: AnilistData.fromJson,
    );
  }
}
