import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_history.dart';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';
import 'package:kadro_app/shared/domain/repository/i_history_repository.dart';
import 'package:kadro_app/shared/domain/use_cases/load_history_use_case.dart';
import 'package:kadro_app/shared/domain/use_cases/update_history_use_case.dart';

part 'history_screen_event.dart';
part 'history_screen_state.dart';

class HistoryScreenBloc extends Bloc<HistoryScreenEvent, HistoryScreenState> {
  final IHistoryRepository _repository;

  HistoryScreenBloc(this._repository) : super(HistoryScreenInitial()) {
    on<LoadHistory>(_loadHistory);
    on<UpdateHistory>(_updateHistory);
  }


  FutureOr<void> _loadHistory(LoadHistory event, Emitter<HistoryScreenState> emit) async {
    emit(HistoryScreenLoading());
    try{
      final result = await LoadHistoryUseCase(_repository).execute();
      emit(HistoryScreenLoaded(result));
    }catch(e){
      emit(HistoryScreenError(e.toString()));
    }
  }

  Future<void> _updateHistory(UpdateHistory event, Emitter<HistoryScreenState> emit) async {
    emit(HistoryScreenLoading());
    try{
      if(event.match == null){
        emit(HistoryScreenError('Аниме не найдено'));
        return;
      }

      final result = await UpdateHistoryUseCase(_repository).execute(event.match);

      emit(HistoryScreenLoaded(result));
    }catch(e){
      emit(HistoryScreenError(e.toString()));
    }
  }
}
