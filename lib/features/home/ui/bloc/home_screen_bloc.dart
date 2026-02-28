import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/shared/domain/entities/anime_detail.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_detail_repository.dart';
import 'package:kadro_app/shared/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/shared/domain/use_cases/find_best_by_file_use_case.dart';
import 'package:kadro_app/shared/domain/use_cases/find_best_by_url_use_case.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final IAnimeMatchRepository _matchRepository;
  final IAnimeDetailRepository _detailRepository;

  HomeScreenBloc(this._matchRepository, this._detailRepository) : super(HomeScreenInitial()) {
    on<FindAnimeByFileEvent>(_findAnimeByFile);
    on<FindAnimeByUrlEvent>(_findAnimeByUrl);
  }

  FutureOr<void> _findAnimeByFile(FindAnimeByFileEvent event, Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading());
    try{
      final result = await FindBestByFileUseCase(_matchRepository, _detailRepository).execute(event.file);

      if(result == null){
        emit(HomeScreenError('Не удалось найти'));
        return;
      }

      emit(HomeScreenLoaded(result));
    } on ClientErrorException catch (e){
      if(_hasError(e)){
        emit(HomeScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(HomeScreenError('Клиентская ошибка'));
    } on ServerErrorException catch (e){
      if(_hasError(e)){
        emit(HomeScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(HomeScreenError('Ошибка сервера '));
    } catch(e){
      emit(HomeScreenError(e.toString()));
    }
  }

  FutureOr<void> _findAnimeByUrl(FindAnimeByUrlEvent event, Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading());
    try{
      final result = await FindBestByUrlUseCase(_matchRepository, _detailRepository).execute(event.url);

      if(result == null){
        emit(HomeScreenError('Не удалось найти'));
        return;
      }

      emit(HomeScreenLoaded(result));
    }on ClientErrorException catch (e){
      if(_hasError(e)){
        emit(HomeScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(HomeScreenError('Клиентская ошибка'));
    } on ServerErrorException catch (e){
      if(_hasError(e)){
        emit(HomeScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(HomeScreenError('Ошибка сервера '));
    } catch(e){
      emit(HomeScreenError(e.toString()));
    }
  }

  bool _hasError(DioException exception){
    if(exception.response == null) return false;
    if(exception.response!.data == null) return false;
    if(exception.response!.data! is! Map) return false;
    if((exception.response!.data! as Map).containsKey('error') == false) return false;

    return true;
  }
}
