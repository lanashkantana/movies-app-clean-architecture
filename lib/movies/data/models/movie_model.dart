import 'package:film_app/movies/domain/entities/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Movie {
 const  MovieModel({required super.id, required super.title, required super.backDropPath, required super.genreIds, required super.overview, required super.voteAverage, required super.releaseDate});


factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  
  




}