import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/history/domain/repository/i_history_repository.dart';
import 'package:kadro_app/flows/find_anime/domain/converters/media_detail_to_anime_history_converter.dart';

final class SaveAnimeDetailToHistoryFlowUseCase
    implements IUseCase<MediaDetail, Future<void>> {
  final IHistoryRepository _repository;
  final MediaDetailToAnimeHistoryConverter _converter;

  SaveAnimeDetailToHistoryFlowUseCase(
    this._repository, {
    MediaDetailToAnimeHistoryConverter converter =
        const MediaDetailToAnimeHistoryConverter(),
  }) : _converter = converter;

  @override
  Future<void> execute([MediaDetail? media]) async {
    if (media == null) {
      throw NotNullableError<MediaDetail>('media');
    }

    await _repository.create(_converter.convert(media));
  }
}
