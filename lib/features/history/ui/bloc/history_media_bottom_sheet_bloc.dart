import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/features/search/domain/converters/anime_detail_presentation_converter.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_detail_repository.dart';
import 'package:kadro_app/shared/domain/entities/media_presentation_data.dart';

part 'history_media_bottom_sheet_event.dart';
part 'history_media_bottom_sheet_state.dart';

class HistoryMediaBottomSheetBloc
    extends Bloc<HistoryMediaBottomSheetEvent, HistoryMediaBottomSheetState> {
  final IAnimeDetailRepository _detailRepository;
  final AnimeDetailPresentationConverter _converter;

  HistoryMediaBottomSheetBloc(
    this._detailRepository, {
    AnimeDetailPresentationConverter converter =
        const AnimeDetailPresentationConverter(),
  }) : _converter = converter,
       super(HistoryMediaBottomSheetInitial()) {
    on<LoadHistoryMediaBottomSheet>(_loadMediaInfo);
  }

  FutureOr<void> _loadMediaInfo(
    LoadHistoryMediaBottomSheet event,
    Emitter<HistoryMediaBottomSheetState> emit,
  ) async {
    emit(HistoryMediaBottomSheetLoading());

    try {
      final detail = await _detailRepository.searchByAnilistId(
        event.anime.anilist,
        event.anime.similarity,
      );

      if (detail == null) {
        emit(
          const HistoryMediaBottomSheetError(
            'Не удалось загрузить данные AniList',
          ),
        );
        return;
      }

      final media = _converter.fromAnimeDetail(detail);
      emit(HistoryMediaBottomSheetLoaded(media));
    } catch (error) {
      emit(HistoryMediaBottomSheetError(error.toString()));
    }
  }
}
