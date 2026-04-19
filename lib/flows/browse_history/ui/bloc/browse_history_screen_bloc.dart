import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/browse_history/domain/use_cases/watch_history_use_case.dart';

part 'browse_history_screen_event.dart';
part 'browse_history_screen_state.dart';

class BrowseHistoryScreenBloc
    extends Bloc<BrowseHistoryScreenEvent, BrowseHistoryScreenState> {
  final WatchHistoryUseCase _watchHistoryUseCase;
  StreamSubscription<List<AnimeHistory>>? _historySubscription;

  BrowseHistoryScreenBloc(this._watchHistoryUseCase)
    : super(BrowseHistoryScreenLoading()) {
    on<_BrowseHistoryUpdated>(_onHistoryUpdated);
    on<_BrowseHistoryUpdateFailed>(_onHistoryUpdateFailed);

    _historySubscription = _watchHistoryUseCase.execute().listen(
      (history) => add(_BrowseHistoryUpdated(history)),
      onError: (error, stackTrace) =>
          add(_BrowseHistoryUpdateFailed(error.toString())),
    );
  }

  FutureOr<void> _onHistoryUpdated(
    _BrowseHistoryUpdated event,
    Emitter<BrowseHistoryScreenState> emit,
  ) {
    emit(BrowseHistoryScreenLoaded(event.history));
  }

  FutureOr<void> _onHistoryUpdateFailed(
    _BrowseHistoryUpdateFailed event,
    Emitter<BrowseHistoryScreenState> emit,
  ) {
    emit(BrowseHistoryScreenError(event.error));
  }

  @override
  Future<void> close() async {
    await _historySubscription?.cancel();
    return super.close();
  }
}
