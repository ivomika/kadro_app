import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/shared/utils/plain_text_from_html.dart';

final class MediaDetailToAnimeHistoryConverter {
  const MediaDetailToAnimeHistoryConverter();

  AnimeHistory convert(MediaDetail media) {
    return AnimeHistory.from(
      anilist: media.id,
      name: media.title.romaji,
      imageUrl: media.coverImage.large,
      similarity: media.similarity,
      format: media.format,
      status: media.status,
      season: media.season,
      seasonYear: media.seasonYear,
      episodes: media.episodes,
      description: plainTextFromHtml(media.description),
    );
  }
}
