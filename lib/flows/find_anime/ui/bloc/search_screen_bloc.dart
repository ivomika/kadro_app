import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart' show Equatable;
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/exceptions/media_detail_exception.dart';
import 'package:kadro_app/features/search/domain/exceptions/anime_match_search_exception.dart';
import 'package:kadro_app/flows/find_anime/domain/use_cases/find_anime_by_file_flow_use_case.dart';
import 'package:kadro_app/flows/find_anime/domain/use_cases/find_anime_by_url_flow_use_case.dart';
import 'package:kadro_app/flows/find_anime/domain/use_cases/save_anime_detail_to_history_flow_use_case.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  final FindAnimeByFileFlowUseCase _findAnimeByFileFlowUseCase;
  final FindAnimeByUrlFlowUseCase _findAnimeByUrlFlowUseCase;
  final SaveAnimeDetailToHistoryFlowUseCase
  _saveAnimeDetailToHistoryFlowUseCase;

  SearchScreenBloc(
    this._findAnimeByFileFlowUseCase,
    this._findAnimeByUrlFlowUseCase,
    this._saveAnimeDetailToHistoryFlowUseCase,
  ) : super(SearchScreenInitial()) {
    on<FindAnimeByFileEvent>(_findAnimeByFile);
    on<FindAnimeByUrlEvent>(_findAnimeByUrl);
  }

  FutureOr<void> _findAnimeByFile(
    FindAnimeByFileEvent event,
    Emitter<SearchScreenState> emit,
  ) async {
    emit(SearchScreenLoading());

    try {
      final result = await _findAnimeByFileFlowUseCase.execute(event.file);

      if (result == null) {
        emit(const SearchScreenError('Не удалось найти аниме'));
        return;
      }

      await _saveAnimeDetailToHistoryFlowUseCase.execute(result);
      emit(SearchScreenLoaded(result));
    } on AnimeMatchSearchException catch (error) {
      emit(SearchScreenError(error.message));
    } on MediaDetailException catch (error) {
      emit(SearchScreenError(error.message));
    } catch (error) {
      emit(SearchScreenError(error.toString()));
    }
  }

  FutureOr<void> _findAnimeByUrl(
    FindAnimeByUrlEvent event,
    Emitter<SearchScreenState> emit,
  ) async {
    emit(SearchScreenLoading());

    try {
      final result = await _findAnimeByUrlFlowUseCase.execute(event.url);

      if (result == null) {
        emit(const SearchScreenError('Не удалось найти аниме'));
        return;
      }

      await _saveAnimeDetailToHistoryFlowUseCase.execute(result);
      emit(SearchScreenLoaded(result));
    } on AnimeMatchSearchException catch (error) {
      emit(SearchScreenError(error.message));
    } on MediaDetailException catch (error) {
      emit(SearchScreenError(error.message));
    } catch (error) {
      emit(SearchScreenError(error.toString()));
    }
  }
}
