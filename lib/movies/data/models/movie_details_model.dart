import 'package:film_app/movies/data/models/geners_model.dart';
import 'package:film_app/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.genres,
    required super.backDropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      genres: List<GenersModel>.from(
        json['genres'].map((x) => GenersModel.fromJson(x)),
      ),
      backDropPath: json['backdrop_path'],
      id: json['id'] as int,
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'] as int,
      title: json['title'],
      voteAverage: (json['vote_average'] as num).toDouble(),
    );
  }
}
