import 'dart:io';

import 'package:kadro_app/flows/search/data/converters/anime_match_converter.dart';
import 'package:kadro_app/flows/search/data/datasource/trace_moe_client.dart';
import 'package:kadro_app/flows/search/domain/entities/anime_match.dart';
import 'package:kadro_app/flows/search/domain/repository/i_anime_match_repository.dart';

final class AnimeMatchRepositoryImpl implements IAnimeMatchRepository {
  final TraceMoeDataSource _client;
  final AnimeMatchConverter _converter;

  AnimeMatchRepositoryImpl(
    this._client, {
    AnimeMatchConverter converter = const AnimeMatchConverter(),
  }) : _converter = converter;

  @override
  Future<List<AnimeMatch>> searchByImage(File file) async {
    final result = await _client.searchByImage(file);

    if (result.isSuccess == false) return [];
    return result.data!.result
        .map(_converter.fromResponse)
        .toList(growable: false);
  }

  @override
  Future<List<AnimeMatch>> searchByUrl(String url) async {
    final result = await _client.searchBuUrl(url);

    if (result.isSuccess == false) return [];
    return result.data!.result
        .map(_converter.fromResponse)
        .toList(growable: false);
  }
}
