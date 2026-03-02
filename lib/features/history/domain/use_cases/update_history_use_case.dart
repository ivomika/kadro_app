import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';

final class UpdateHistoryUseCase implements IUseCase<AnimeHistory, Future<List<AnimeHistory>>>{
  final IHistoryRepository _repository;

  UpdateHistoryUseCase(this._repository);

  @override
  Future<List<AnimeHistory>> execute([AnimeHistory? matchedAnime]) async {
    if(matchedAnime == null) throw Exception('matchedAnime is null');
    await _repository.create(matchedAnime);

    return await _repository.all();
  }
}