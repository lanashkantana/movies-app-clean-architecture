import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:film_app/core/utils/enums.dart';
import 'package:film_app/movies/domain/entities/movie_detail.dart';
import 'package:film_app/movies/domain/entities/recommendation.dart';
import 'package:film_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUsecase getMovieRecommendationUsecase;

  MovieDetailsCubit(
    this.getMovieDetailsUseCase,
    this.getMovieRecommendationUsecase,
  ) : super(const MovieDetailsState());

  // 1. دالة جلب التفاصيل (مباشرة وبدون Event)
  Future<void> getMovieDetails(int movieId) async {
    // نستخدم copyWith للحفاظ على التوصيات إن كانت محملة
    emit(state.copyWith(movieDetailState: RequestState.loading));

    final result = await getMovieDetailsUseCase(MovieDetailsParameters(movieId: movieId));

    result.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailState: RequestState.error,
          movieDetailMessage: failure.message,
        ),
      ),
      (movie) => emit(
        state.copyWith(
          movieDetailState: RequestState.loaded,
          movieDetail: movie,
        ),
      ),
    );
  }

  // 2. دالة جلب التوصيات (مباشرة وبدون Event)
  Future<void> getMovieRecommendations(int movieId) async {
    emit(state.copyWith(recommendationState: RequestState.loading));

    final result = await getMovieRecommendationUsecase(RecommendationParameter(id: movieId));

    result.fold(
      (failure) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: failure.message,
        ),
      ),
      (recommendations) => emit(
        state.copyWith(
          recommendationState: RequestState.loaded,
          recommendation: recommendations,
        ),
      ),
    );
  }
}