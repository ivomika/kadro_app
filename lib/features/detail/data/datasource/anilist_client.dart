import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/data/models/anilist_response.dart';
import 'package:kadro_app/features/detail/data/operations/anime_details_query.dart';

abstract interface class AnilistDataSource {
  Future<GraphQlResponse<AnilistData>> searchByAnilistId(int id);
}

final class AnilistClient extends BaseApiClient
    with GraphQlClientMixin
    implements AnilistDataSource {
  static const String _baseUrl = 'https://graphql.anilist.co';

  AnilistClient() : super(_baseUrl);

  @override
  Future<GraphQlResponse<AnilistData>> searchByAnilistId(int id) {
    return queryOperation(
      AnimeDetailsQuery(variables: AnimeDetailsVariables(id: id)),
    );
  }
}
