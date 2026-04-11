import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/history/data/datasource/history_database.dart';
import 'package:kadro_app/features/history/data/repository/history_repository_impl.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/history/ui/bloc/history_media_bottom_sheet_bloc.dart';
import 'package:kadro_app/features/search/data/datasource/trace_moe_client.dart';
import 'package:kadro_app/features/search/data/anime_match_response/anime_match_response.dart';
import 'package:kadro_app/features/search/data/repository/anime_match_repository_impl.dart';
import 'package:kadro_app/features/search/domain/entities/anime_match.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/flows/search/domain/use_case/find_best_by_file_use_case.dart';
import 'package:kadro_app/flows/search/domain/use_case/find_best_by_url_use_case.dart';
import 'package:kadro_app/features/detail/data/datasource/anilist_client.dart';
import 'package:kadro_app/features/detail/data/models/anilist_response.dart';
import 'package:kadro_app/features/detail/data/repository/media_detail_repository_impl.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';

void main() {
  group('MediaDetailRepositoryImpl', () {
    test('returns converted detail when datasource succeeds', () async {
      _logTest(
        'MediaDetailRepositoryImpl',
        'successful datasource response is converted to domain model',
      );
      final repository = MediaDetailRepositoryImpl(
        _FakeAnilistDataSource(
          response: FetchResponse(
            statusCode: 200,
            data: AnilistResponse(
              data: AnilistData(media: _buildAnilistMedia(id: 55)),
            ),
            headers: const {},
          ),
        ),
      );

      final result = await repository.searchByAnilistId(55, 0.87);

      expect(result, isNotNull);
      expect(result!.id, 55);
      expect(result.similarity, 0.87);
      expect(result.title.romaji, 'Romaji 55');
      _logStep('Verified datasource payload was converted into MediaDetail');
    });

    test('returns null when datasource fails', () async {
      _logTest(
        'MediaDetailRepositoryImpl',
        'failed datasource response returns null',
      );
      final repository = MediaDetailRepositoryImpl(
        _FakeAnilistDataSource(
          response: const FetchResponse(
            statusCode: 500,
            data: null,
            headers: {},
            error: {'message': 'server error'},
          ),
        ),
      );

      final result = await repository.searchByAnilistId(55, 0.87);

      expect(result, isNull);
      _logStep('Verified failed datasource response is handled safely');
    });
  });

  group('AnimeMatchRepositoryImpl', () {
    test('maps image search results from datasource', () async {
      _logTest(
        'AnimeMatchRepositoryImpl',
        'image datasource results are mapped to domain matches',
      );
      final repository = AnimeMatchRepositoryImpl(
        _FakeTraceMoeDataSource(
          imageResponse: FetchResponse(
            statusCode: 200,
            data: AnimeMatchResponse(
              frameCount: 100,
              result: const [
                AnimeMatchResult(
                  anilist: 10,
                  similarity: 0.91,
                  filename: 'episode-1.jpg',
                  video: 'video-1',
                  image: 'image-1',
                ),
              ],
            ),
            headers: const {},
          ),
        ),
      );

      final result = await repository.searchByImage(
        File('test/fixtures/test.jpg'),
      );

      expect(result, hasLength(1));
      expect(result.first.anilist, 10);
      expect(result.first.similarity, 0.91);
      _logStep('Verified image search response mapping');
    });

    test('returns empty list when url datasource fails', () async {
      _logTest(
        'AnimeMatchRepositoryImpl',
        'failed url datasource response returns empty list',
      );
      final repository = AnimeMatchRepositoryImpl(
        _FakeTraceMoeDataSource(
          urlResponse: const FetchResponse(
            statusCode: 503,
            data: null,
            headers: {},
            error: {'message': 'temporarily unavailable'},
          ),
        ),
      );

      final result = await repository.searchByUrl(
        'https://example.com/image.jpg',
      );

      expect(result, isEmpty);
      _logStep('Verified repository shields callers from failed datasource');
    });
  });

  group('HistoryRepositoryImpl', () {
    late HistoryDriftDatabase database;
    late HistoryRepositoryImpl repository;

    setUp(() {
      database = HistoryDriftDatabase(NativeDatabase.memory());
      repository = HistoryRepositoryImpl(database);
    });

    tearDown(() async {
      await database.close();
    });

    test(
      'create and all return persisted items in descending insert order',
      () async {
        _logTest(
          'HistoryRepositoryImpl',
          'create persists rows and all returns latest first',
        );
        final first = _buildAnimeHistory(
          id: 'first',
          anilist: 1,
          name: 'First',
        );
        final second = _buildAnimeHistory(
          id: 'second',
          anilist: 2,
          name: 'Second',
        );

        await repository.create(first);
        await repository.create(second);

        final result = await repository.all();

        expect(result, [second, first]);
        _logStep('Verified insert order is reversed by desc id ordering');
      },
    );

    test('byId throws when entity is missing', () async {
      _logTest(
        'HistoryRepositoryImpl',
        'byId throws StateError for missing entity',
      );

      expect(() => repository.byId('missing-id'), throwsA(isA<StateError>()));
      _logStep('Verified missing row lookup fails predictably');
    });

    test(
      'update changes stored row and delete returns removed entity',
      () async {
        _logTest(
          'HistoryRepositoryImpl',
          'update persists changes and delete returns removed entity',
        );
        final original = _buildAnimeHistory(
          id: 'item-1',
          anilist: 10,
          name: 'Old',
        );
        final updated = _buildAnimeHistory(
          id: 'item-1',
          anilist: 10,
          name: 'New',
          description: 'Updated description',
        );

        await repository.create(original);
        final saved = await repository.update(updated);
        final deleted = await repository.delete(saved);

        expect(saved.name, 'New');
        expect(saved.description, 'Updated description');
        expect(deleted, saved);
        expect(await repository.all(), isEmpty);
        _logStep('Verified update and delete behavior on persisted row');
      },
    );

    test('search filters by id and name, blank request returns all', () async {
      _logTest(
        'HistoryRepositoryImpl',
        'search supports id, name and blank request scenarios',
      );
      final target = _buildAnimeHistory(
        id: 'naruto-id',
        anilist: 11,
        name: 'Naruto',
      );
      final other = _buildAnimeHistory(
        id: 'bleach-id',
        anilist: 12,
        name: 'Bleach',
      );

      await repository.create(target);
      await repository.create(other);

      final byName = await repository.search('Nar');
      final byId = await repository.search('bleach-id');
      final all = await repository.search('   ');

      expect(byName, [target]);
      expect(byId, [other]);
      expect(all, [other, target]);
      _logStep('Verified search fallback and filtering behavior');
    });
  });

  group('FindBestByFileUseCase', () {
    test('returns null when file is null', () async {
      _logTest('FindBestByFileUseCase', 'null file returns null');
      final matchRepository = _FakeAnimeMatchRepository();
      final detailRepository = _FakeMediaDetailRepository();

      final result = await FindBestByFileUseCase(
        matchRepository,
        detailRepository,
      ).execute();

      expect(result, isNull);
      expect(matchRepository.searchByImageCalls, 0);
      expect(detailRepository.searchByAnilistIdCalls, 0);
      _logStep('Verified repositories were not called');
    });

    test('returns null when trace.moe returns no matches', () async {
      _logTest('FindBestByFileUseCase', 'empty trace.moe result returns null');
      final matchRepository = _FakeAnimeMatchRepository(imageResults: const []);
      final detailRepository = _FakeMediaDetailRepository();

      final result = await FindBestByFileUseCase(
        matchRepository,
        detailRepository,
      ).execute(File('test/fixtures/test.jpg'));

      expect(result, isNull);
      expect(matchRepository.searchByImageCalls, 1);
      expect(detailRepository.searchByAnilistIdCalls, 0);
      _logStep('Verified file search was called and detail lookup was skipped');
    });

    test('loads detail for the match with highest similarity', () async {
      _logTest('FindBestByFileUseCase', 'highest similarity match is selected');
      final expectedDetail = _buildMediaDetail(id: 2, similarity: 0.93);
      final matchRepository = _FakeAnimeMatchRepository(
        imageResults: const [
          AnimeMatch(
            anilist: 1,
            filename: 'a.jpg',
            similarity: 0.51,
            video: 'video-a',
            image: 'image-a',
          ),
          AnimeMatch(
            anilist: 2,
            filename: 'b.jpg',
            similarity: 0.93,
            video: 'video-b',
            image: 'image-b',
          ),
        ],
      );
      final detailRepository = _FakeMediaDetailRepository(
        detailById: {2: expectedDetail},
      );

      final result = await FindBestByFileUseCase(
        matchRepository,
        detailRepository,
      ).execute(File('test/fixtures/test.jpg'));

      expect(result, expectedDetail);
      expect(detailRepository.lastRequestedId, 2);
      expect(detailRepository.lastRequestedSimilarity, 0.93);
      _logStep('Verified anilistId=2 and similarity=0.93 were requested');
    });
  });

  group('FindBestByUrlUseCase', () {
    test('returns null for blank url', () async {
      _logTest('FindBestByUrlUseCase', 'blank url returns null');
      final matchRepository = _FakeAnimeMatchRepository();
      final detailRepository = _FakeMediaDetailRepository();

      final result = await FindBestByUrlUseCase(
        matchRepository,
        detailRepository,
      ).execute('   ');

      expect(result, isNull);
      expect(matchRepository.searchByUrlCalls, 0);
      expect(detailRepository.searchByAnilistIdCalls, 0);
      _logStep('Verified url search was not triggered');
    });

    test('loads detail for the best url match', () async {
      _logTest('FindBestByUrlUseCase', 'best url match loads detail');
      final expectedDetail = _buildMediaDetail(id: 7, similarity: 0.88);
      final matchRepository = _FakeAnimeMatchRepository(
        urlResults: const [
          AnimeMatch(
            anilist: 4,
            filename: 'a.jpg',
            similarity: 0.45,
            video: 'video-a',
            image: 'image-a',
          ),
          AnimeMatch(
            anilist: 7,
            filename: 'b.jpg',
            similarity: 0.88,
            video: 'video-b',
            image: 'image-b',
          ),
        ],
      );
      final detailRepository = _FakeMediaDetailRepository(
        detailById: {7: expectedDetail},
      );

      final result = await FindBestByUrlUseCase(
        matchRepository,
        detailRepository,
      ).execute('https://example.com/image.jpg');

      expect(result, expectedDetail);
      expect(detailRepository.lastRequestedId, 7);
      expect(detailRepository.lastRequestedSimilarity, 0.88);
      _logStep('Verified best url match resolved to anilistId=7');
    });
  });

  group('MediaDetail', () {
    test('parsedDescription strips html', () {
      _logTest('MediaDetail', 'parsedDescription strips html');
      final detail = _buildMediaDetail(
        id: 42,
        similarity: 0.77,
        description: '<b>Hello</b> world',
      );

      expect(detail.parsedDescription, 'Hello world');
      expect(detail.id, 42);
      expect(detail.similarity, 0.77);
      expect(detail.title.romaji, 'Romaji 42');
      _logStep('Verified html stripping on MediaDetail itself');
    });
  });

  group('HistoryMediaBottomSheetBloc', () {
    test('emits loading then loaded when media detail is found', () async {
      _logTest('HistoryMediaBottomSheetBloc', 'emits loading then loaded');
      final detailRepository = _FakeMediaDetailRepository(
        detailById: {99: _buildMediaDetail(id: 99, similarity: 0.64)},
      );
      final bloc = HistoryMediaBottomSheetBloc(detailRepository);
      final states = <HistoryMediaBottomSheetState>[];
      final subscription = bloc.stream.listen(states.add);

      bloc.add(
        LoadHistoryMediaBottomSheet(
          AnimeHistory.from(
            anilist: 99,
            name: 'Test',
            imageUrl: 'image',
            similarity: 0.64,
            format: 'TV',
            status: 'FINISHED',
            season: 'SPRING',
            seasonYear: 2024,
            episodes: 12,
            description: 'Description',
          ),
        ),
      );

      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      expect(states[0], isA<HistoryMediaBottomSheetLoading>());
      expect(states[1], isA<HistoryMediaBottomSheetLoaded>());
      expect((states[1] as HistoryMediaBottomSheetLoaded).media.id, 99);
      _logStep('Observed state sequence: loading -> loaded');

      await subscription.cancel();
      await bloc.close();
    });

    test('emits loading then error when repository returns null', () async {
      _logTest('HistoryMediaBottomSheetBloc', 'emits loading then error');
      final detailRepository = _FakeMediaDetailRepository();
      final bloc = HistoryMediaBottomSheetBloc(detailRepository);
      final states = <HistoryMediaBottomSheetState>[];
      final subscription = bloc.stream.listen(states.add);

      bloc.add(
        LoadHistoryMediaBottomSheet(
          AnimeHistory.from(
            anilist: 100,
            name: 'Test',
            imageUrl: 'image',
            similarity: 0.5,
            format: 'TV',
            status: 'FINISHED',
            season: 'SPRING',
            seasonYear: 2024,
            episodes: 12,
            description: 'Description',
          ),
        ),
      );

      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      expect(states[0], isA<HistoryMediaBottomSheetLoading>());
      expect(states[1], isA<HistoryMediaBottomSheetError>());
      _logStep('Observed state sequence: loading -> error');

      await subscription.cancel();
      await bloc.close();
    });
  });
}

