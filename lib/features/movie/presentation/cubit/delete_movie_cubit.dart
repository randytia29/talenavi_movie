import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/delete_movie.dart';

part 'delete_movie_state.dart';

class DeleteMovieCubit extends Cubit<DeleteMovieState> {
  final DeleteMovie _deleteMovie;

  DeleteMovieCubit({required DeleteMovie deleteMovie})
      : _deleteMovie = deleteMovie,
        super(DeleteMovieInitial());

  void startDeleteMovie(int id) async {
    emit(DeleteMovieLoading());

    final result = await _deleteMovie(Params(id: id));

    result.fold((l) => emit(DeleteMovieFailed(message: l.message)),
        (r) => emit(DeleteMovieSuccess(message: r)));
  }
}
