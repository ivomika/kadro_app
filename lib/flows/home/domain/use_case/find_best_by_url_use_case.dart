import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/use_case/find_detail_by_id_use_case.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';
import 'package:kadro_app/features/search/domain/use_case/search_by_url_use_case.dart';

final class FindBestByUrlUseCase
    implements IUseCase<String, Future<MediaDetail?>> {
  final IAnimeMatchRepository _matchRepository;
  final IMediaDetailRepository _detailRepository;

  FindBestByUrlUseCase(this._matchRepository, this._detailRepository);

  @override
  Future<MediaDetail?> execute([String? url]) async {
    if (url == null) return null;
    if (url.trim().isEmpty) return null;

    final result = await SearchByUrlUseCase(_matchRepository).execute(url);
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
