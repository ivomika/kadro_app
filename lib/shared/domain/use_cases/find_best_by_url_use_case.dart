import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';

final class FindBestByUrlUseCase implements IUseCase<String, Future<AnimeMatch?>>{
  final IAnimeMatchRepository _repository;

  FindBestByUrlUseCase(this._repository);

  @override
  Future<AnimeMatch?> execute([String? url]) async {
    if(url == null) return null;
    if(url.trim().isEmpty) return null;

    final result = await _repository.searchByUrl(url);
    if(result.isEmpty) return null;

    return result.reduce(
            (value, element) => value.similarity >= element.similarity
            ? value
            : element
    );
  }
}