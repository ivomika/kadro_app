import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/data/models/anilist_response/anilist_response.dart';

final class AnilistClient extends BaseApiClient{
  static const String _baseUrl = 'https://graphql.anilist.co';

  AnilistClient() : super(_baseUrl);

  Future<FetchResponse<AnilistResponse>> searchByAnilistId(int id) async {
    final request = GraphQlRequest(
        query: '''
            query AnimeDetails(\$id: Int!) {
                Media(id: \$id, type: ANIME) {
                  id
                  idMal
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
                  popularity
                  genres
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
                  studios(isMain: true) {
                    nodes {
                      id
                      name
                    }
                  }
                  trailer {
                    id
                    site
                    thumbnail
                  }
                  siteUrl
                }
              }
        ''',
        variables: {'id': id}
    );

    return await fetch(
        RequestMethod.post,
        '',
        body: request.toJson(),
        factory: AnilistResponse.fromJson
    );
  }
}