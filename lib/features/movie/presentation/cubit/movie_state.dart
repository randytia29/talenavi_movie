part of 'movie_cubit.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieLoaded extends MovieState {
  final List<MovieModel> movies;

  const MovieLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

final class MovieFailed extends MovieState {
  final String message;

  const MovieFailed({required this.message});

  @override
  List<Object> get props => [message];
}
