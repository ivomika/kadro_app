import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro_app/shared/data/datasource/trace_moe_client.dart';
import 'package:kadro_app/shared/data/repository/anime_match_repository_impl.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/shared/domain/use_cases/find_best_by_file_use_case.dart';

void main() {
  final talker = Talker();
  final client = TraceMoeClient();
  final IAnimeMatchRepository repository = AnimeMatchRepositoryImpl(client);

  test('Search by file test', () async {
    try {
      final file = File('test/fixtures/test.jpg');

      final response = await FindBestByFileUseCase(repository).execute(file);

      expect(response, isNotNull);

      talker.log(response);
    } on UnauthorizedException catch (e){
      talker.debug(e.response?.data);
    }
  });
}
