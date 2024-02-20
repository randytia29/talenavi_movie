import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talenavi_movie/features/movie/data/models/movie_model.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/get_movie.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetMovie usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetMovie(mockMovieRepository);
  });

  const tKeyword = '';
  const tMovie = [
    MovieModel(
        id: 1,
        title: 'title',
        director: 'director',
        summary: 'summary',
        genres: 'Drama,Action')
  ];

  test('should get movie from the repository', () async {
    // arrange
    when(mockMovieRepository.getMovie(tKeyword))
        .thenAnswer((_) async => const Right(tMovie));

    // act
    final result = await usecase(const Params(keyword: tKeyword));

    // assert
    expect(result, const Right(tMovie));
  });
}
