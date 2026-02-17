import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:talker/talker.dart';

import 'data/entity/empty_data.dart';
import 'data/entity/ip_response.dart';

void main() {
  const String baseUrl = 'https://httpbin.org';
  final client = BaseApiClient(baseUrl);
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
}
