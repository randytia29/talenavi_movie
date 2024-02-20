import 'package:dartz/dartz.dart';
import 'package:talenavi_movie/features/movie/domain/repositories/movie_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';

class DeleteMovie implements Usecase<String, Params> {
  final MovieRepository repository;

  DeleteMovie(this.repository);

  @override
  Future<Either<Failure, String>> call(Params params) async =>
      await repository.deleteMovie(params.id);
}

class Params {
  final int id;

  const Params({required this.id});
}
