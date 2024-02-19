import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int? id;
  final String? title;
  final String? director;
  final String? summary;
  final String? genres;

  const Movie({
    this.id,
    this.title,
    this.director,
    this.summary,
    this.genres,
  });

  @override
  List<Object?> get props => [id, title, director, summary, genres];
}
