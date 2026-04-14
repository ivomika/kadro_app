import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/use_case/find_detail_by_id_use_case.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';

final class LoadHistoryMediaDetailUseCase {
  final FindDetailByIdUseCase _findDetailByIdUseCase;

  LoadHistoryMediaDetailUseCase(this._findDetailByIdUseCase);

  Future<MediaDetail> execute(AnimeHistory anime) {
    return _findDetailByIdUseCase.execute(
      FindDetailRequest(anime.anilist, anime.similarity),
    );
  }
}
