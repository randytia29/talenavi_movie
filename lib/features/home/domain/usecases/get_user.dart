import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/home_repository.dart';

class GetUser implements Usecase<List<User>, Params> {
  final HomeRepository repository;

  GetUser(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(Params params) async =>
      await repository.getUser(params.page);
}

class Params {
  final int page;

  const Params({required this.page});
}
