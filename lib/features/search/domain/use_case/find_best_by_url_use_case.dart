import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/search/domain/entities/anime_detail.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_detail_repository.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';

final class FindBestByUrlUseCase implements IUseCase<String, Future<AnimeDetail?>>{
  final IAnimeMatchRepository _matchRepository;
  final IAnimeDetailRepository _detailRepository;

  FindBestByUrlUseCase(
      this._matchRepository,
      this._detailRepository
  );

  @override
  Future<AnimeDetail?> execute([String? url]) async {
    if(url == null) return null;
    if(url.trim().isEmpty) return null;

    final result = await _matchRepository.searchByUrl(url);
    if(result.isEmpty) return null;

    final bestMatch = result.reduce(
            (value, element) => value.similarity >= element.similarity
            ? value
            : element
    );

    final detailResult = await _detailRepository.searchByAnilistId(bestMatch.anilist, bestMatch.similarity);
    return detailResult;
  }
}