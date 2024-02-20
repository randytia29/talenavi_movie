import 'package:get_it/get_it.dart';
import 'package:talenavi_movie/features/movie/data/datasources/movie_local_data_source.dart';
import 'package:talenavi_movie/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:talenavi_movie/features/movie/domain/repositories/movie_repository.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/delete_movie.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/get_movie.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/save_movie.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/update_movie.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/add_movie_cubit.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/delete_movie_cubit.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/movie_cubit.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/update_movie_cubit.dart';
import 'package:talenavi_movie/utils/database_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // Bloc

  // Movie
  sl.registerFactory(() => AddMovieCubit(saveMovie: sl()));
  sl.registerFactory(() => MovieCubit(getMovie: sl()));
  sl.registerFactory(() => DeleteMovieCubit(deleteMovie: sl()));
  sl.registerFactory(() => UpdateMovieCubit(updateMovie: sl()));

  // Use cases
  sl.registerLazySingleton(() => SaveMovie(sl()));
  sl.registerLazySingleton(() => GetMovie(sl()));
  sl.registerLazySingleton(() => DeleteMovie(sl()));
  sl.registerLazySingleton(() => UpdateMovie(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(localDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: sl()));

  //! External
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
