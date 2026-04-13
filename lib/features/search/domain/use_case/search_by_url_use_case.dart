import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/search/domain/entities/anime_match.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:validators/validators.dart';

class SearchByUrlUseCase implements IUseCase<String, Future<List<AnimeMatch>>> {
  final IAnimeMatchRepository _repository;

  SearchByUrlUseCase(this._repository);

  @override
  Future<List<AnimeMatch>> execute([String? url]) async {
    if(url == null){
      throw NotNullableError<String>('url');
    }

    if(url.trim().isEmpty){
      throw Exception('url is empty');
    }

    if(isURL(url) == false){
      throw Exception('$url - Not valid url');
    }

    return await _repository.searchByUrl(url);
  }

}