final class _FakeAnimeMatchRepository implements IAnimeMatchRepository {
  final List<AnimeMatch> imageResults;
  final List<AnimeMatch> urlResults;

  int searchByImageCalls = 0;
  int searchByUrlCalls = 0;

  _FakeAnimeMatchRepository({
    this.imageResults = const [],
    this.urlResults = const [],
  });

  @override
  Future<List<AnimeMatch>> searchByImage(File file) async {
    searchByImageCalls++;
    _logStep(
      'FakeAnimeMatchRepository.searchByImage(${file.path}) -> ${imageResults.length} match(es)',
    );
    return imageResults;
  }

  @override
  Future<List<AnimeMatch>> searchByUrl(String url) async {
    searchByUrlCalls++;
    _logStep(
      'FakeAnimeMatchRepository.searchByUrl($url) -> ${urlResults.length} match(es)',
    );
    return urlResults;
  }
}

final class _FakeMediaDetailRepository implements IMediaDetailRepository {
  final Map<int, MediaDetail> detailById;

  int searchByAnilistIdCalls = 0;
  int? lastRequestedId;
  double? lastRequestedSimilarity;

  _FakeMediaDetailRepository({this.detailById = const {}});

  @override
  Future<MediaDetail?> searchByAnilistId(int id, double similarity) async {
    searchByAnilistIdCalls++;
    lastRequestedId = id;
    lastRequestedSimilarity = similarity;
    _logStep(
      'FakeMediaDetailRepository.searchByAnilistId(id: $id, similarity: $similarity)',
    );
    return detailById[id];
  }
}

