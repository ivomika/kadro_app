part of 'home_screen_bloc.dart';

sealed class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

final class FindAnimeEvent extends HomeScreenEvent {
  final File file;

  const FindAnimeEvent(this.file);

  @override
  List<Object?> get props => [file];
}