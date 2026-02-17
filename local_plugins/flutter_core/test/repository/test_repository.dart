import 'package:flutter_core/flutter_core.dart';

import '../data/entity/empty_data.dart';

class TestRepository extends BaseRepository<EmptyData, String> with ByIdsRepository, SearchRepository<EmptyData, String, Object>{
  final _talker = Talker();
  @override
  Future<List<EmptyData>> all() async {
    _talker.debug('all');
    return List.generate(5, (index) => EmptyData());
  }

  @override
  Future<EmptyData> byId(String id) async {
    _talker.debug('byId');
    return EmptyData();
  }

  @override
  Future<EmptyData> create(EmptyData model) async {
    _talker.debug('create');
    return EmptyData();
  }

  @override
  Future<EmptyData> delete(EmptyData model) async {
    _talker.debug('delete');
    return EmptyData();
  }

  @override
  Future<EmptyData> update(EmptyData model) async {
    _talker.debug('update');
    return EmptyData();
  }

  @override
  Future<List<EmptyData>> byIds(List<String> ids) async {
    _talker.debug('byIds');
    return List.generate(5, (index) => EmptyData());
  }

  @override
  Future<List<EmptyData>> search(Object request) async {
    _talker.debug('search');
    return List.generate(5, (index) => EmptyData());
  }
}