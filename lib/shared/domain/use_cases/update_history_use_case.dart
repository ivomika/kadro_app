import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_detail.dart';
import 'package:kadro_app/shared/domain/entities/anime_history.dart';
import 'package:kadro_app/shared/domain/repository/i_history_repository.dart';
import 'package:uuid/uuid.dart';

final class UpdateHistoryUseCase implements IUseCase<AnimeDetail, Future<List<AnimeHistory>>>{
  final IHistoryRepository _repository;

  UpdateHistoryUseCase(this._repository);

  @override
  Future<List<AnimeHistory>> execute([AnimeDetail? matchedAnime]) async {
    if(matchedAnime == null) throw Exception('matchedAnime is null');
    await _repository.create(_toHistory(matchedAnime));

    return await _repository.all();
  }

  AnimeHistory _toHistory(AnimeDetail match){
    return AnimeHistory(
        id: Uuid().v4(),
        anilist: match.id,
        name: match.title.english ?? '',
        image: match.coverImage.large ?? ''
    );
  }
}