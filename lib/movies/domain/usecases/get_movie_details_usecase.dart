import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:film_app/core/error/failure.dart';
import 'package:film_app/core/usecase/base_usecase.dart';
import 'package:film_app/movies/domain/entities/movie_detail.dart';
import 'package:film_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUsecase<MovieDetail, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(
    MovieDetailsParameters parameter,
  ) async {
    return await baseMoviesRepository.getMovieDetails(parameter);

    //! if i have many attttt
    //? Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters m) async {
    //?  return await baseMoviesRepository.getMovieDetails(m);
  }
}

//! if i have many parameter not one
//! i could to  create model for all attreibutes

class MovieDetailsParameters extends Equatable {
  final int movieId;
  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [id];
}
