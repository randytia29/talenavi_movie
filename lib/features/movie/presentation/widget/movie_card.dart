import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talenavi_movie/features/movie/domain/entities/movie.dart';
import 'package:talenavi_movie/theme_manager/space_manager.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => GoRouter.of(context).goNamed('form', extra: movie),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              movie.title ?? '-',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(movie.director ?? '-'),
            16.0.spaceY,
            Align(
              alignment: Alignment.centerRight,
              child: Text(convertGenres(movie.genres)),
            )
          ],
        ),
      ),
    );
  }

  String convertGenres(String? genres) {
    if (genres == null) {
      return '';
    }

    return genres.replaceFirst(',', ' / ');
  }
}
