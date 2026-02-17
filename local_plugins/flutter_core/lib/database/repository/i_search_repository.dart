import 'package:flutter_core/database/repository/i_base_repository.dart';

mixin ISearchRepository<Entity, IdType, Request> on IBaseRepository<Entity, IdType> {
  Future<List<Entity>> search(Request request);
}