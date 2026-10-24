import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:film_app/core/error/failure.dart';
import 'package:film_app/core/usecase/base_usecase.dart';
import 'package:film_app/movies/domain/entities/recommendation.dart';
import 'package:film_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendationUsecase
    extends BaseUsecase<List<Recommendation>, RecommendationParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
    RecommendationParameter parameters,
  ) async {
    return await baseMoviesRepository.getMovieRecommendations(parameters);
  }
}

class RecommendationParameter extends Equatable {
  final int id;

  const RecommendationParameter({required this.id});

  @override
  List<Object?> get props => [id];
}
