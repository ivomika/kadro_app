import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/data/models/anime_match_response/anime_match_response.dart';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';

final class AnimeMatchRepositoryImpl extends BaseApiClient implements IAnimeMatchRepository {
  static const String _baseUrl = 'https://api.trace.moe';
  AnimeMatchRepositoryImpl() : super(_baseUrl);

  @override
  Future<List<AnimeMatch>> searchByImage(File file) async {
    final result = await upload(
        file,
        '/search',
        factory: AnimeMatchResponse.fromJson
    );

    if(result.isSuccess == false) return [];
    return result
        .data
        !.result
        .where((e) => e.toDomain() != null)
        .map((e) => e.toDomain()!)
        .toList(growable: false);
  }
}