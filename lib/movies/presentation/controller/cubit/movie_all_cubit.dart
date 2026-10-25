import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:film_app/core/usecase/base_usecase.dart';
import 'package:film_app/core/utils/enums.dart';
import 'package:film_app/movies/domain/entities/movie.dart';
import 'package:film_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

part 'movie_all_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesCubit(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState());

  // 1. جلب الأفلام الحالية
  Future<void> getNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingState: RequestState.loading));

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

  // 2. جلب الأفلام الشائعة
  Future<void> getPopularMovies() async {
    emit(state.copyWith(popularState: RequestState.loading));

    final result = await getPopularMoviesUsecase(const NoParameters());

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

  // 3. جلب الأفلام الأعلى تقييماً
  Future<void> getTopRatedMovies() async {
    emit(state.copyWith(topRatedState: RequestState.loading));

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
