part of 'find_anime_screen_bloc.dart';

sealed class FindAnimeScreenEvent extends Equatable {
  const FindAnimeScreenEvent();
}

final class FindAnimeByFileEvent extends FindAnimeScreenEvent {
  final File file;

  const FindAnimeByFileEvent(this.file);

  @override
  List<Object?> get props => [file];
}

final class FindAnimeByUrlEvent extends FindAnimeScreenEvent {
  final String url;

  const FindAnimeByUrlEvent(this.url);

  @override
  List<Object?> get props => [url];
}
