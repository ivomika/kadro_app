import 'package:kadro_app/flows/search/data/models/anime_match_response/anime_match_response.dart';
import 'package:kadro_app/flows/search/domain/entities/anime_match.dart';

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
