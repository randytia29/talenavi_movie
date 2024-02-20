import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/get_movie.dart';

import '../../data/models/movie_model.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetMovie _getMovie;

  MovieCubit({required GetMovie getMovie})
      : _getMovie = getMovie,
        super(MovieState.initial());

  void fetchMovie({String? keyword}) async {
    final result = await _getMovie(Params(keyword: keyword ?? ''));

    result.fold((l) => null, (r) => emit(state.movieCopyWith(movies: r)));
  }
}