final class _FakeAnilistDataSource implements AnilistDataSource {
  final FetchResponse<AnilistResponse> response;

  const _FakeAnilistDataSource({required this.response});

  @override
  Future<FetchResponse<AnilistResponse>> searchByAnilistId(int id) async {
    _logStep('FakeAnilistDataSource.searchByAnilistId($id)');
    return response;
  }
}

final class _FakeTraceMoeDataSource implements TraceMoeDataSource {
  final FetchResponse<AnimeMatchResponse> imageResponse;
  final FetchResponse<AnimeMatchResponse> urlResponse;

  _FakeTraceMoeDataSource({
    FetchResponse<AnimeMatchResponse>? imageResponse,
    FetchResponse<AnimeMatchResponse>? urlResponse,
  }) : imageResponse =
           imageResponse ??
           const FetchResponse(statusCode: 200, data: null, headers: {}),
       urlResponse =
           urlResponse ??
           const FetchResponse(statusCode: 200, data: null, headers: {});

  @override
  Future<FetchResponse<AnimeMatchResponse>> searchByImage(File file) async {
    _logStep('FakeTraceMoeDataSource.searchByImage(${file.path})');
    return imageResponse;
  }

  @override
  Future<FetchResponse<AnimeMatchResponse>> searchBuUrl(String url) async {
    _logStep('FakeTraceMoeDataSource.searchBuUrl($url)');
    return urlResponse;
  }
}

