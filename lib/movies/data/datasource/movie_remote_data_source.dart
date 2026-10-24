import 'package:dio/dio.dart';
import 'package:film_app/core/error/exceptions.dart';
import 'package:film_app/core/network/error_message_model.dart';
import 'package:film_app/movies/data/datasource/movie_api_service.dart';
import 'package:film_app/movies/data/models/movie_details_model.dart';
import 'package:film_app/movies/data/models/movie_model.dart';
import 'package:film_app/movies/data/models/recommendation_model.dart';
import 'package:film_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter);
  Future<List<RecommendationModel>> getMovieRecommendation(RecommendationParameter parameter);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  // نحقن الـ ApiService بدلاً من الـ Dio المباشر
  final MovieApiService apiService;
  MovieRemoteDataSource(this.apiService);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await apiService.getNowPlayingMovies();
      return response.results; // نرجع المصفوفة النظيفة للـ Domain
    } on DioException catch (e) {
      throw ServerExceptions(message: ErrorMessageModel.fromJson(e.response?.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await apiService.getPopularMovies();
      return response.results;
    } on DioException catch (e) {
      throw ServerExceptions(message: ErrorMessageModel.fromJson(e.response?.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await apiService.getTopRatedMovies();
      return response.results;
    } on DioException catch (e) {
      throw ServerExceptions(message: ErrorMessageModel.fromJson(e.response?.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter) async {
    try {
      // تفاصيل الفيلم ترجع مباشرة بدون غلاف results
      return await apiService.getMovieDetails(parameter.movieId); 
    } on DioException catch (e) {
      throw ServerExceptions(message: ErrorMessageModel.fromJson(e.response?.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(RecommendationParameter parameter) async {
    try {
      final response = await apiService.getMovieRecommendation(parameter.id);
      return response.results;
    } on DioException catch (e) {
      throw ServerExceptions(message: ErrorMessageModel.fromJson(e.response?.data));
    }
  }
}