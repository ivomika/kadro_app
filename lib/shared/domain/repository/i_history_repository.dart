import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_history.dart';

abstract interface class IHistoryRepository implements BaseRepository<AnimeHistory, String>, SearchRepository<AnimeHistory, String, String> {
  @override
  Future<List<AnimeHistory>> search(String request);

  @override
  Future<List<AnimeHistory>> all();

  @override
  Future<AnimeHistory> byId(String id);

  @override
  Future<AnimeHistory> create(AnimeHistory model);

  @override
  Future<AnimeHistory> delete(AnimeHistory model);

  @override
  Future<AnimeHistory> update(AnimeHistory model);
}