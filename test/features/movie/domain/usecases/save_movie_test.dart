import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/save_movie.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late SaveMovie usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SaveMovie(mockMovieRepository);
  });

  const tMovie = MovieModel(
      id: 1,
      title: 'title',
      director: 'director',
      summary: 'summary',
      genres: 'Drama,Action');

  test('should save movie from the repository', () async {
    // arrange
    when(mockMovieRepository.saveMovie(tMovie))
        .thenAnswer((_) async => const Right(''));

    // act
    final result = await usecase(const Params(movie: tMovie));

    // assert
    expect(result, const Right(''));
  });
}
