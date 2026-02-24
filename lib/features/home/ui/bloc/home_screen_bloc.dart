import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/shared/domain/use_cases/find_best_by_file_use_case.dart';
import 'package:kadro_app/shared/domain/use_cases/find_best_by_url_use_case.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final IAnimeMatchRepository _repository;

  HomeScreenBloc(this._repository) : super(HomeScreenInitial()) {
    on<FindAnimeByFileEvent>(_findAnimeByFile);
    on<FindAnimeByUrlEvent>(_findAnimeByUrl);
  }

  FutureOr<void> _findAnimeByFile(FindAnimeByFileEvent event, Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading());
    try{
      final result = await FindBestByFileUseCase(_repository).execute(event.file);

      if(result == null){
        emit(HomeScreenError('Не удалось найти'));
        return;
      }

      emit(HomeScreenLoaded(result));
    }catch(e){
      emit(HomeScreenError(e.toString()));
    }
  }

  FutureOr<void> _findAnimeByUrl(FindAnimeByUrlEvent event, Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading());
    try{
      final result = await FindBestByUrlUseCase(_repository).execute(event.url);

      if(result == null){
        emit(HomeScreenError('Не удалось найти'));
        return;
      }

      emit(HomeScreenLoaded(result));
    }catch(e){
      emit(HomeScreenError(e.toString()));
    }
  }
}
