import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/search/domain/repository/i_anime_match_repository.dart';
import 'package:kadro_app/features/search/domain/use_case/find_best_by_file_use_case.dart';
import 'package:kadro_app/features/search/domain/use_case/find_best_by_url_use_case.dart';
import 'package:kadro_app/shared/domain/entities/media_detail.dart';
import 'package:kadro_app/shared/domain/repository/i_media_detail_repository.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  final IAnimeMatchRepository _matchRepository;
  final IMediaDetailRepository _detailRepository;

  SearchScreenBloc(this._matchRepository, this._detailRepository)
    : super(SearchScreenInitial()) {
    on<FindAnimeByFileEvent>(_findAnimeByFile);
    on<FindAnimeByUrlEvent>(_findAnimeByUrl);
  }

  FutureOr<void> _findAnimeByFile(
    FindAnimeByFileEvent event,
    Emitter<SearchScreenState> emit,
  ) async {
    emit(SearchScreenLoading());
    try {
      final result = await FindBestByFileUseCase(
        _matchRepository,
        _detailRepository,
      ).execute(event.file);

      if (result == null) {
        emit(SearchScreenError('Не удалось найти'));
        return;
      }

      emit(SearchScreenLoaded(result));
    } on ClientErrorException catch (e) {
      if (_hasError(e)) {
        emit(SearchScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(SearchScreenError('Клиентская ошибка'));
    } on ServerErrorException catch (e) {
      if (_hasError(e)) {
        emit(SearchScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(SearchScreenError('Ошибка сервера '));
    } catch (e) {
      emit(SearchScreenError(e.toString()));
    }
  }

  FutureOr<void> _findAnimeByUrl(
    FindAnimeByUrlEvent event,
    Emitter<SearchScreenState> emit,
  ) async {
    emit(SearchScreenLoading());
    try {
      final result = await FindBestByUrlUseCase(
        _matchRepository,
        _detailRepository,
      ).execute(event.url);

      if (result == null) {
        emit(SearchScreenError('Не удалось найти'));
        return;
      }

      emit(SearchScreenLoaded(result));
    } on ClientErrorException catch (e) {
      if (_hasError(e)) {
        emit(SearchScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(SearchScreenError('Клиентская ошибка'));
    } on ServerErrorException catch (e) {
      if (_hasError(e)) {
        emit(SearchScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(SearchScreenError('Ошибка сервера '));
    } catch (e) {
      emit(SearchScreenError(e.toString()));
    }
  }

  bool _hasError(DioException exception) {
    if (exception.response == null) return false;
    if (exception.response!.data == null) return false;
    if (exception.response!.data! is! Map) return false;
    if ((exception.response!.data! as Map).containsKey('error') == false) {
      return false;
    }

    return true;
  }
}
