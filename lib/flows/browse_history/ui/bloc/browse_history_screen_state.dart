part of 'browse_history_screen_bloc.dart';

sealed class BrowseHistoryScreenState extends Equatable {
  const BrowseHistoryScreenState();

  @override
  List<Object?> get props => [];
}

final class BrowseHistoryScreenInitial extends BrowseHistoryScreenState {}

final class BrowseHistoryScreenLoading extends BrowseHistoryScreenState {}

final class BrowseHistoryScreenLoaded extends BrowseHistoryScreenState {
  final List<AnimeHistory> history;

  const BrowseHistoryScreenLoaded(this.history);

  @override
  List<Object?> get props => super.props..addAll([history]);
}

final class BrowseHistoryScreenError extends BrowseHistoryScreenState {
  final String error;

  const BrowseHistoryScreenError(this.error);

  @override
  List<Object?> get props => super.props..addAll([error]);
}
