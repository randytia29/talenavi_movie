part of 'delete_movie_cubit.dart';

sealed class DeleteMovieState extends Equatable {
  const DeleteMovieState();

  @override
  List<Object> get props => [];
}

final class DeleteMovieInitial extends DeleteMovieState {}

final class DeleteMovieLoading extends DeleteMovieState {}

final class DeleteMovieSuccess extends DeleteMovieState {
  final String message;

  const DeleteMovieSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class DeleteMovieFailed extends DeleteMovieState {
  final String message;

  const DeleteMovieFailed({required this.message});

  @override
  List<Object> get props => [message];
}
