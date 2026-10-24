import 'package:equatable/equatable.dart';
import 'package:film_app/movies/domain/entities/geners.dart';

class MovieDetail extends Equatable {
  final String backDropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final List<Geners> genres;

  const MovieDetail({
    required this.genres,
    required this.backDropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
    backDropPath,
    id,
    overview,
    releaseDate,
    runtime,
    runtime,
    title,
    voteAverage,
    genres,
  ];
}
