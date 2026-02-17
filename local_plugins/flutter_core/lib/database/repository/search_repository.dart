import 'package:flutter_core/database/repository/base_repository.dart';

mixin SearchRepository<Entity, IdType, Request> on BaseRepository<Entity, IdType> {
  Future<List<Entity>> search(Request request);
}