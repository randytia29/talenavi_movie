part of 'update_movie_cubit.dart';

sealed class UpdateMovieState extends Equatable {
  const UpdateMovieState();

  @override
  List<Object> get props => [];
}

final class UpdateMovieInitial extends UpdateMovieState {}

final class UpdateMovieLoading extends UpdateMovieState {}

final class UpdateMovieSuccess extends UpdateMovieState {
  final String message;

  const UpdateMovieSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class UpdateMovieFailed extends UpdateMovieState {
  final String message;

  const UpdateMovieFailed({required this.message});

  @override
  List<Object> get props => [message];
}
