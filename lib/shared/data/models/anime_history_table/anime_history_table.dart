import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class AnimeHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().clientDefault(() => const Uuid().v4()).unique()();
  IntColumn get anilist => integer()();
  TextColumn get filename => text()();
  IntColumn get episode => integer().nullable()();
  TextColumn get video => text()();
  TextColumn get image => text()();
}