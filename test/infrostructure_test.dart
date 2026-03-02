import 'dart:io';

import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kadro_app/features/search/data/datasource/anilist_client.dart';
import 'package:kadro_app/features/search/data/datasource/trace_moe_client.dart';
import 'package:kadro_app/features/search/data/repository/anime_detail_repository_impl.dart';
import 'package:kadro_app/features/search/data/repository/anime_match_repository_impl.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_detail_repository.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/features/search/domain/use_case/find_best_by_file_use_case.dart';

void main() {
  final talker = Talker();
  final client = TraceMoeClient();
  final anilistClient = AnilistClient();
  final IAnimeMatchRepository repository = AnimeMatchRepositoryImpl(client);
  final IAnimeDetailRepository detailRepository = AnimeDetailRepositoryImpl(anilistClient);

  test('Search by file test', () async {
    try {
      final file = File('test/fixtures/test.jpg');

      final response = await FindBestByFileUseCase(repository, detailRepository).execute(file);

      expect(response, isNotNull);

      talker.log(response);
    } on UnauthorizedException catch (e){
      talker.debug(e.response?.data);
    }
  });
}
