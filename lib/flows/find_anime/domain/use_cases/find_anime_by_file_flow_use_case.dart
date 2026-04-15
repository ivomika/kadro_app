import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/use_case/find_detail_by_id_use_case.dart';
import 'package:kadro_app/features/search/domain/use_case/search_by_file_use_case.dart';
import 'package:kadro_app/features/search/domain/use_case/select_best_anime_match_use_case.dart';

final class FindAnimeByFileFlowUseCase
    implements IUseCase<File, Future<MediaDetail?>> {
  final SearchByFileUseCase _searchByFileUseCase;
  final SelectBestAnimeMatchUseCase _selectBestAnimeMatchUseCase;
  final FindDetailByIdUseCase _findDetailByIdUseCase;

  FindAnimeByFileFlowUseCase(
    this._searchByFileUseCase,
    this._selectBestAnimeMatchUseCase,
    this._findDetailByIdUseCase,
  );

  @override
  Future<MediaDetail?> execute([File? file]) async {
    if (file == null) {
      return null;
    }

    final matches = await _searchByFileUseCase.execute(file);
    final bestMatch = _selectBestAnimeMatchUseCase.execute(matches);

    if (bestMatch == null) {
      return null;
    }

    return _findDetailByIdUseCase.execute(
      FindDetailRequest(bestMatch.anilist, bestMatch.similarity),
    );
  }
}
