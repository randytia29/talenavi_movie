import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/update_movie.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late UpdateMovie usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = UpdateMovie(mockMovieRepository);
  });

  const tMovie = MovieModel(
      id: 1,
      title: 'title',
      director: 'director',
      summary: 'summary',
      genres: 'Drama,Action');

  test('should update movie from the repository', () async {
    // arrange
    when(mockMovieRepository.updateMovie(tMovie))
        .thenAnswer((_) async => const Right(''));

    // act
    final result = await usecase(const Params(movie: tMovie));

    // assert
    expect(result, const Right(''));
  });
}
