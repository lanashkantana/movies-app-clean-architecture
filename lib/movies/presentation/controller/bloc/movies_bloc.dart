import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:film_app/core/usecase/base_usecase.dart';
import 'package:film_app/core/utils/enums.dart';

import 'package:film_app/movies/domain/entities/movie.dart';
import 'package:film_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    // ont the first event we will get the now playing movies

    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }
  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    //  fire the the ui i have state that the data is loading and we will show the loading indicator

    emit(const MoviesState(nowPlayingState: RequestState.loading));
    // print("loading")

    final result = await getNowPlayingMoviesUsecase(const NoParameters());

    result.fold(
      (failure) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowplayingMessage: failure.message,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: movies,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    {
      emit(const MoviesState(popularState: RequestState.loading));

      final result = await getPopularMoviesUsecase(const NoParameters());

      // emit(const MoviesState(popularState: RequestState.loaded));

      result.fold(
        (failure) => emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: failure.message,
          ),
        ),
        (movies) => emit(
          state.copyWith(
            popularState: RequestState.loaded,
            getPopularMovies: movies,
          ),
        ),
      );
    }
  }

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    {
      emit(const MoviesState(topRatedState: RequestState.loading));

      final result = await getTopRatedMoviesUsecase(const NoParameters());

      result.fold(
        (failure) => emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: failure.message,
          ),
        ),
        (movies) => emit(
          state.copyWith(
            topRatedState: RequestState.loaded,
            getTopRatedMovies: movies,
          ),
        ),
      );
    }
  }
}
