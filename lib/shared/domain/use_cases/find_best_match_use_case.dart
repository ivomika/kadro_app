import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';

final class FindBestMatchUseCase implements IUseCase<File, Future<AnimeMatch?>>{
  final IAnimeMatchRepository _repository;

  FindBestMatchUseCase(this._repository);

  @override
  Future<AnimeMatch?> execute([File? matchedAnime]) async {
    if(matchedAnime == null) return null;

    final result = await _repository.searchByImage(matchedAnime);
    if(result.isEmpty) return null;

    return result.reduce(
        (value, element) => value.similarity >= element.similarity
            ? value
            : element
    );
  }
}