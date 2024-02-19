import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/save_movie.dart';

part 'add_movie_state.dart';

class AddMovieCubit extends Cubit<AddMovieState> {
  final SaveMovie _saveMovie;

  AddMovieCubit({required SaveMovie saveMovie})
      : _saveMovie = saveMovie,
        super(AddMovieInitial());

  void startSaveMovie(MovieModel movie) async {
    emit(AddMovieLoading());

    final result = await _saveMovie(Params(movie: movie));

    result.fold((l) => emit(AddMovieFailed(message: l.message)),
        (r) => emit(AddMovieSuccess(message: r)));
  }
}
