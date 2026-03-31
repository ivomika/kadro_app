import 'package:kadro_app/features/search/data/converters/anime_detail_converter.dart';
import 'package:kadro_app/features/search/data/datasource/anilist_client.dart';
import 'package:kadro_app/features/search/domain/entities/anime_detail.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_detail_repository.dart';

final class AnimeDetailRepositoryImpl implements IAnimeDetailRepository {
  final AnilistClient _client;
  final AnimeDetailConverter _converter;

  AnimeDetailRepositoryImpl(
    this._client, {
    AnimeDetailConverter converter = const AnimeDetailConverter(),
  }) : _converter = converter;

  @override
  Future<AnimeDetail?> searchByAnilistId(int id, double similarity) async {
    final result = await _client.searchByAnilistId(id);

    if (result.isSuccess == false) return null;

    return _converter.fromResponse(
        result.data!.data.media,
        similarity
    );
  }
}
