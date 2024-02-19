import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int? id;
  final String? title;
  final dynamic director;
  final bool? summary;
  final List<String>? genres;

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
