import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talenavi_movie/core/exception/exception.dart';
import 'package:talenavi_movie/features/movie/data/datasources/movie_local_data_source.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MovieLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = MovieLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  const tMovieModel = MovieModel(
      id: 1,
      title: 'spiderman',
      director: 'stanlee',
      summary: 'awesome',
      genres: 'Action');
  const tKeyword = '';
  const tMovieMap = {
    'id': 1,
    'title': 'spiderman',
    'director': 'stanlee',
    'summary': 'awesome',
    'genres': 'Action'
  };

  group('save movie', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertMovie(tMovieModel))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.saveMovie(tMovieModel);
      // assert
      expect(result, 'Movie added');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertMovie(tMovieModel)).thenThrow(Exception());
      // act
      final call = dataSource.saveMovie(tMovieModel);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove movie', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeMovie(1)).thenAnswer((_) async => 1);
      // act
      final result = await dataSource.deleteMovie(1);
      // assert
      expect(result, 'Movie Removed');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeMovie(1)).thenThrow(Exception());
      // act
      final call = dataSource.deleteMovie(1);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('update movie', () {
    test('should return success message when update from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.updateMovie(tMovieModel))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.updateMovie(tMovieModel);
      // assert
      expect(result, 'Movie Updated');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.updateMovie(tMovieModel)).thenThrow(Exception());
      // act
      final call = dataSource.updateMovie(tMovieModel);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('get movies', () {
    test('should return list of MovieTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getMovies(tKeyword))
          .thenAnswer((_) async => [tMovieMap]);
      // act
      final result = await dataSource.getMovie(tKeyword);
      // assert
      expect(result, [tMovieModel]);
    });

    test('should throw DatabaseException when get from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.getMovies(tKeyword)).thenThrow(Exception());
      // act
      final call = dataSource.getMovie(tKeyword);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });
}
