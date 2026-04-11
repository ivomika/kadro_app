import 'package:kadro_app/features/detail/data/converters/media_detail_converter.dart';
import 'package:kadro_app/features/detail/data/datasource/anilist_client.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';

final class MediaDetailRepositoryImpl implements IMediaDetailRepository {
  final AnilistDataSource _client;
  final MediaDetailConverter _converter;

  MediaDetailRepositoryImpl(
    this._client, {
    MediaDetailConverter converter = const MediaDetailConverter(),
  }) : _converter = converter;

  @override
  Future<MediaDetail?> searchByAnilistId(int id, double similarity) async {
    final result = await _client.searchByAnilistId(id);
    if (result.isSuccess == false) {
      return null;
    }

    return _converter.fromResponse(result.data!.data.media, similarity);
  }
}
