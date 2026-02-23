import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/shared/domain/use_cases/find_best_match_use_case.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final IAnimeMatchRepository _repository;

  HomeScreenBloc(this._repository) : super(HomeScreenInitial()) {
    on<FindAnimeEvent>(_findAnime);
  }

  FutureOr<void> _findAnime(FindAnimeEvent event, Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading());
    try{
      final result = await FindBestMatchUseCase(_repository).execute(event.file);

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
