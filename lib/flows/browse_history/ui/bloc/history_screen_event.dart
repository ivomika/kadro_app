part of 'history_screen_bloc.dart';

sealed class HistoryScreenEvent extends Equatable {
  const HistoryScreenEvent();

  @override
  List<Object?> get props => [];
}

final class _HistoryUpdated extends HistoryScreenEvent {
  final List<AnimeHistory> history;

  const _HistoryUpdated(this.history);

  @override
  List<Object?> get props => [history];
}

final class _HistoryUpdateFailed extends HistoryScreenEvent {
  final String error;

  const _HistoryUpdateFailed(this.error);

  @override
  List<Object?> get props => [error];
}
