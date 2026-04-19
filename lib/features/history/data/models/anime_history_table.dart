import 'package:drift/drift.dart';

class AnimeHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  IntColumn get anilist => integer()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text()();
  RealColumn get similarity => real()();
  TextColumn get format => text()();
  TextColumn get status => text()();
  TextColumn get season => text()();
  IntColumn get seasonYear => integer()();
  IntColumn get episodes => integer()();
  TextColumn get description => text()();
}
