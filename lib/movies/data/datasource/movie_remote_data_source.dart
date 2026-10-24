import 'package:dio/dio.dart';
import 'package:film_app/core/error/exceptions.dart';
import 'package:film_app/core/network/api_constance.dart';
import 'package:film_app/core/network/error_message_model.dart';
import 'package:film_app/movies/data/models/movie_details_model.dart';
import 'package:film_app/movies/data/models/movie_model.dart';
import 'package:film_app/movies/data/models/recommendation_model.dart';
import 'package:film_app/movies/domain/entities/movie_detail.dart';
import 'package:film_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetail> getMovieDetails(MovieDetailsParameters parameter);
  Future<List<RecommendationModel>> getMovieRecommendation(
    RecommendationParameter parameter,
  );
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  Dio dio = Dio();
  // MovieRemoteDataSource(this.dio);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await dio.get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map((json) => MovieModel.fromJson(json)),
      );
    } else {
      throw ServerExceptions(
        message: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await dio.get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map((json) => MovieModel.fromJson(json)),
      );
    } else {
      throw ServerExceptions(
        message: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await dio.get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map((json) => MovieModel.fromJson(json)),
      );
    } else {
      throw ServerExceptions(
        message: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
    MovieDetailsParameters parameter,
  ) async {
    final response = await dio.get(
      ApiConstance.movieDetailsPath(parameter.movieId),
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
        message: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(
    RecommendationParameter parameter,
  ) async {
    final response = await dio.get(
      ApiConstance.movieRecommendationPath(parameter.id),
    );
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        response.data['results'].map(
          (json) => RecommendationModel.fromJson(json),
        ),
      );
    } else {
      throw ServerExceptions(
        message: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