void _logTest(String suite, String description) {
  debugPrint('[TEST] [$suite] $description');
}

void _logStep(String message) {
  debugPrint('  -> $message');
}

MediaDetail _buildMediaDetail({
  required int id,
  required double similarity,
  String description = 'Description',
}) {
  return MediaDetail(
    id: id,
    idMal: 1000 + id,
    type: 'ANIME',
    title: const MediaDetailTitle(
      romaji: 'Romaji',
      english: 'English',
      nativeTitle: 'Native',
    ),
    similarity: similarity,
    description: description,
    format: 'TV',
    status: 'FINISHED',
    episodes: 12,
    duration: 24,
    season: 'SPRING',
    seasonYear: 2024,
    averageScore: 80,
    meanScore: 79,
    popularity: 10000,
    trending: 150,
    favourites: 3000,
    genres: const ['Action', 'Drama'],
    synonyms: const ['Synonym'],
    countryOfOrigin: 'JP',
    source: 'MANGA',
    isLicensed: true,
    coverImage: const MediaDetailCoverImage(
      large: 'large.jpg',
      extraLarge: 'extra_large.jpg',
      color: '#ffffff',
    ),
    bannerImage: 'banner.jpg',
    startDate: const MediaDetailFuzzyDate(year: 2024, month: 4, day: 1),
    endDate: const MediaDetailFuzzyDate(year: 2024, month: 6, day: 30),
    studios: const MediaDetailStudios(
      nodes: [MediaDetailStudioNode(id: 1, name: 'Studio', isMain: true)],
    ),
    tags: const [
      MediaDetailTag(
        name: 'Tag',
        rank: 90,
        isMediaSpoiler: false,
        category: 'Theme',
      ),
    ],
    rankings: const [
      MediaDetailRanking(
        rank: 5,
        type: 'RATED',
        year: 2024,
        season: 'SPRING',
        allTime: true,
        context: 'Top rated',
      ),
    ],
    siteUrl: 'https://anilist.co/anime/$id',
  );
}

