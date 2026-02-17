import 'package:flutter_core/database/repository/base_repository.dart';

mixin ByIdsRepository<Entity, IdType> on BaseRepository<Entity, IdType> {
  Future<List<Entity>> byIds(List<IdType> ids);
}