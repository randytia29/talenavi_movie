part of 'movie_cubit.dart';

class MovieState extends Equatable {
  const MovieState({required this.movies});

  final List<MovieModel> movies;

  factory MovieState.initial() => const MovieState(movies: <MovieModel>[]);

  MovieState movieCopyWith({required List<MovieModel> movies}) =>
      MovieState(movies: movies);

  @override
  List<Object> get props => [movies];
}
