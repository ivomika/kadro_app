import 'package:drift/drift.dart';
import 'package:kadro_app/shared/data/datasource/history_database.dart';
import 'package:kadro_app/shared/domain/entities/anime_history.dart';
import 'package:kadro_app/shared/domain/repository/i_history_repository.dart';

final class HistoryRepositoryImpl implements IHistoryRepository{
  final HistoryDriftDatabase _database;

  HistoryRepositoryImpl(this._database);

  AnimeHistory _mapTableToEntity(AnimeHistoryTableData row) {
    return AnimeHistory(
      id: row.uuid,
      anilist: row.anilist,
      name: row.name,
      image: row.image,
    );
  }

  AnimeHistoryTableCompanion _mapEntityToInsertCompanion(AnimeHistory model) {
    return AnimeHistoryTableCompanion.insert(
      uuid: Value(model.id),
      anilist: model.anilist,
      name: model.name,
      image: model.image,
    );
  }

  AnimeHistoryTableCompanion _mapEntityToUpdateCompanion(AnimeHistory model) {
    return AnimeHistoryTableCompanion(
      uuid: Value(model.id),
      anilist: Value(model.anilist),
      name: Value(model.name),
      image: Value(model.image),
    );
  }

  @override
  Future<List<AnimeHistory>> all() async {
    final rows = await (_database.select(_database.animeHistoryTable)
      ..orderBy([(table) => OrderingTerm.desc(table.id)]))
      .get();

    return rows.map(_mapTableToEntity).toList(growable: false);
  }

  @override
  Future<AnimeHistory> byId(String id) async {
    final row = await (_database.select(_database.animeHistoryTable)
      ..where((table) => table.uuid.equals(id)))
      .getSingleOrNull();

    if (row == null) {
      throw StateError('AnimeHistory with id=$id not found');
    }

    return _mapTableToEntity(row);
  }

  @override
  Future<AnimeHistory> create(AnimeHistory model) async {
    await _database.into(_database.animeHistoryTable).insert(
      _mapEntityToInsertCompanion(model),
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

    return _mapTableToEntity(existingRow);
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

    return rows.map(_mapTableToEntity).toList();
  }

  @override
  Future<AnimeHistory> update(AnimeHistory model) async {
    final updatedRowsCount = await (_database.update(_database.animeHistoryTable)
      ..where((table) => table.uuid.equals(model.id)))
        .write(
      _mapEntityToUpdateCompanion(model),
    );

    if (updatedRowsCount == 0) {
      throw StateError('AnimeHistory with id=${model.id} not found');
    }

    return byId(model.id);
  }
}