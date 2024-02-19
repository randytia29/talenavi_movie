import 'package:talenavi_movie/features/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.director,
    required super.summary,
    required super.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        director: json["director"],
        summary: json["summary"],
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "director": director,
        "summary": summary,
        "genres":
            genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
      };
}
