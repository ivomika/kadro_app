import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';

final class SaveAnimeDetailToHistoryFlowUseCase
    implements IUseCase<MediaDetail, Future<void>> {
  final IHistoryRepository _repository;

  SaveAnimeDetailToHistoryFlowUseCase(this._repository);

  @override
  Future<void> execute([MediaDetail? media]) async {
    if (media == null) {
      throw NotNullableError<MediaDetail>('media');
    }

    await _repository.create(
      AnimeHistory.from(
        anilist: media.id,
        name: media.title.romaji,
        imageUrl: media.coverImage.large,
        similarity: media.similarity,
        format: media.format,
        status: media.status,
        season: media.season,
        seasonYear: media.seasonYear,
        episodes: media.episodes,
        description: media.parsedDescription,
      ),
    );
  }
}
