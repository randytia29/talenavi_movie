import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';

import '../../../../core/exception/exception.dart';
import '../../../../utils/database_helper.dart';

abstract class MovieLocalDataSource {
  Future<String> saveMovie(MovieModel movie);
  Future<List<MovieModel>> getMovie(String keyword);
  Future<String> deleteMovie(int id);
  Future<String> updateMovie(MovieModel movie);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final DatabaseHelper databaseHelper;

  MovieLocalDataSourceImpl({required this.databaseHelper});

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

  @override
  Future<List<MovieModel>> getMovie(String keyword) async {
    try {
      final data = await databaseHelper.getMovies(keyword);
      final movies = data.map((e) => MovieModel.fromJson(e)).toList();

      return movies;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
