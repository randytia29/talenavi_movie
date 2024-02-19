import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

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

  // Use cases
  sl.registerLazySingleton(() => GetUser(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
}
