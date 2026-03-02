part of 'search_screen_bloc.dart';

sealed class SearchScreenState extends Equatable {
  const SearchScreenState();
  
  @override
  List<Object?> get props => [];
}

final class SearchScreenInitial extends SearchScreenState {}

final class SearchScreenLoading extends SearchScreenState{}

final class SearchScreenLoaded extends SearchScreenState{
  final AnimeDetail match;

  const SearchScreenLoaded(this.match);
  
  @override
  List<Object?> get props => super.props..addAll([match]);
}

final class SearchScreenError extends SearchScreenState{
  final String error;

  const SearchScreenError(this.error);
  
  @override
  List<Object?> get props => super.props..addAll([error]);
}
