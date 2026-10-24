import 'package:film_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
 const  MovieModel({required super.id, required super.title, required super.backDropPath, required super.genreIds, required super.overview, required super.voteAverage, required super.releaseDate});





factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backDropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      overview: json['overview'],
      /// todo::check this 
      
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'],
    );
  }
  
  




}