import 'package:drift/drift.dart';
import 'package:kadro_app/features/history/data/datasource/history_database.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';

final class AnimeHistoryConverter {
  const AnimeHistoryConverter();

  AnimeHistory fromTableData(AnimeHistoryTableData row) {
    return AnimeHistory(
      id: row.uuid,
      anilist: row.anilist,
      name: row.name,
      imageUrl: row.imageUrl,
      similarity: row.similarity,
      format: row.format,
      status: row.status,
      season: row.season,
      seasonYear: row.seasonYear,
      episodes: row.episodes,
      description: row.description,
    );
  }

  AnimeHistoryTableCompanion toInsertCompanion(AnimeHistory model) {
    return AnimeHistoryTableCompanion.insert(
      uuid: Value(model.id),
      anilist: model.anilist,
      name: model.name,
      imageUrl: model.imageUrl,
      similarity: model.similarity,
      format: model.format,
      status: model.status,
      season: model.season,
      seasonYear: model.seasonYear,
      episodes: model.episodes,
      description: model.description,
    );
  }

  AnimeHistoryTableCompanion toUpdateCompanion(AnimeHistory model) {
    return AnimeHistoryTableCompanion(
      uuid: Value(model.id),
      anilist: Value(model.anilist),
      name: Value(model.name),
      imageUrl: Value(model.imageUrl),
      similarity: Value(model.similarity),
      format: Value(model.format),
      status: Value(model.status),
      season: Value(model.season),
      seasonYear: Value(model.seasonYear),
      episodes: Value(model.episodes),
      description: Value(model.description),
    );
  }
}
