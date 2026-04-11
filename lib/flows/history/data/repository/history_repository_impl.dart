import 'package:drift/drift.dart';
import 'package:kadro_app/flows/history/data/converters/anime_history_converter.dart';
import 'package:kadro_app/flows/history/data/datasource/history_database.dart';
import 'package:kadro_app/flows/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/history/domain/repository/i_history_repository.dart';

final class HistoryRepositoryImpl implements IHistoryRepository {
  final HistoryDriftDatabase _database;
  final AnimeHistoryConverter _converter;

  HistoryRepositoryImpl(
    this._database, {
    AnimeHistoryConverter converter = const AnimeHistoryConverter(),
  }) : _converter = converter;

  @override
  Future<List<AnimeHistory>> all() async {
    final rows = await (_database.select(_database.animeHistoryTable)
      ..orderBy([(table) => OrderingTerm.desc(table.id)]))
      .get();

    return rows.map(_converter.fromTableData).toList(growable: false);
  }

  @override
  Future<AnimeHistory> byId(String id) async {
    final row = await (_database.select(_database.animeHistoryTable)
      ..where((table) => table.uuid.equals(id)))
      .getSingleOrNull();

    if (row == null) {
      throw StateError('AnimeHistory with id=$id not found');
    }

    return _converter.fromTableData(row);
  }

  @override
  Future<AnimeHistory> create(AnimeHistory model) async {
    await _database.into(_database.animeHistoryTable).insert(
      _converter.toInsertCompanion(model),
      mode: InsertMode.insertOrAbort,
    );

    return byId(model.id);
  }

  @override
  Future<AnimeHistory> delete(AnimeHistory model) async {
    final existingRow = await (_database.select(_database.animeHistoryTable)
      ..where((table) => table.uuid.equals(model.id)))
      .getSingleOrNull();

    if (existingRow == null) {
      throw StateError('AnimeHistory with id=${model.id} not found');
    }

    await (_database.delete(_database.animeHistoryTable)
      ..where((table) => table.uuid.equals(model.id)))
      .go();

    return _converter.fromTableData(existingRow);
  }

  @override
  Future<List<AnimeHistory>> search(String request) async {
    final trimmedRequest = request.trim();

    if (trimmedRequest.isEmpty) {
      return all();
    }

    final likePattern = '%$trimmedRequest%';

    final rows = await (_database.select(_database.animeHistoryTable)
      ..where(
            (table) =>
        table.uuid.like(likePattern) |
        table.name.like(likePattern)
      )
      ..orderBy([(table) => OrderingTerm.desc(table.id)]))
      .get();

    return rows.map(_converter.fromTableData).toList();
  }

  @override
  Future<AnimeHistory> update(AnimeHistory model) async {
    final updatedRowsCount = await (_database.update(_database.animeHistoryTable)
      ..where((table) => table.uuid.equals(model.id)))
        .write(
      _converter.toUpdateCompanion(model),
    );

    if (updatedRowsCount == 0) {
      throw StateError('AnimeHistory with id=${model.id} not found');
    }

    return byId(model.id);
  }
}
