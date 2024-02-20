import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';
import 'package:talenavi_movie/features/movie/domain/entities/movie.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tMovieModel = MovieModel(
      id: 1,
      title: 'spiderman',
      director: 'stanlee',
      summary: 'awesome',
      genres: 'Action');

  test('should be a subclass of Movie entity', () {
    expect(tMovieModel, isA<Movie>());
  });

  group('fromJson', () {
    test('should return a valid movie model', () {
      final jsonMap = json.decode(fixture('movie.json'));
      final result = MovieModel.fromJson(jsonMap);

      expect(result, tMovieModel);
    });
  });

  group('toJson', () {
    test('should return a JSON Movie map', () {
      final result = tMovieModel.toJson();

      final expectedMap = {
        "id": 1,
        "title": "spiderman",
        "director": "stanlee",
        "summary": "awesome",
        "genres": "Action"
      };

      expect(result, expectedMap);
    });
  });
}
