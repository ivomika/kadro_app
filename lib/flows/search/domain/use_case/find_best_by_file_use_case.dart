import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/shared/domain/entities/media_detail.dart';
import 'package:kadro_app/shared/domain/repository/i_media_detail_repository.dart';

final class FindBestByFileUseCase
    implements IUseCase<File, Future<MediaDetail?>> {
  final IAnimeMatchRepository _matchRepository;
  final IMediaDetailRepository _detailRepository;

  FindBestByFileUseCase(this._matchRepository, this._detailRepository);

  @override
  Future<MediaDetail?> execute([File? matchedAnime]) async {
    if (matchedAnime == null) return null;

    final result = await _matchRepository.searchByImage(matchedAnime);
    if (result.isEmpty) return null;

    final bestMatch = result.reduce(
      (value, element) =>
          value.similarity >= element.similarity ? value : element,
    );

    final detailResult = await _detailRepository.searchByAnilistId(
      bestMatch.anilist,
      bestMatch.similarity,
    );
    return detailResult;
  }
}
