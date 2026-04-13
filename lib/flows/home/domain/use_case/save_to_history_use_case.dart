import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';

final class SaveToHistoryUseCase implements IUseCase<MediaDetail, Future<void>> {
  final IHistoryRepository _repository;

  SaveToHistoryUseCase(this._repository);

  @override
  Future<void> execute([MediaDetail? match]) async {
    if (match == null){
      throw NotNullableError<MediaDetail>('match');
    }

   await _repository.create(
     AnimeHistory.from(
       anilist: match.id,
       name: match.title.romaji,
       imageUrl: match.coverImage.large,
       similarity: match.similarity,
       format: match.format,
       status: match.status,
       season: match.season,
       seasonYear: match.seasonYear,
       episodes: match.episodes,
       description: match.parsedDescription,
     )
   );
  }
}
