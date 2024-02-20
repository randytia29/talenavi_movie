import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';

import '../../../../core/exception/exception.dart';
import '../../../../utils/database_helper.dart';

abstract class MovieLocalDataSource {
  Future<String> saveMovie(MovieModel movie);
  Future<List<MovieModel>> getMovie();
  Future<String> deleteMovie(int id);
  Future<String> updateMovie(MovieModel movie);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final DatabaseHelper databaseHelper;

  MovieLocalDataSourceImpl({required this.databaseHelper});

  // @override
  // Future<String> insertWatchlist(MovieTable movie) async {
  //   try {
  //     await databaseHelper.insertWatchlist(movie);
  //     return 'Added to Watchlist';
  //   } catch (e) {
  //     throw DatabaseException(e.toString());
  //   }
  // }

  // @override
  // Future<String> removeWatchlist(MovieTable movie) async {
  //   try {
  //     await databaseHelper.removeWatchlist(movie);
  //     return 'Removed from Watchlist';
  //   } catch (e) {
  //     throw DatabaseException(e.toString());
  //   }
  // }

  // @override
  // Future<MovieTable?> getMovieById(int id) async {
  //   final result = await databaseHelper.getMovieById(id);
  //   if (result != null) {
  //     return MovieTable.fromMap(result);
  //   } else {
  //     return null;
  //   }
  // }

  // @override
  // Future<List<MovieTable>> getWatchlistMovies() async {
  //   final result = await databaseHelper.getWatchlistMovies();
  //   return result.map((data) => MovieTable.fromMap(data)).toList();
  // }

  @override
  Future<String> saveMovie(MovieModel movie) async {
    try {
      await databaseHelper.insertMovie(movie);
      return 'Movie added';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getMovie() async {
    try {
      final data = await databaseHelper.getMovies();
      final movies = data.map((e) => MovieModel.fromJson(e)).toList();

      return movies;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> deleteMovie(int id) async {
    try {
      await databaseHelper.removeMovie(id);
      return 'Movie Removed';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> updateMovie(MovieModel movie) async {
    try {
      await databaseHelper.updateMovie(movie);
      return 'Movie Updated';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
