import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/search/data/models/anime_match_response/anime_match_response.dart';

abstract interface class TraceMoeDataSource {
  Future<FetchResponse<AnimeMatchResponse>> searchByImage(File file);
  Future<FetchResponse<AnimeMatchResponse>> searchBuUrl(String url);
}

final class TraceMoeClient extends BaseApiClient implements TraceMoeDataSource {
  static const String _baseUrl = 'https://api.trace.moe';

  TraceMoeClient() : super(_baseUrl);

  @override
  Future<FetchResponse<AnimeMatchResponse>> searchByImage(File file) async {
    return await upload(
      file,
      '/search',
      queryParams: {'cutBorders': null},
      factory: AnimeMatchResponse.fromJson,
    );
  }

  @override
  Future<FetchResponse<AnimeMatchResponse>> searchBuUrl(String url) async {
    return await fetch(
      RequestMethod.get,
      '/search',
      queryParams: {'cutBorders': null, 'url': url.trim()},
      factory: AnimeMatchResponse.fromJson,
    );
  }
}
