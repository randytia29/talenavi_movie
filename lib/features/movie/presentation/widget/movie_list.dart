import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenavi_movie/theme_manager/space_manager.dart';

import '../cubit/movie_cubit.dart';
import 'movie_card.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, movieState) {
        final movies = movieState.movies;

        return ListView.separated(
          itemBuilder: (_, index) {
            final movie = movies[index];

            return MovieCard(movie: movie);
          },
          separatorBuilder: (_, index) => 16.0.spaceY,
          itemCount: movies.length,
        );
      },
    );
  }
}
