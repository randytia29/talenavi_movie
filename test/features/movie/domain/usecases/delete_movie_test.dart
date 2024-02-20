import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/delete_movie.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late DeleteMovie usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = DeleteMovie(mockMovieRepository);
  });

  const tId = 1;

  test('should delete movie from the repository', () async {
    // arrange
    when(mockMovieRepository.deleteMovie(tId))
        .thenAnswer((_) async => const Right(''));

    // act
    final result = await usecase(const Params(id: tId));

    // assert
    expect(result, const Right(''));
  });
}
