part of 'browse_history_screen_bloc.dart';

sealed class BrowseHistoryScreenEvent extends Equatable {
  const BrowseHistoryScreenEvent();

  @override
  List<Object?> get props => [];
}

final class _BrowseHistoryUpdated extends BrowseHistoryScreenEvent {
  final List<AnimeHistory> history;

  const _BrowseHistoryUpdated(this.history);

  @override
  List<Object?> get props => [history];
}

final class _BrowseHistoryUpdateFailed extends BrowseHistoryScreenEvent {
  final String error;

  const _BrowseHistoryUpdateFailed(this.error);

  @override
  List<Object?> get props => [error];
}
