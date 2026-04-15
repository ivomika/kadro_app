import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
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
        emit(SearchScreenError('РќРµ СѓРґР°Р»РѕСЃСЊ РЅР°Р№С‚Рё'));
        return;
      }

      await _saveAnimeDetailToHistoryFlowUseCase.execute(result);
      emit(SearchScreenLoaded(result));
    } on ClientErrorException catch (e) {
      if (_hasError(e)) {
        emit(SearchScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(SearchScreenError('РљР»РёРµРЅС‚СЃРєР°СЏ РѕС€РёР±РєР°'));
    } on ServerErrorException catch (e) {
      if (_hasError(e)) {
        emit(SearchScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(SearchScreenError('РћС€РёР±РєР° СЃРµСЂРІРµСЂР°'));
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
      final result = await _findAnimeByUrlFlowUseCase.execute(event.url);

      if (result == null) {
        emit(SearchScreenError('РќРµ СѓРґР°Р»РѕСЃСЊ РЅР°Р№С‚Рё'));
        return;
      }

      await _saveAnimeDetailToHistoryFlowUseCase.execute(result);
      emit(SearchScreenLoaded(result));
    } on ClientErrorException catch (e) {
      if (_hasError(e)) {
        emit(SearchScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(SearchScreenError('РљР»РёРµРЅС‚СЃРєР°СЏ РѕС€РёР±РєР°'));
    } on ServerErrorException catch (e) {
      if (_hasError(e)) {
        emit(SearchScreenError((e.response!.data as Map)['error']));
        return;
      }
      emit(SearchScreenError('РћС€РёР±РєР° СЃРµСЂРІРµСЂР°'));
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
