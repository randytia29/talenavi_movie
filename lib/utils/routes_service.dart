import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';
import 'package:talenavi_movie/features/movie/domain/entities/movie.dart';
import 'package:talenavi_movie/features/movie/presentation/screen/form_screen.dart';

import '../features/movie/presentation/screen/home_screen.dart';

class RoutesService {
  static CustomTransitionPage _buildPageWithDefaultTransition(
          {required Widget child}) =>
      CustomTransitionPage(
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.easeIn));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

  static GoRouter goRouter = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) =>
            _buildPageWithDefaultTransition(child: const HomeScreen()),
        routes: [
          GoRoute(
            path: 'form',
            name: 'form',
            pageBuilder: (context, state) => _buildPageWithDefaultTransition(
              child: FormScreen(
                movie: state.extra as Movie?,
              ),
            ),
          )
        ],
      )
    ],
  );
}
