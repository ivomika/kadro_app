part of 'search_screen_bloc.dart';

sealed class SearchScreenEvent extends Equatable {
  const SearchScreenEvent();
}

final class FindAnimeByFileEvent extends SearchScreenEvent {
  final File file;

  const FindAnimeByFileEvent(this.file);

  @override
  List<Object?> get props => [file];
}

final class FindAnimeByUrlEvent extends SearchScreenEvent {
  final String url;

  const FindAnimeByUrlEvent(this.url);

  @override
  List<Object?> get props => [url];
}