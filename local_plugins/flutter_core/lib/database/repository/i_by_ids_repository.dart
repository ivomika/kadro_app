import 'package:flutter_core/database/repository/i_base_repository.dart';

mixin IByIdsRepository<Entity, IdType> on IBaseRepository<Entity, IdType> {
  Future<List<Entity>> byIds(List<IdType> ids);
}