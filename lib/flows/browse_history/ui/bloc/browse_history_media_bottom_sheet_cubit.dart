import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/browse_history/domain/use_cases/load_history_media_detail_use_case.dart';

part 'browse_history_media_bottom_sheet_state.dart';

class BrowseHistoryMediaBottomSheetCubit
    extends Cubit<BrowseHistoryMediaBottomSheetState> {
  final LoadHistoryMediaDetailUseCase _loadHistoryMediaDetailUseCase;

  BrowseHistoryMediaBottomSheetCubit(this._loadHistoryMediaDetailUseCase)
    : super(BrowseHistoryMediaBottomSheetInitial());

  FutureOr<void> load(AnimeHistory anime) async {
    emit(BrowseHistoryMediaBottomSheetLoading());

    try {
      final media = await _loadHistoryMediaDetailUseCase.execute(anime);
      emit(BrowseHistoryMediaBottomSheetLoaded(media));
    } catch (error) {
      emit(BrowseHistoryMediaBottomSheetError(error.toString()));
    }
  }
}
