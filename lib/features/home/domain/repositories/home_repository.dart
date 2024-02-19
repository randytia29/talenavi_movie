import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<User>>> getUser(int page);
}
