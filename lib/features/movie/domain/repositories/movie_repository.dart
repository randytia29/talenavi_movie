import 'package:dartz/dartz.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';

import '../../../../core/failure/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, String>> saveMovie(MovieModel movie);
  Future<Either<Failure, List<MovieModel>>> getMovie(String keyword);
  Future<Either<Failure, String>> deleteMovie(int id);
  Future<Either<Failure, String>> updateMovie(MovieModel movie);
}
