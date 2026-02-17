import 'dart:io';

import 'package:flutter_core/api/client/base_api_client.dart';
import 'package:flutter_core/api/exception/unauthorized_exception.dart';
import 'package:flutter_core/api/methods/request_method.dart';
import 'package:flutter_core/api/types/fetch_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talker/talker.dart';

import 'data/entity/trace_moe_entity.dart';

void main() {
  const String baseUrl = 'https://api.trace.moe';
  final client = BaseApiClient(baseUrl);

  test('Search by url test', () async {
    final talker = Talker();
    FetchResponse<TraceMoeEntity>? response;

    try {
      response = await client.fetch(
          RequestMethod.get,
          '/search',
          queryParams: {
            'url': 'https://images.stopgame.ru/articles/2021/02/18/re_zero_starting_life_in_another_world_the_prophecy_of_the_throne_review_igry-1613660322.jpg'
          },
          factory: TraceMoeEntity.fromJson
      );
    } on UnauthorizedException catch (e){
      talker.debug(e.response?.data);
    }

    talker.log(response?.data);

    expect(response?.statusCode, 200);
  });

  test('Search by file test', () async {
    final talker = Talker();
    FetchResponse<TraceMoeEntity>? response;
    try {
      final file = File('test/fixtures/test.jpg');

      response = await client.upload(
          file,
          '/search',
          factory: TraceMoeEntity.fromJson
      );
    } on UnauthorizedException catch (e){
      talker.debug(e.response?.data);
    }

    talker.log(response?.data);

    expect(response?.statusCode, 200);
  });

  test('Find best match test', () async {
    final talker = Talker();
    FetchResponse<TraceMoeEntity>? response;
    try {
      final file = File('test/fixtures/test.jpg');

      response = await client.upload(
          file,
          '/search',
          factory: TraceMoeEntity.fromJson
      );
    } on UnauthorizedException catch (e){
      talker.debug(e.response?.data);
    }

    expect(response?.statusCode, 200);
    expect(response?.data, isNotNull);

    final bestMatch = response?.data?.bestMatch;
    talker.debug(bestMatch);

    expect(bestMatch, isNotNull);
    expect(bestMatch!.similarity, greaterThanOrEqualTo(0.95));
  });
}
