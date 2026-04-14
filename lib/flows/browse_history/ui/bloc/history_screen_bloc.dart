import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/history/domain/entities/anime_history.dart';
import 'package:kadro_app/flows/browse_history/domain/use_cases/watch_history_use_case.dart';

part 'history_screen_event.dart';
part 'history_screen_state.dart';

class HistoryScreenBloc extends Bloc<HistoryScreenEvent, HistoryScreenState> {
  final WatchHistoryUseCase _watchHistoryUseCase;
  StreamSubscription<List<AnimeHistory>>? _historySubscription;

  HistoryScreenBloc(this._watchHistoryUseCase) : super(HistoryScreenLoading()) {
    on<_HistoryUpdated>(_onHistoryUpdated);
    on<_HistoryUpdateFailed>(_onHistoryUpdateFailed);

    _historySubscription = _watchHistoryUseCase.execute().listen(
      (history) => add(_HistoryUpdated(history)),
      onError: (error, stackTrace) =>
          add(_HistoryUpdateFailed(error.toString())),
    );
  }

  FutureOr<void> _onHistoryUpdated(
    _HistoryUpdated event,
    Emitter<HistoryScreenState> emit,
  ) {
    emit(HistoryScreenLoaded(event.history));
  }

  FutureOr<void> _onHistoryUpdateFailed(
    _HistoryUpdateFailed event,
    Emitter<HistoryScreenState> emit,
  ) {
    emit(HistoryScreenError(event.error));
  }

  @override
  Future<void> close() async {
    await _historySubscription?.cancel();
    return super.close();
  }
}
