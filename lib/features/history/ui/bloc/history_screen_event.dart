part of 'history_screen_bloc.dart';

sealed class HistoryScreenEvent extends Equatable {
  const HistoryScreenEvent();
}

final class UpdateHistory extends HistoryScreenEvent{
  final AnimeDetail? match;

  const UpdateHistory(this.match);

  @override
  List<Object?> get props => [match];
}

final class LoadHistory extends HistoryScreenEvent{

  const LoadHistory();

  @override
  List<Object?> get props => [];
}