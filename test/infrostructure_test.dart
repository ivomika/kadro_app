import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro_app/shared/data/repository/anime_match_repository_impl.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/shared/domain/use_cases/find_best_match.dart';

void main() {
  final talker = Talker();
  final IAnimeMatchRepository repository = AnimeMatchRepositoryImpl();

  test('Search by file test', () async {
    try {
      final file = File('test/fixtures/test.jpg');

      final response = await FindBestMatch(repository).execute(file);

      expect(response, isNotNull);

      talker.log(response);
    } on UnauthorizedException catch (e){
      talker.debug(e.response?.data);
    }
  });
}
