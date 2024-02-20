import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/update_movie.dart';

part 'update_movie_state.dart';

class UpdateMovieCubit extends Cubit<UpdateMovieState> {
  final UpdateMovie _updateMovie;

  UpdateMovieCubit({required UpdateMovie updateMovie})
      : _updateMovie = updateMovie,
        super(UpdateMovieInitial());

  void startUpdateMovie(MovieModel movie) async {
    emit(UpdateMovieLoading());

    final result = await _updateMovie(Params(movie: movie));

    result.fold((l) => emit(UpdateMovieFailed(message: l.message)),
        (r) => emit(UpdateMovieSuccess(message: r)));
  }
}
