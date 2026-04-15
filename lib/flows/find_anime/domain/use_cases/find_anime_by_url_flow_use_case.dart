import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/use_case/find_detail_by_id_use_case.dart';
import 'package:kadro_app/features/search/domain/use_case/search_by_url_use_case.dart';
import 'package:kadro_app/features/search/domain/use_case/select_best_anime_match_use_case.dart';

final class FindAnimeByUrlFlowUseCase
    implements IUseCase<String, Future<MediaDetail?>> {
  final SearchByUrlUseCase _searchByUrlUseCase;
  final SelectBestAnimeMatchUseCase _selectBestAnimeMatchUseCase;
  final FindDetailByIdUseCase _findDetailByIdUseCase;

  FindAnimeByUrlFlowUseCase(
    this._searchByUrlUseCase,
    this._selectBestAnimeMatchUseCase,
    this._findDetailByIdUseCase,
  );

  @override
  Future<MediaDetail?> execute([String? url]) async {
    if (url == null || url.trim().isEmpty) {
      return null;
    }

    final matches = await _searchByUrlUseCase.execute(url);
    final bestMatch = _selectBestAnimeMatchUseCase.execute(matches);

    if (bestMatch == null) {
      return null;
    }

    return _findDetailByIdUseCase.execute(
      FindDetailRequest(bestMatch.anilist, bestMatch.similarity),
    );
  }
}
