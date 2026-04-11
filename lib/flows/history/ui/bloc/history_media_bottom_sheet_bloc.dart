import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';

part 'history_media_bottom_sheet_event.dart';
part 'history_media_bottom_sheet_state.dart';

class HistoryMediaBottomSheetBloc
    extends Bloc<HistoryMediaBottomSheetEvent, HistoryMediaBottomSheetState> {
  final IMediaDetailRepository _repository;

  HistoryMediaBottomSheetBloc(this._repository)
    : super(HistoryMediaBottomSheetInitial()) {
    on<LoadHistoryMediaBottomSheet>(_loadMediaInfo);
  }

  FutureOr<void> _loadMediaInfo(
    LoadHistoryMediaBottomSheet event,
    Emitter<HistoryMediaBottomSheetState> emit,
  ) async {
    emit(HistoryMediaBottomSheetLoading());

    try {
      final media = await _repository.searchByAnilistId(
        event.anime.anilist,
        event.anime.similarity,
      );

      if (media == null) {
        emit(
          const HistoryMediaBottomSheetError(
            'Не удалось загрузить данные AniList',
          ),
        );
        return;
      }

      emit(HistoryMediaBottomSheetLoaded(media));
    } catch (error) {
      emit(HistoryMediaBottomSheetError(error.toString()));
    }
  }
}
