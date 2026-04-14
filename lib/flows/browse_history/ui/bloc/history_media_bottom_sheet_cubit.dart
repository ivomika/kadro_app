import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/browse_history/domain/use_cases/load_history_media_detail_use_case.dart';

part 'history_media_bottom_sheet_state.dart';

class HistoryMediaBottomSheetCubit extends Cubit<HistoryMediaBottomSheetState> {
  final LoadHistoryMediaDetailUseCase _loadHistoryMediaDetailUseCase;

  HistoryMediaBottomSheetCubit(this._loadHistoryMediaDetailUseCase)
    : super(HistoryMediaBottomSheetInitial());

  FutureOr<void> load(AnimeHistory anime) async {
    emit(HistoryMediaBottomSheetLoading());

    try {
      final media = await _loadHistoryMediaDetailUseCase.execute(anime);
      emit(HistoryMediaBottomSheetLoaded(media));
    } catch (error) {
      emit(HistoryMediaBottomSheetError(error.toString()));
    }
  }
}
