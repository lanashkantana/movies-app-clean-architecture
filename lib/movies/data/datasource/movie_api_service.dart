import 'package:dio/dio.dart';
import 'package:film_app/movies/data/models/movie_details_model.dart';
import 'package:film_app/movies/data/models/movie_model.dart';
import 'package:film_app/movies/data/models/recommendation_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:film_app/core/network/api_constance.dart';

part 'movie_api_service.g.dart';

// 1. غلاف لنتائج الأفلام (لأن TMDB يضعها داخل "results")
@JsonSerializable()
class MovieResponse {
  final List<MovieModel> results;
  MovieResponse(this.results);
  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
}

// 2. غلاف لنتائج التوصيات
@JsonSerializable()
class RecommendationResponse {
  final List<RecommendationModel> results;
  RecommendationResponse(this.results);
  factory RecommendationResponse.fromJson(Map<String, dynamic> json) => _$RecommendationResponseFromJson(json);
}

// 3. عميل Retrofit السحري
@RestApi(baseUrl:ApiConstance.baseUrl)
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  @GET(ApiConstance.nowPlayingMoviesPath)
  Future<MovieResponse> getNowPlayingMovies();

  @GET(ApiConstance.popularMoviesPath)
  Future<MovieResponse> getPopularMovies();

  @GET(ApiConstance.topRatedMoviesPath)
  Future<MovieResponse> getTopRatedMovies();


  @GET(ApiConstance.movieDetailsPath)
  Future<MovieDetailsModel> getMovieDetails(@Path('movie_id') int movieId);

  @GET(ApiConstance.movieRecommendationPath)
  Future<RecommendationResponse> getMovieRecommendation(@Path('movie_id') int movieId);
}