import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_history.dart';
import 'package:kadro_app/shared/domain/repository/i_history_repository.dart';

final class LoadHistoryUseCase implements IUseCase<Object?, Future<List<AnimeHistory>>>{
  final IHistoryRepository _repository;

  LoadHistoryUseCase(this._repository);

  @override
  Future<List<AnimeHistory>> execute([Object? emptyObject]) async {
    return await _repository.all();
  }
}