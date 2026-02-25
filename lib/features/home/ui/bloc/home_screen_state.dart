part of 'home_screen_bloc.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();
  
  @override
  List<Object?> get props => [];
}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState{}

final class HomeScreenLoaded extends HomeScreenState{
  final AnimeDetail match;

  const HomeScreenLoaded(this.match);
  
  @override
  List<Object?> get props => super.props..addAll([match]);
}

final class HomeScreenError extends HomeScreenState{
  final String error;

  const HomeScreenError(this.error);
  
  @override
  List<Object?> get props => super.props..addAll([error]);
}
