import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/data/converters/media_detail_converter.dart';
import 'package:kadro_app/features/detail/data/datasource/anilist_client.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/exceptions/media_detail_exception.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';
import 'package:kadro_app/shared/utils/error_message_extractor.dart';

final class MediaDetailRepositoryImpl implements IMediaDetailRepository {
  final AnilistDataSource _client;
  final MediaDetailConverter _converter;

  MediaDetailRepositoryImpl(
    this._client, {
    MediaDetailConverter converter = const MediaDetailConverter(),
  }) : _converter = converter;

  @override
  Future<MediaDetail?> searchByAnilistId(int id, double similarity) async {
    try {
      final result = await _client.searchByAnilistId(id);
      if (result.isSuccess == false) {
        throw MediaDetailException(
          result.primaryErrorMessage ??
              extractErrorMessage(result.error) ??
              'Не удалось загрузить детали аниме',
        );
      }

      return _converter.fromResponse(result.data!.media, similarity);
    } on ClientErrorException catch (error) {
      throw MediaDetailException(
        extractErrorMessage(error.response?.data) ??
            'Некорректный запрос деталей аниме',
      );
    } on ServerErrorException catch (error) {
      throw MediaDetailException(
        extractErrorMessage(error.response?.data) ??
            'Сервис деталей аниме недоступен',
      );
    } on DioException {
      throw const MediaDetailException(
        'Не удалось загрузить детали аниме из-за сетевой ошибки',
      );
    }
  }
}
