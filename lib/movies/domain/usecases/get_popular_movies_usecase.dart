import 'package:dartz/dartz.dart';
import 'package:film_app/core/error/failure.dart';
import 'package:film_app/core/usecase/base_usecase.dart';
import 'package:film_app/movies/domain/entities/movie.dart';
import 'package:film_app/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUsecase extends BaseUsecase<List<Movie>,NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUsecase(this.baseMoviesRepository);
@override
   Future<Either<Failure, List<Movie>>>  call(NoParameters noParameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}