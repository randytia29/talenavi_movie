import 'package:dartz/dartz.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';

import '../../../../core/failure/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, String>> saveMovie(MovieModel movie);
}
