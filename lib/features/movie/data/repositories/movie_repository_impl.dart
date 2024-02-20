import 'package:dartz/dartz.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:talenavi_movie/core/failure/failure.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';

import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_local_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, String>> saveMovie(MovieModel movie) async {
    try {
      final result = await localDataSource.saveMovie(movie);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteMovie(int id) async {
    try {
      final result = await localDataSource.deleteMovie(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateMovie(MovieModel movie) async {
    try {
      final result = await localDataSource.updateMovie(movie);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getMovie(String keyword) async {
    try {
      final result = await localDataSource.getMovie(keyword);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
