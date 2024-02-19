import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:talenavi_movie/features/movie/data/datasources/movie_local_data_source.dart';
import 'package:talenavi_movie/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:talenavi_movie/features/movie/domain/repositories/movie_repository.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/get_movie.dart';
import 'package:talenavi_movie/features/movie/domain/usecases/save_movie.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/add_movie_cubit.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/movie_cubit.dart';
import 'package:talenavi_movie/utils/database_helper.dart';

import 'features/home/data/datasources/home_remote_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_user.dart';
import 'features/home/presentation/cubit/user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // Bloc

  // Home
  sl.registerFactory(() => UserCubit(getUser: sl()));

  // Movie
  sl.registerFactory(() => AddMovieCubit(saveMovie: sl()));
  sl.registerFactory(() => MovieCubit(getMovie: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => SaveMovie(sl()));
  sl.registerLazySingleton(() => GetMovie(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(localDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: sl()));

  //! External
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  sl.registerLazySingleton(() => http.Client());
}
