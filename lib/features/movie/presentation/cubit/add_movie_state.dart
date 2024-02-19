part of 'add_movie_cubit.dart';

sealed class AddMovieState extends Equatable {
  const AddMovieState();

  @override
  List<Object> get props => [];
}

final class AddMovieInitial extends AddMovieState {}

final class AddMovieLoading extends AddMovieState {}

final class AddMovieSuccess extends AddMovieState {
  final String message;

  const AddMovieSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddMovieFailed extends AddMovieState {
  final String message;

  const AddMovieFailed({required this.message});

  @override
  List<Object> get props => [message];
}
