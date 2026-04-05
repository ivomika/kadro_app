import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/data/models/anilist_response.dart';

final class AnilistClient extends BaseApiClient {
  static const String _baseUrl = 'https://graphql.anilist.co';

  AnilistClient() : super(_baseUrl);

  Future<FetchResponse<AnilistResponse>> searchByAnilistId(int id) async {
    final request = GraphQlRequest(
      query: '''
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
        ''',
      variables: {'id': id},
    );

    return fetch(
      RequestMethod.post,
      '',
      body: request.toJson(),
      factory: AnilistResponse.fromJson,
    );
  }
}
