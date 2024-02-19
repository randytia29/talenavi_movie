import 'package:dartz/dartz.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';
import 'package:talenavi_movie/features/movie/domain/repositories/movie_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';

class SaveMovie implements Usecase<String, Params> {
  final MovieRepository repository;

  SaveMovie(this.repository);

  @override
  Future<Either<Failure, String>> call(Params params) async =>
      await repository.saveMovie(params.movie);
}

class Params {
  final MovieModel movie;

  const Params({required this.movie});
}
