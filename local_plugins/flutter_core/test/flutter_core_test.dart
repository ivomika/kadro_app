import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_core/flutter_core.dart';

import 'data/entity/empty_data.dart';
import 'data/entity/ip_response.dart';
import 'repository/test_repository.dart';

void main() {
  const String baseUrl = 'https://httpbin.org';
  final client = BaseApiClient(baseUrl);
  final repository = TestRepository();
  final talker = Talker();


  test('Test Get', () async {
    final response = await client.fetch(RequestMethod.get, '/get', factory: (json) => EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 200);
  });
  test('Test Post', () async {
    final response = await client.fetch(RequestMethod.post, '/post', factory: (json) => EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 200);
  });
  test('Test Put', () async {
    final response = await client.fetch(RequestMethod.put, '/put', factory: (json) => EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 200);
  });
  test('Test Delete', () async {
    final response = await client.fetch(RequestMethod.delete, '/delete', factory: (json) => EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 200);
  });
  test('Test response mapping', () async {
    final response = await client.fetch(RequestMethod.get, '/ip', factory: IpResponse.fromJson);
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    talker.debug(response.data?.origin);
    expect(response.statusCode, 200);
    expect(response.data, isNotNull);
    expect(response.data, isA<IpResponse>());
    expect(response.data?.origin, isNotNull);
    expect(response.data?.origin, isA<String>());
  });
  test('Test 200 response', () async {
    final response = await client.fetch(RequestMethod.get, '/status/200', factory: (json) => EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);

    expect(response.statusCode, 200);
  });
  test('Test 401 response', () async {
    try {
      final response = await client.fetch(RequestMethod.get, '/status/401', factory: (json) => EmptyData());
      talker.debug(response.isSuccess);
      talker.debug(response.statusCode);
      expect(response.statusCode, 200);
    }on UnauthorizedException catch(e){
      talker.debug(UnauthorizedException);
      expect(e, isA<UnauthorizedException>());
    }catch(e){
      talker.debug('Random error');
    }
  });
  test('Test 400 response', () async {
    final response = await client.fetch(RequestMethod.get, '/status/400', factory: (json) => EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 400);
  });
  test('Test 500 response', () async {
    final response = await client.fetch(RequestMethod.get, '/status/500', factory: (json) => EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.data, null);
    expect(response.statusCode, 500);
  });
  test('Test 500 response retry', () async {
    final response = await client.fetch(RequestMethod.get, '/status/500', factory: (json) => EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.data, null);
    expect(response.statusCode, 500);
  });
  test('Test get all', () async {
    final result = await repository.all();

    expect(result.length, 5);
  });
  test('Test get by id', () async {
    final result = await repository.byId('id');

    expect(result, isA<EmptyData>());
  });
  test('Test create', () async {
    final result = await repository.create(EmptyData());

    expect(result, isA<EmptyData>());
  });
  test('Test update', () async {
    final result = await repository.update(EmptyData());

    expect(result, isA<EmptyData>());
  });
  test('Test delete', () async {
    final result = await repository.delete(EmptyData());

    expect(result, isA<EmptyData>());
  });
  test('Test by ids', () async {
    final result = await repository.byIds(['id', 'id-2', 'id-3']);

    expect(result.length, 5);
  });
  test('Test search', () async {
    final result = await repository.search('query');

    expect(result.length, 5);
  });
}
