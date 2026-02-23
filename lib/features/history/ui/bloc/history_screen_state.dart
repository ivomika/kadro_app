part of 'history_screen_bloc.dart';

sealed class HistoryScreenState extends Equatable {
  const HistoryScreenState();

  @override
  List<Object?> get props => [];
}

final class HistoryScreenInitial extends HistoryScreenState {}

final class HistoryScreenLoading extends HistoryScreenState{}

final class HistoryScreenLoaded extends HistoryScreenState{
  final List<AnimeHistory> history;

  const HistoryScreenLoaded(this.history);

  @override
  List<Object?> get props => super.props..addAll([history]);
}

final class HistoryScreenError extends HistoryScreenState{
  final String error;

  const HistoryScreenError(this.error);

  @override
  List<Object?> get props => super.props..addAll([error]);
}

