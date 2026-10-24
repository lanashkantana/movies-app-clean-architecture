import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:film_app/core/utils/enums.dart';
import 'package:film_app/movies/domain/entities/movie_detail.dart';
import 'package:film_app/movies/domain/entities/recommendation.dart';
import 'package:film_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';


part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUsecase getMovieRecommendationUsecase;


  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getMovieRecommendationUsecase) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRemmendationEvent>(_getMovieRemmendationEvent);

  }


  FutureOr<void> _getMovieDetailsEvent(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    //  fire the the ui i have state that the data is loading and we will show the loading indicator

    emit(const MovieDetailsState(movieDetailState: RequestState.loading));
    // print("loading")

    final result = await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.movieId));

    result.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailState: RequestState.error,
          movieDetailMessage: failure.message,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          movieDetailState: RequestState.loaded,
          movieDetail: movies,
        ),
      
      ),
    );
  }

  FutureOr<void> _getMovieRemmendationEvent(GetMovieRemmendationEvent event, Emitter<MovieDetailsState> emit) async{


   emit(const MovieDetailsState(recommendationState: RequestState.loading));
    // print("loading")

    final result = await getMovieRecommendationUsecase(RecommendationParameter(id: event.movieId));

    result.fold(
      (failure) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMesaage: failure.message,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          recommendationState: RequestState.loaded,
          recommendation: movies,
        ),
      
      ),
    );







  }
}
