import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/search/data/converters/anime_match_converter.dart';
import 'package:kadro_app/features/search/data/datasource/trace_moe_client.dart';
import 'package:kadro_app/features/search/domain/entities/anime_match.dart';
import 'package:kadro_app/features/search/domain/exceptions/anime_match_search_exception.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/shared/utils/error_message_extractor.dart';

final class AnimeMatchRepositoryImpl implements IAnimeMatchRepository {
  final TraceMoeDataSource _client;
  final AnimeMatchConverter _converter;

  AnimeMatchRepositoryImpl(
    this._client, {
    AnimeMatchConverter converter = const AnimeMatchConverter(),
  }) : _converter = converter;

  @override
  Future<List<AnimeMatch>> searchByImage(File file) async {
    try {
      final result = await _client.searchByImage(file);

      if (result.isSuccess == false) {
        throw AnimeMatchSearchException(
          extractErrorMessage(result.error) ?? 'Не удалось выполнить поиск',
        );
      }

      return result.data!.result
          .map(_converter.fromResponse)
          .toList(growable: false);
    } on ClientErrorException catch (error) {
      throw AnimeMatchSearchException(
        extractErrorMessage(error.response?.data) ?? 'Некорректный запрос',
      );
    } on ServerErrorException catch (error) {
      throw AnimeMatchSearchException(
        extractErrorMessage(error.response?.data) ?? 'Сервис поиска недоступен',
      );
    } on DioException {
      throw const AnimeMatchSearchException(
        'Не удалось выполнить поиск из-за сетевой ошибки',
      );
    }
  }

  @override
  Future<List<AnimeMatch>> searchByUrl(String url) async {
    try {
      final result = await _client.searchBuUrl(url);

      if (result.isSuccess == false) {
        throw AnimeMatchSearchException(
          extractErrorMessage(result.error) ?? 'Не удалось выполнить поиск',
        );
      }

      return result.data!.result
          .map(_converter.fromResponse)
          .toList(growable: false);
    } on ClientErrorException catch (error) {
      throw AnimeMatchSearchException(
        extractErrorMessage(error.response?.data) ?? 'Некорректный запрос',
      );
    } on ServerErrorException catch (error) {
      throw AnimeMatchSearchException(
        extractErrorMessage(error.response?.data) ?? 'Сервис поиска недоступен',
      );
    } on DioException {
      throw const AnimeMatchSearchException(
        'Не удалось выполнить поиск из-за сетевой ошибки',
      );
    }
  }
}
