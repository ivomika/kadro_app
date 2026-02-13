import 'dart:io';

import 'package:flutter_core/api/client/base_api_client.dart';
import 'package:flutter_core/api/exception/unauthorized_exception.dart';
import 'package:flutter_core/api/methods/request_method.dart';
import 'package:flutter_core/api/types/response_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talker/talker.dart';

class _EmptyData extends ResponseMapper{
  @override
  void fromJson(Map<String, dynamic> json) {}
}

class _IpResponse extends ResponseMapper{
  String? origin;

  _IpResponse();

  @override
  void fromJson(Map<String, dynamic> json) {
    origin = json['origin'];
  }
}

void main() {
  const String baseUrl = 'https://httpbin.org';
  final client = BaseApiClient(baseUrl);
  final talker = Talker();


  test('Test Get', () async {
    final response = await client.fetch(RequestMethod.get, '/get', creator: () => _EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 200);
  });
  test('Test Post', () async {
    final response = await client.fetch(RequestMethod.post, '/post', creator: () => _EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 200);
  });
  test('Test Put', () async {
    final response = await client.fetch(RequestMethod.put, '/put', creator: () => _EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 200);
  });
  test('Test Delete', () async {
    final response = await client.fetch(RequestMethod.delete, '/delete', creator: () => _EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 200);
  });
  test('Test response mapping', () async {
    final response = await client.fetch(RequestMethod.get, '/ip', creator: () => _IpResponse());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    talker.debug(response.data?.origin);
    expect(response.statusCode, 200);
    expect(response.data, isNotNull);
    expect(response.data?.origin, isNotNull);
    expect(response.data, isA<_IpResponse>());
    expect(response.data?.origin, isA<String>());
  });
  test('Test 200 response', () async {
    final response = await client.fetch(RequestMethod.get, '/status/200', creator: () => _EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);

    expect(response.statusCode, 200);
  });
  test('Test 401 response', () async {
    try {
      final response = await client.fetch(RequestMethod.get, '/status/401', creator: () => _EmptyData());
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
    final response = await client.fetch(RequestMethod.get, '/status/400', creator: () => _EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 400);
  });
  test('Test 500 response', () async {
    final response = await client.fetch(RequestMethod.get, '/status/500', creator: () => _EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 500);
  });
  test('Test 500 response retry', () async {
    final response = await client.fetch(RequestMethod.get, '/status/500', creator: () => _EmptyData());
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
    expect(response.statusCode, 500);
  });
  test('read fixture file', () async {
    final file = File('test/fixtures/test.jpg');
    expect(await file.exists(), isTrue);
    expect(file.uri.pathSegments.last, 'test.jpg');
  });
  test('Test upload', () async {

    final client = BaseApiClient('https://api.trace.moe');
    final file = File('test/fixtures/test.jpg');

    final response = await client.upload(
        file,
        '/search',
        creator: () => _EmptyData()
    );
    talker.debug(response.isSuccess);
    talker.debug(response.statusCode);
  });
}
