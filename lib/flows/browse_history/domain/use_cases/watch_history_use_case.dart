import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';

final class WatchHistoryUseCase {
  final IHistoryRepository _repository;

  WatchHistoryUseCase(this._repository);

  Stream<List<AnimeHistory>> execute() => _repository.watchAll();
}
