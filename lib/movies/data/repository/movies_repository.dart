import 'package:dartz/dartz.dart';
import 'package:film_app/core/error/exceptions.dart';
import 'package:film_app/core/error/failure.dart';
import 'package:film_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:film_app/movies/domain/entities/movie.dart';
import 'package:film_app/movies/domain/entities/movie_detail.dart';
import 'package:film_app/movies/domain/entities/recommendation.dart';
import 'package:film_app/movies/domain/repository/base_movies_repository.dart';
import 'package:film_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

class MoviesRepository implements BaseMoviesRepository {
  final BaseMovieRemoteDataSource remoteDataSource;

  MoviesRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await remoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.message.statusMessage));
    }
    // return Null;
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await remoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.message.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await remoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.message.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameters parameter)async {
    try {
      final result = await remoteDataSource.getMovieDetails(parameter);
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.message.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendations(RecommendationParameter parameter) async{
        try {
      final result = await remoteDataSource.getMovieRecommendation(parameter);
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(failure.message.statusMessage));
    }
  }

}
