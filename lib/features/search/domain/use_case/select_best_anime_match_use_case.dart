import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/search/domain/entities/anime_match.dart';

final class SelectBestAnimeMatchUseCase
    implements IUseCase<List<AnimeMatch>, AnimeMatch?> {
  @override
  AnimeMatch? execute([List<AnimeMatch>? matches]) {
    if (matches == null) {
      throw NotNullableError<List<AnimeMatch>>('matches');
    }

    if (matches.isEmpty) {
      return null;
    }

    return matches.reduce(
      (value, element) =>
          value.similarity >= element.similarity ? value : element,
    );
  }
}