AnimeHistory _buildAnimeHistory({
  required String id,
  required int anilist,
  required String name,
  String description = 'Description',
}) {
  return AnimeHistory(
    id: id,
    anilist: anilist,
    name: name,
    imageUrl: 'image-$id.jpg',
    similarity: 0.75,
    format: 'TV',
    status: 'FINISHED',
    season: 'SPRING',
    seasonYear: 2024,
    episodes: 12,
    description: description,
  );
}

AnilistMedia _buildAnilistMedia({required int id}) {
  return AnilistMedia(
    id: id,
    idMal: 1000 + id,
    type: 'ANIME',
    title: AnilistTitle(
      romaji: 'Romaji $id',
      english: 'English $id',
      nativeTitle: 'Native $id',
    ),
    description: '<p>Description $id</p>',
    format: 'TV',
    status: 'FINISHED',
    episodes: 12,
    duration: 24,
    season: 'SPRING',
    seasonYear: 2024,
    averageScore: 80,
    meanScore: 79,
    popularity: 10000,
    trending: 150,
    favourites: 3000,
    countryOfOrigin: 'JP',
    source: 'MANGA',
    isLicensed: true,
    genres: const ['Action', 'Drama'],
    synonyms: const ['Alias'],
    tags: const [
      AnilistTag(
        name: 'Shounen',
        rank: 85,
        isMediaSpoiler: false,
        category: 'Demographic',
      ),
    ],
    rankings: const [
      AnilistRanking(
        rank: 3,
        type: 'RATED',
        year: 2024,
        season: 'SPRING',
        allTime: true,
        context: 'Top rated',
      ),
    ],
    coverImage: const AnilistCoverImage(
      large: 'large.jpg',
      extraLarge: 'extra_large.jpg',
      color: '#ffffff',
    ),
    bannerImage: 'banner.jpg',
    startDate: const AnilistFuzzyDate(year: 2024, month: 4, day: 1),
    endDate: const AnilistFuzzyDate(year: 2024, month: 6, day: 30),
    studios: const AnilistStudios(
      edges: [
        AnilistStudioEdge(
          isMain: true,
          node: AnilistStudioNode(id: 1, name: 'Studio'),
        ),
      ],
    ),
    siteUrl: 'https://anilist.co/anime/$id',
  );
}
