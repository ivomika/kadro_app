import 'dart:io';

import 'package:kadro_app/shared/data/datasource/trace_moe_client.dart';
import 'package:kadro_app/shared/data/models/anime_match_response/anime_match_response.dart';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';

final class AnimeMatchRepositoryImpl implements IAnimeMatchRepository {
  final TraceMoeClient _client;

  AnimeMatchRepositoryImpl(this._client);

  @override
  Future<List<AnimeMatch>> searchByImage(File file) async {
    final result = await _client.searchByImage(file);

    if(result.isSuccess == false) return [];
    return result
        .data
        !.result
        .where((e) => e.toDomain() != null)
        .map((e) => e.toDomain()!)
        .toList(growable: false);
  }
}