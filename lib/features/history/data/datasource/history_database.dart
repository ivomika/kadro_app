import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:kadro_app/features/history/data/models/anime_history_table.dart';
import 'package:path_provider/path_provider.dart';

part 'history_database.g.dart';

@DriftDatabase(tables: [AnimeHistoryTable])
final class HistoryDriftDatabase extends _$HistoryDriftDatabase {
  static const String _name = 'history_db';

  HistoryDriftDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: _name,
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
