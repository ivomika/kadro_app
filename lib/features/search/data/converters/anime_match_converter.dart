import 'package:kadro_app/features/search/data/models/anime_match_response/anime_match_response.dart';
import 'package:kadro_app/features/search/domain/entities/anime_match.dart';

final class AnimeMatchConverter {
  const AnimeMatchConverter();

  AnimeMatch fromResponse(AnimeMatchResult result) {
    return AnimeMatch(
      anilist: result.anilist,
      filename: result.filename,
      similarity: result.similarity,
      video: result.video,
      image: result.image,
    );
  }
}
