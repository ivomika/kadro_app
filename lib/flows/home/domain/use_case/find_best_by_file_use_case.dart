import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';
import 'package:kadro_app/features/detail/domain/use_case/find_detail_by_id_use_case.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/features/search/domain/use_case/search_by_file_use_case.dart';

final class FindBestByFileUseCase
    implements IUseCase<File, Future<MediaDetail?>> {
  final IAnimeMatchRepository _matchRepository;
  final IMediaDetailRepository _detailRepository;

  FindBestByFileUseCase(this._matchRepository, this._detailRepository);

  @override
  Future<MediaDetail?> execute([File? file]) async {
    if (file == null) return null;

    final result = await SearchByFileUseCase(_matchRepository).execute(file);
    if (result.isEmpty) return null;

    final bestMatch = result.reduce(
      (value, element) =>
          value.similarity >= element.similarity ? value : element,
    );

    final detailResult = await FindDetailByIdUseCase(_detailRepository).execute(
        FindDetailRequest(
          bestMatch.anilist,
          bestMatch.similarity
       )
    );
    return detailResult;
  }
}
