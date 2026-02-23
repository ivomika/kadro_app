import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_history.dart';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';
import 'package:kadro_app/shared/domain/repository/i_history_repository.dart';
import 'package:uuid/uuid.dart';

final class UpdateHistoryUseCase implements IUseCase<AnimeMatch, Future<List<AnimeHistory>>>{
  final IHistoryRepository _repository;

  UpdateHistoryUseCase(this._repository);

  @override
  Future<List<AnimeHistory>> execute([AnimeMatch? matchedAnime]) async {
    if(matchedAnime == null) throw Exception('matchedAnime is null');
    await _repository.create(_toHistory(matchedAnime));

    return await _repository.all();
  }

  AnimeHistory _toHistory(AnimeMatch match){
    return AnimeHistory(
        id: Uuid().v4(),
        anilist: match.anilist,
        filename: match.filename,
        episode: match.episode,
        video: match.video,
        image: match.image
    );
  }
}