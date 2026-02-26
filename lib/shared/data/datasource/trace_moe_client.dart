import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/data/models/anime_match_response/anime_match_response.dart';

final class TraceMoeClient extends BaseApiClient{
  static const String _baseUrl = 'https://api.trace.moe';

  TraceMoeClient() : super(_baseUrl);

  Future<FetchResponse<AnimeMatchResponse>> searchByImage(File file) async {
    return await upload(
        file,
        '/search',
        queryParams: {
          'cutBorders': null
        },
        factory: AnimeMatchResponse.fromJson
    );
  }

  Future<FetchResponse<AnimeMatchResponse>> searchBuUrl(String url) async {
    return await fetch(
        RequestMethod.get,
        '/search',
        queryParams: {
          'cutBorders': null,
          'url': url.trim(),
        },
        factory: AnimeMatchResponse.fromJson
    );
  }
}