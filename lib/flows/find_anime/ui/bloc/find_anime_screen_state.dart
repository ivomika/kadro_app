part of 'find_anime_screen_bloc.dart';

sealed class FindAnimeScreenState extends Equatable {
  const FindAnimeScreenState();

  @override
  List<Object?> get props => [];
}

final class FindAnimeScreenInitial extends FindAnimeScreenState {}

final class FindAnimeScreenLoading extends FindAnimeScreenState {}

final class FindAnimeScreenLoaded extends FindAnimeScreenState {
  final MediaDetail match;

  const FindAnimeScreenLoaded(this.match);

  @override
  List<Object?> get props => super.props..addAll([match]);
}

final class FindAnimeScreenError extends FindAnimeScreenState {
  final String error;

  const FindAnimeScreenError(this.error);

  @override
  List<Object?> get props => super.props..addAll([error]);
}
