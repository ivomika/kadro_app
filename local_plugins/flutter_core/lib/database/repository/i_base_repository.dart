abstract interface class IBaseRepository<Entity, IdType> {
  Future<List<Entity>> all();
  Future<Entity> byId(IdType id);
  Future<Entity> create(Entity model);
  Future<Entity> update(Entity model);
  Future<Entity> delete(Entity model);
}