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
  Future<Either<Failure, List<MovieModel>>> getMovie() async {
    try {
      final result = await localDataSource.getMovie();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
  //   try {
  //     final result = await remoteDataSource.getNowPlayingMovies();
  //     return Right(result.map((model) => model.toEntity()).toList());
  //   } on ServerException {
  //     return Left(ServerFailure(''));
  //   } on SocketException {
  //     return Left(ConnectionFailure('Failed to connect to the network'));
  //   } on TlsException catch (e) {
  //     return Left(CommonFailure('Certificated not valid\n${e.message}'));
  //   } catch (e) {
  //     return Left(CommonFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, MovieDetail>> getMovieDetail(int id) async {
  //   try {
  //     final result = await remoteDataSource.getMovieDetail(id);
  //     return Right(result.toEntity());
  //   } on ServerException {
  //     return Left(ServerFailure(''));
  //   } on SocketException {
  //     return Left(ConnectionFailure('Failed to connect to the network'));
  //   } on TlsException catch (e) {
  //     return Left(CommonFailure('Certificated not valid\n${e.message}'));
  //   } catch (e) {
  //     return Left(CommonFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<Movie>>> getMovieRecommendations(int id) async {
  //   try {
  //     final result = await remoteDataSource.getMovieRecommendations(id);
  //     return Right(result.map((model) => model.toEntity()).toList());
  //   } on ServerException {
  //     return Left(ServerFailure(''));
  //   } on SocketException {
  //     return Left(ConnectionFailure('Failed to connect to the network'));
  //   } on TlsException catch (e) {
  //     return Left(CommonFailure('Certificated not valid\n${e.message}'));
  //   } catch (e) {
  //     return Left(CommonFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<Movie>>> getPopularMovies() async {
  //   try {
  //     final result = await remoteDataSource.getPopularMovies();
  //     return Right(result.map((model) => model.toEntity()).toList());
  //   } on ServerException {
  //     return Left(ServerFailure(''));
  //   } on SocketException {
  //     return Left(ConnectionFailure('Failed to connect to the network'));
  //   } on TlsException catch (e) {
  //     return Left(CommonFailure('Certificated not valid\n${e.message}'));
  //   } catch (e) {
  //     return Left(CommonFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
  //   try {
  //     final result = await remoteDataSource.getTopRatedMovies();
  //     return Right(result.map((model) => model.toEntity()).toList());
  //   } on ServerException {
  //     return Left(ServerFailure(''));
  //   } on SocketException {
  //     return Left(ConnectionFailure('Failed to connect to the network'));
  //   } on TlsException catch (e) {
  //     return Left(CommonFailure('Certificated not valid\n${e.message}'));
  //   } catch (e) {
  //     return Left(CommonFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
  //   try {
  //     final result = await remoteDataSource.searchMovies(query);
  //     return Right(result.map((model) => model.toEntity()).toList());
  //   } on ServerException {
  //     return Left(ServerFailure(''));
  //   } on SocketException {
  //     return Left(ConnectionFailure('Failed to connect to the network'));
  //   } on TlsException catch (e) {
  //     return Left(CommonFailure('Certificated not valid\n${e.message}'));
  //   } catch (e) {
  //     return Left(CommonFailure(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, String>> saveWatchlist(MovieDetail movie) async {
  //   try {
  //     final result =
  //         await localDataSource.insertWatchlist(MovieTable.fromEntity(movie));
  //     return Right(result);
  //   } on DatabaseException catch (e) {
  //     return Left(DatabaseFailure(e.message));
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // @override
  // Future<Either<Failure, String>> removeWatchlist(MovieDetail movie) async {
  //   try {
  //     final result =
  //         await localDataSource.removeWatchlist(MovieTable.fromEntity(movie));
  //     return Right(result);
  //   } on DatabaseException catch (e) {
  //     return Left(DatabaseFailure(e.message));
  //   }
  // }

  // @override
  // Future<bool> isAddedToWatchlist(int id) async {
  //   final result = await localDataSource.getMovieById(id);
  //   return result != null;
  // }

  // @override
  // Future<Either<Failure, List<Movie>>> getWatchlistMovies() async {
  //   final result = await localDataSource.getWatchlistMovies();
  //   return Right(result.map((data) => data.toEntity()).toList());
  // }
}
