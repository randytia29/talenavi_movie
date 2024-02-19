import 'package:dartz/dartz.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';
import 'package:talenavi_movie/features/movie/domain/repositories/movie_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetMovie implements Usecase<List<MovieModel>, Params> {
  final MovieRepository repository;

  GetMovie(this.repository);

  @override
  Future<Either<Failure, List<MovieModel>>> call(Params params) async =>
      await repository.getMovie();
}

class Params {}
