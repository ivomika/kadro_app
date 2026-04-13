import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/search/domain/entities/anime_match.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';

class SearchByFileUseCase implements IUseCase<File, Future<List<AnimeMatch>>> {
  final IAnimeMatchRepository _repository;

  SearchByFileUseCase(this._repository);

  @override
  Future<List<AnimeMatch>> execute([File? file]) async {
    if(file == null){
      throw NotNullableError<File>('file');
    }

    return await _repository.searchByImage(file);
  }

}