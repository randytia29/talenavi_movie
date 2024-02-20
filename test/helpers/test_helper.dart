import 'package:mockito/annotations.dart';
import 'package:talenavi_movie/features/movie/data/datasources/movie_local_data_source.dart';
import 'package:talenavi_movie/features/movie/domain/repositories/movie_repository.dart';
import 'package:talenavi_movie/utils/database_helper.dart';

@GenerateMocks([MovieRepository, MovieLocalDataSource, DatabaseHelper])
void main() {}
