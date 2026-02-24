part of 'home_screen_bloc.dart';

sealed class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

final class FindAnimeByFileEvent extends HomeScreenEvent {
  final File file;

  const FindAnimeByFileEvent(this.file);

  @override
  List<Object?> get props => [file];
}

final class FindAnimeByUrlEvent extends HomeScreenEvent {
  final String url;

  const FindAnimeByUrlEvent(this.url);

  @override
  List<Object?> get props => [url];
}