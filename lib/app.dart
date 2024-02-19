import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenavi_movie/features/movie/presentation/cubit/movie_cubit.dart';

import 'sl.dart';
import 'theme_manager/theme_data_manager.dart';
import 'utils/routes_service.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieCubit>(),
      child: MaterialApp.router(
        title: 'Reqres',
        theme: getApplicationThemeData(context),
        routerConfig: RoutesService.goRouter,
      ),
    );
  }
}
